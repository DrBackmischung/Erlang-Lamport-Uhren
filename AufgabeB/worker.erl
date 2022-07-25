-module(worker).
-export([start/4, stop/1, peers/2]).

% Diese Funktion startet den Worker und bekommt seinen Namen, sowie den anzusprechenden Logger, seine Sleep dauer und den Jitter übergeben.
start(Name, Logger, Sleep, Jitter) ->
  % Hierbei wird dieser Prozess wirklich gestartet und der Prozess mit dem Aufrufenden verlinkt.
  spawn_link(fun() -> init(Name, Logger, Sleep, Jitter) end).

% Diese Funktion stoppt den Worker.
stop(Worker) ->
  Worker ! stop.

% In dieser Funktion wird der Worker wirklich gestartet. Hierfür bekommt er erneut seinen Namen, den Logger, die Sleep-Dauer und den Jitter übergeben.
init(Name, Log, Sleep, Jitter) ->
  % Der Logger wartet auf die Anmeldungen der anderen Prozesse, um mit diesen zu kommunizieren.
  receive
    {peers, Peers} ->
      % Wenn sich ein anderer Prozess gemeldet hat, wird die Loop gestartet.
      loop(Name, Log, Peers, Sleep, Jitter);
        stop ->
          ok
end.

% Diese Funktion sorgt dafür, dass der Worker die anderen Worker mitgeteilt bekommt.
peers(Wrk, Peers) ->
  % Sende dem aktiven Prozess die anderen Teilnehmer.
  Wrk ! {peers, Peers}.

% Diese Loop ist für die wirkliche Kommunikation zuständig. Dafür wird dieser Funktion der Name, der Logger, die Sleep-Dauer und der Jitter übergeben.
% Zusätzlich wird dieser Funktion ebenefalls seine Peers mitgeteilt, mit welchem kommuniziert werden soll.
loop(Name, Log, Peers, Sleep, Jitter) ->
  % Starte einen Countdown, während gewartet wird, bevor gesendet wird.
  Wait = rand:uniform(Sleep),
  % Warte auf eine Nachricht vom Peer.
  receive
    % Empfange die Nachricht mit dem Inhalt, der Zeit und der Nachricht.
    {msg, Time, Msg} ->
      % Sende die entsprechenden Daten an den Logger, mit der entsprechenden Zeit.
      Log ! {log, Name, Time, {received, Msg}},
      % Starte die Loop erneut. 
      loop(Name, Log, Peers, Sleep, Jitter);
        stop ->
          ok;
    % Sollte ein Error auftauchen, lasse diesen im Logger ausgeben.
    Error ->
      Log ! {log, Name, time, {error, Error}}
    % Nach dem Sleep Counter
    after Wait ->
      % Wähle einen anderen Worker aus, welchem eine Nachricht geschickt werden soll.
      Selected = select(Peers),
      % Hole die aktuelle Systemzeit.
      Time = erlang:system_time(millisecond),
      % Generiere automatisch eine Nachricht mit dem Format "Hello, i".
      Message = {hello, rand:uniform(100)},
      % Sende dem ausgewählten Partner die Nachricht. 
      Selected ! {msg, Time, Message},
      % Warte mit der angegebenen Verzögerung.
      jitter(Jitter),
      % Sende dem Logger die Information darüber, dass eine Nachricht versendet wurde, mit dem entsprechenden Zeitstempel 
      % und allen benötigten Informationen.
        Log ! {log, Name, Time, {sending, Message}},
        % Starte die Loop vom neuen
        loop(Name, Log, Peers, Sleep, Jitter)
end.

% Wähle einen Peer aus, an welchen eine Nachricht gesendet werden soll.
select(Peers) ->
  % Ziehe einen Peer zufällig aus der Liste der gegebenen Partner.
  lists:nth(rand:uniform(length(Peers)), Peers).

% Sollte der Jitter 0 sein, sende sofort.
jitter(0) -> ok;
% Sinst berechne eine zufällige Zeit auf Basis des Jitters und pausiere so lange.
jitter(Jitter) -> timer:sleep(rand:uniform(Jitter)).
