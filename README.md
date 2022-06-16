# Erlang-Lamport-Uhren
Projektabgabe in Vorlesung EVS - Verteilte Systeme von Gruppe 1

# Grundlagen

```erlang
c(logger).
c(worker).
c(test).
c(lamporttime). %only in c) and d)
test:run(1000,0).
```

# Portfolio-Prufung zur Vorlesung ”Verteilte Systeme” ¨
Kurs: WWI20SEB – 4. Semester

Die Aufgabe soll in Vierergruppen gel¨ost werden. Es wird die Gruppenleistung bewertet, aber
es k¨onnen Einzelnoten vergeben werden.

Aufgabenstellung
Erlang ist eine funktionale Programmiersprache, die von der Firma Ericsson zur Programmierung
verteilter Anwendungen entwickelt wurde. Funktionale Sprachen haben den Vorteil, dass sie
im Allgemeinen ohne statische Variablen und Datenstrukturen auskommen, so dass parallele
Anwendungen i. W. keine explizite Synchronisation erfordern. Auch lassen sich verteilte Anwendungen vergleichsweise einfach uber das Botschaftenkonzept mithilfe der sogenannten Akto ¨ ren,
die jeweils eine eigene Nachrichtenwarteschlange besitzen, synchronisieren.
Es ist Ihre Aufgabe, in Erlang fur eine verteilte Anwendung Lamport-Uhren zu bauen, um ¨
Nachrichten korrekt zu ordnen.

(a) Installieren Sie den Erlang-Compiler und ggf. eine geeignete Entwicklungsumgebung. Arbeiten Sie sich in die Grundlagen der Programmiersprache ein und machen Sie sich mit
Aktoren und der verteilten Programmierung vertraut. Verwenden Sie hierfur insbesondere ¨
die auf erlang.org bereitgestellten Unterlagen.
Schreiben Sie ein vier- bis funfseitiges Summary hierzu. Vergessen Sie nicht, verwende ¨ te
Quellen anzugeben.

(b) Bringen Sie das Programm (s. Anhang) zum Laufen. Welche Ausgabe wird erzeugt?
Beschreiben Sie detailliert, wie das Programm funktioniert.

(c) Erweitern Sie das Programm um Lamport-Uhren. Implementieren Sie fur die Lamport’schen ¨
Zeitstempel ein Modul lamporttime mit den folgenden Funktionen:
zero() : gibt den initialen Zeitstempel zuruck (z. B. 0) ¨
inc(T) : gibt den um eins erh¨ohten Zeitstempel T zuruck ¨
merge(Ti,Tj) : mischt die Zeitstempel Ti und Tj (fur receive) und gibt den ¨
resultierenden Zeitstempel zuruck ¨
leq(Ti,Tj) : true, falls Ti ≤ Tj
Senden Sie die Timestamps an den Logger mit, der sie mit ausgibt. Experimentieren Sie
mit unterschiedlichen Werten fur den Jitter. Welche Probleme mit der Reihenfolge der ¨
Ausgabe zeigen sich? Fugen Sie Ihrem Programmcode eine Beschreibung bei. ¨

(d) Andern Sie nun den Logger und das Modul ¨ lamporttime so ab, dass die Reihenfolgeprobleme
(unabh¨angig vom Jitter) nicht mehr auftreten. Erweitern Sie insbesondere den Logger
hierzu um eine Message-Queue, welche die eingehenden Messages vor dem Ausgeben genau
solange zuruckbeh ¨ ¨alt, bis es sicher ist, dass die korrekte Reihenfolge eingehalten werden
kann. Uberlegen Sie zun ¨ ¨achst, wie sich das erreichen l¨asst. Beschreiben Sie Ihre Idee und
bewerten Sie Ihre L¨osung!

Demonstrieren Sie Ihre L¨osung der einzelnen Teilaufgaben in einem vertonten Video.
