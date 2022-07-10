% Moduldefinition
-module(lamporttime).

% Exportierte Methoden
-export([zero/0, inc/1, merge/2, leq/2]).

% Gibt den initialen Zeitstempel zurück: 0
zero() -> 0.

% Zählt einen Zeitstempel um 1 hoch
inc(T) -> T + 1.

% Gibt den größeren von zwei Zeitstempeln zurück
merge(Ti, Tj) -> erlang:max(Ti, Tj).

% Gibt zurück, ob ein Zeitstempel kleiner gleich einem zweiten Zeitstempel ist
leq(Ti, Tj) -> Ti =< Tj.