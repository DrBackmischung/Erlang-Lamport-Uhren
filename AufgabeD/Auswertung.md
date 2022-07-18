# Auswertung - Aufgabe D

Das Problem, dass Nachrichten trotz Lamporttimestamp nicht sortiert wurden und die Received-Nachricht vor der Sending-Nachricht beim Einsatz von einem Jitter angekommen sind, wurde durch den Einsatz einer "Ready-to-print"-Queue und einer "Holdback"-Queue gelöst. Diese beinhalten Logs, die ausgegeben werden können bzw. noch zu früh für einen Log dran wären.