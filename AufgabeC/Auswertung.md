# Auswertung - Aufgabe D

## Idee

Die Systemzeit des Loggers soll durch einen Lamporttimestamp ersetzt werden. Dabei bekommt jeder Worker eine eigene Uhr, die wie eine Lamportuhr funktioniert und diesen Zeitstempel an den Logger mitgibt.

## Auswertung

Es ist möglich, Lamportzeitstempel mitzugeben. Dies sorgt jedoch dafür, dass die Zeitstempel zwischen den Workern nicht synchronisiert werden und die Reihenfolge der Logs weder nach der Lamporttime sortiert ist, noch - unter Einsatz eines Jitters - logisch korrekt ist. Manchmal werden bei einem Jittereinsatz die "received"-Nachrichten vor den "sending"-Nachrichten geloggt. Dieses Problem wird in Aufgabe D gelöst.
