-module(mylogger).
-export([start/1, stop/1]).

% Startet einen neuen Worker
start(Nodes) ->
  spawn_link(fun() -> init(Nodes) end).

% Stoppt den Logger
stop(Logger) ->
  Logger ! stop.

% Initialisiert die Liste der Uhren und start den Loop
init(Nodes) ->
  loop(lamporttime:initClocks(Nodes), []).

% Loop, der durchgehent Nachrichten received und verwaltet
loop(Clocks, Queue) ->

  receive

    % Eine Log-Nachricht kommt an
    {log, From, Time, Msg} ->

        % Die zum Log gehörende Uhr wird in der Liste der Uhren geupdatet, der neue Zeitstempel wird hinterlegt
        UpdatedClocks = lamporttime:updateClocks(From, Time, Clocks),
        % Der kleinste Timestamp wird gesucht, damit geprüft werden kann, ob der momentane Log geloggt werden kann
        CheckedTimestamp = lamporttime:canLog(UpdatedClocks),

        case Time of
            1 ->
              % Wenn der Timestamp 1 ist, kann die Nachricht so geloggt werden
                SortedQueue = lists:keysort(2, Queue),
                log(From, Time, Msg);
            _ ->
              % Sonst wird der Log sortiert der Queue hinzugefügt
                SortedQueue = lists:keysort(2, Queue ++ [{From, Time, Msg}])
        end,

        % Die Liste aller Logs momentan wird geteilt:
        % Die ReadyQueue beinhaltet alle Logs, die jetzt geloggt werden können
        % Die UpdatedQueue beinhaltet alle Logs, die noch nicht geloggt werden können und erst in der nächsten Loop-Iteration erneut geprüft werden müssen
        {ReadyQueue, UpdatedQueue} = partition(SortedQueue, CheckedTimestamp),

        % Alle Logs aus der ReadyQueue werden ausgegeben
        printAll(ReadyQueue),
  
        % Die Liste mit den geupdateten Uhren und die Queue mit den nicht geloggten Logs wird in die nächste Loop-Iteration gegeben
        loop(UpdatedClocks, UpdatedQueue);

    stop ->
        ok

  end.

partition(SortedQueue, CheckedTimestamp) ->
  % Die SortedQueue wird aufgeteilt:
  % Alle Logs mit einem Timestamp, der kleiner als der CheckedTimestamp ist, werden in die erste Liste gespeichert
  % Alle Logs mit einem zu großen Timestamp, werden in der zweiten Liste gespeichert
  lists:splitwith(fun({_, Timestamp, _}) -> 
    lamporttime:leq(Timestamp, CheckedTimestamp)
    end,
  SortedQueue).

printAll(ReadyQueue) ->

  % Alle logs werden hintereinander ausgegeben
  lists:foreach(
    fun({Sender, Timestamp, Message}) -> 
      log(Sender, Timestamp, Message)
    end,
  ReadyQueue).

% Log wird auf dem Standardoutput ausgegeben
log(From, Time, Msg) ->
  io:format("log: ~w ~w ~p~n", [Time, From, Msg]). 
