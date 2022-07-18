# Erlang-Lamport-Uhren
Projektabgabe in Vorlesung EVS - Verteilte Systeme von Gruppe 1

https://www.academia.edu/13950360/Concurrent_Programming_in_ERLANG_Second_Edition

## Grundlagen

Bash/CMD
```shell
erl
```

Erlang CLI
```erlang
c(logger).
c(worker).
c(test).
c(lamporttime). % only in c) and d)
test:run(100,0).
test:run(1000,0).
test:run(1000,10).
test:run(1000,1000).
```
## System

[![Windows](https://svgshare.com/i/ZhY.svg)](https://svgshare.com/i/ZhY.svg)
[![macOS](https://svgshare.com/i/ZjP.svg)](https://svgshare.com/i/ZjP.svg)
[![Linux](https://svgshare.com/i/Zhy.svg)](https://svgshare.com/i/Zhy.svg)

## Aufgabenverteilung

Aufgabe A:
- Gliederung: Nathalie & Betty ✔️
- Summary: Nathalie & Betty
- Video: Mathis
  - Einstieg
  - "Wo finde ich die Dokumentation"
  - "Wir haben eine Dokumentation!"

Aufgabe B:
- Kommentieren: Nathalie & Betty
- Auswertung: Nathalie & Betty
- Video: Tomke
  - Code zeigen, was passiert da?
  - Logs -> Problem! Lösung: Lamportuhren

Aufgabe C:
- Kommentieren: Tomke ✔️
- Auswertung: Tomke
- Code: Tomke
- Video: Betty
  - Wie funktionieren Lamportuhren?
  - Code: Zeitstempel einbauen
  - Logs -> Problem! Lösung: Queues

Aufgabe D:
- Kommentieren: Mathis ✔️
- Auswertung: Mathis ✔️
- Code: Mathis ✔️
- Video: Nathalie
  - Wie sortiert man den Log?
  - Code zeigen
  - Logs -> Kein Problem mehr! Yippie!

Video:
- Schnitt: Tomke
- Catering: Betty
- Mentale Unterstützung: Nathalie
