-module(worker).
-export([start/4, stop/1, peers/2]).

% Der Code ist bereits ausführlich in der Teilaufgabe B) kommentiert. Hier werden nur die neuen Teile kommentiert.

start(Name, Logger, Sleep, Jitter) ->
  spawn_link(fun() -> init(Name, Logger, Sleep, Jitter) end).

stop(Worker) ->
  Worker ! stop.

init(Name, Log, Sleep, Jitter) ->
  receive
    {peers, Peers} ->
      loop(Name, Log, Peers, Sleep, Jitter, lamporttime:zero());
    stop ->
      ok
end.

peers(Wrk, Peers) ->
  Wrk ! {peers, Peers}.

% Im Unterschied zur B wird hier der Funktion die aktuelle Systemzeit (im Lamportzeit-Format) übergeben.
loop(Name, Log, Peers, Sleep, Jitter, LocalTime) ->
  Wait = rand:uniform(Sleep),
  receive
    {msg, Time, Msg} ->
      % Wenn eine Nachricht empfangen wird, vergleiche die mitgesendete Lamportzeit mit der lokalen, wähle die höhere und inkrementiere diese 
      % und setzte diese als die neue lokale Zeit.
      NewLocalTime = lamporttime:inc(lamporttime:merge(Time, LocalTime)),
      % Übergebe die Nachricht an den Logger inklusive der neuen System-Lamportzeit
      Log ! {log, Name, NewLocalTime, {received, Msg}},
      % Starte die Loop erneut, mit der neuen Lamportzeit
      loop(Name, Log, Peers, Sleep, Jitter, NewLocalTime);
    stop ->
          ok;
    Error ->
      Log ! {log, Name, time, {error, Error}}
    after Wait ->
      Selected = select(Peers),
      % Bevor die Nachricht geschickt wird, setze den Zeitstempel aus die aktuelle Lamportzeit und inkrementiere diese.
      NewLocalTime = lamporttime:inc(LocalTime),
      Message = {hello, rand:uniform(100)},
      % Sende die Nachricht an den ausgewählten Peer, inklusive der neuen Zeit.
      Selected ! {msg, NewLocalTime, Message},
      jitter(Jitter),
        % Sende eine Information darüber, dass eine Nachricht gesendet wurde an den Logger, inklusive der Zeit im Feld NewLocalTime, welche 
        % der Zeitstempel der gesendeten Nachricht ist.
        Log ! {log, Name, NewLocalTime, {sending, Message}},
        loop(Name, Log, Peers, Sleep, Jitter, NewLocalTime)
end.

select(Peers) ->
  lists:nth(rand:uniform(length(Peers)), Peers).

jitter(0) -> ok;
jitter(Jitter) -> timer:sleep(rand:uniform(Jitter)).
