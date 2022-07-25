# Auswertung - Aufgabe B

## Auswertung

### `test.erl`

Um alles auszuführen, wird run() ausgeführt. Dort werden alle Worker angelegt, der Logger initialisiert, den Workern ihre Nachbarn zugewiesen und damit gestartet. Nach Auflauf eines Timers werden die Worker gestoppt und das Programm beendet.

### `worker.erl`

Der Worker kann gestartet und gestoppt werden. Beim Starten wird ein neuer Workerprozess erzeugt. Wenn dem Worker in der init()-Methode seine Nachmarn zugeschickt werden, auf die er wartet, fängt dieser an in einem Loop zu arbeiten. Wenn der Worker eine Nachricht erhält, loggt dieser den im Logger und startet den Loop neu. Außerdem sendet der Worker regelmäßig nach einer zufälligen Wartezeit eine Nachricht mit dem Inhalt "Hallo" und einer Zufallszahl an einen Nachbarn. Wenn dies passiert ist, wird nach einem eventuellem Jitter (= Verzögerung durch eine sleep()-Anweisung) das Senden ebenfalls geloggt.

### `mylogger.erl`

Der Logger bekommt durchgehend Logs zugeschickt. Dieser Log beinhaltet den Zeitstempel (Systemzeit), den Sender sowie die Nachricht bestehend aus ("sending"|"received) und einem Objekt mit einer Nachricht und einer Zufallszahl zum Identifizieren. Der Logger loggt alle Nachrichten ohne Sortierung und direkt beim Eintreffen. Deswegen sind die Nachrichten bei einem Einsatz eines Jitters unlogisch - die "received"-Nachrichten kommen manchmal vor den "sending"-Nachrichten.
