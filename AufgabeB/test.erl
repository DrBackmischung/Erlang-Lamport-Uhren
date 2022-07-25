-module(test).
-export([run/2]).

% Diese Funktion führt den Test aus. Diese bekommt die Zeit zwischen Nachrichten übergeben durch "sleep" und 
% wie verzerrt die Versendung der Nachricht stattfindet durch "jitter".
run(Sleep, Jitter) ->
  % Hier wird der Logger gestartet und diesem werden die Namen der Worker festgelegt. 
  Log = mylogger:start([einstein, euler, curie, turing]),
  % Hierbei wird ein Worker gestartet, welcher dann A zugewisen wird. Ein Worker bekommt den erstellten Logger übergeben, den Sleep
  % und Jitter Wert. Dies gilt auch für die Definitionen B,C,D.
  A = worker:start(einstein, Log, Sleep, Jitter),
  B = worker:start(euler, Log, Sleep, Jitter),
  C = worker:start(curie, Log, Sleep, Jitter),
  D = worker:start(turing, Log, Sleep, Jitter),
  % Hier wird dem Worker mitgeteilt, mit welchen anderen Prozessen (Workern) dieser Kommunizieren soll. Dies gilt ebenfalls für die folgenden.
  worker:peers(A, [B, C, D]),
  worker:peers(B, [A, C, D]),
  worker:peers(C, [A, B, D]),
  worker:peers(D, [A, B, C]),
  % Hier wird dieser Prozess für 5 Sekunden angehalten
  timer:sleep(5000),
  % Der logger wird gestoppt
  mylogger:stop(Log),
  % Die Worker werden nach und nach gestoppt.
  worker:stop(A),
  worker:stop(B),
  worker:stop(C),
  worker:stop(D).
