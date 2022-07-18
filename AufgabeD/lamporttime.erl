-module(lamporttime).
-export([zero/0, inc/1, merge/2, leq/2, initClocks/1, updateClocks/3, canLog/1]).

% Funktion gibt den initialen Zeitstempel "0" zurück. 
zero() -> 0.

% Funktion inkrementiert einen Wert um 1
inc(T) -> T + 1.

% Funktion gibt den größeren zweier Werte zurück
merge(Ti, Tj) ->
   if 
        % Falls Ti größer als Tj ist, return Ti
        Ti > Tj -> Ti;
        % Falls Ti größer als Tj ist, return Ti
        Ti < Tj -> Tj;
        % Wenn beide Werte gleich groß sind, return Ti
        true -> Ti
   end.

leq(Ti, Tj) -> Ti =< Tj.

% initialisiert die Liste der Uhren mit ihren Zeitstempeln
initClocks(Nodes) -> lists:foldl(fun(Node, Clocks) -> [{Node, zero()} | Clocks] end, [], Nodes).

% Einen bestimmten Zeitstempel in Liste aktualisieren
updateClocks(Node, Time, Clocks) -> lists:keyreplace(Node, 1, Clocks, {Node, Time}).

% Überpfüft, ob eine Message geloggt werden kann, indem der kleinste Zeitstempel zurückgegeben wird.
canLog(Clocks) -> element(2, hd(lists:keysort(2, Clocks))).