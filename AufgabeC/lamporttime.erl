-module(lamporttime).
-export([zero/0, inc/1, merge/2,leq/2]).

% Eine einfache Funktion, welche nur den Wert '0' zurückgibt 
zero() ->
    0.

% Diese Funktion nimmt eine Zahl entgegen und gibt diese inkrementiert zurück
inc(T) ->
    T + 1.

% Diese Funktion vergleicht zwei übergebende Werte und gibt den größeren zurück
merge(Ti, Tj) ->
   if 
        % So Ti größer als Tj ist, gebe Ti zurück.
        Ti > Tj -> Ti;
        % So Ti kleiner als Tj ist, gebe Tj zurück.
        Ti < Tj -> Tj;
        % Wenn beide Werte gleich groß sind, so gebe Ti zurück.
        true -> Ti
   end.

% Diese Funktion gibt zurück, ob Ti kleiner oder gleich Tj ist.
leq(Ti, Tj) -> (Ti =< Tj).