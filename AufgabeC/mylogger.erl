% Moduldefinition
-module(mylogger).

% Exportierte Methoden
-export([start/1, stop/1]).

% Startet den Logger
start(Nodes) ->
  spawn_link(fun() -> init(Nodes) end).

% Stoppt den Logger
stop(Logger) ->
  Logger ! stop.

% Initialisiert den Logger
init(_) ->
  loop().

% Gibt durchgehend ankommende Log-Nachrichten aus
loop() ->
  receive
    % Beim Empfangen eines Logs wird dieser ausgegeben und erneut mit loop auf neue Logs gewartet
    {log, From, Time, Msg} ->
      log(From, Time, Msg),
      loop();
    % Wenn "stop" empfangen wird, wird "ok" ausgegeben und der loop läuft nicht erneut durch
    stop ->
      ok
end.

% Loggt die Nachricht im Standard-Output (zB Terminal)
log(From, Time, Msg) ->
  io:format("log: ~w ~w ~p~n", [Time, From, Msg]). 
