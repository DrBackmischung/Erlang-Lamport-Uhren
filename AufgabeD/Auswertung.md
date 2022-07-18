# Auswertung - Aufgabe D

## Idee

Bisher war es möglich, einen Lamporttimestamp einer Nachricht beizufügen, jedoch waren die Nachrichten teilweise - vor allem mit einem Jitter - nicht sortiert. Das kann gelöst werden, indem eine Liste von Logs gehalten wird, und immer die ausgegeben werden, die von dem Timestamp her bereit sind, geloggt zu werden. Konkret existiert dann eine Liste von Logs, die bei jeder Iteration des Loops in eine "Ready-to-print"-Queue und in eine "Holdback"-Queue geteilt werden. Die "Ready-to-print"-Queue wird dann geloggt, alles in der "Holdback"-Queue wird dann in der nächsten Loop-Iteration berücksichtigt und geprüft. 

## Auswertung

Das Problem, dass Nachrichten trotz Lamporttimestamp nicht sortiert wurden und die Received-Nachricht vor der Sending-Nachricht beim Einsatz von einem Jitter angekommen sind, wurde durch den Einsatz einer "Ready-to-print"-Queue und einer "Holdback"-Queue gelöst. Diese beinhalten Logs, die ausgegeben werden können bzw. noch zu früh für einen Log dran wären. Dies wird in den Logs gezeigt, dabei ist es egal, wie klein der Sleep-Timer und wie groß der Jitter gewählt ist.
