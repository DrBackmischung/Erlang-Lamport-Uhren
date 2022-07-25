-module(mylogger).
-export([start/1, stop/1]).

% Diese Funktion startet den Logger
start(Nodes) ->
  % Hier wird die init Funktion aufgerufen, innerhalb der spawn_link, was dazu führt, dass der Prozess direkt mit dem aufrufenden Verknüpft wird.
  spawn_link(fun() -> init(Nodes) end).

% Wie der Name bereits andeutet stoppt diese Funktion den Logger.
stop(Logger) ->
  Logger ! stop.

% Die Init Funktion des Loggers, welche eine Loop startet.
init(_) ->
  loop().

% Diese Funktion stellt die Loop dar, welche während der gesamten Laufzeit des Loggers ausgeführt wird
loop() ->
  % Die Funktion wartet auf eine eingehende Nachricht, von einem der Worker Prozesse.
  receive
    % Es wird unterschieden, ob die eingehenede Nachricht "stop" oder ein Log ist. Dies funktioniert wie ein "switch case" in Java. In diesem Fall ist es ein Log der Struktur {log, From, Time, Msg}
    {log, From, Time, Msg} ->
      % Die Funktion gibt die Nachricht an die Ausgabefunktion weiter-
      log(From, Time, Msg),
      % Die Loop wird wieder von vorne gestartet.
      loop();
    % Wenn kein Log eingeht, kann die Nachricht ein "stop" sein. Das ist hier der Fall.
    % So die Loop gestoppt wird, soll nur noch "ok" ausgegeben werden.
    stop ->
      ok
end.

% Diese Funktion ist für die eigentliche Ausgabe verantwortlich und nimmt den Absender, die Zeit und Nachricht entgegen.
log(From, Time, Msg) ->
  % Bei der io:format FUnktion handelt es sich um die Standard-Ausgabefunktion von Erlang.
  % Hierbei wird ein String durch "~w" dargestellt, und "~n" stellt einen Zeilenumbruch dar, während "~p" dafür sorgt, 
  % dass ein Zeilenumbruch eingefügt wird, so die Ausgabe zu lang werden würde und nicht in einer Zeile dargestellt werden kann.
  io:format("log: ~w ~w ~p~n", [Time, From, Msg]). 
