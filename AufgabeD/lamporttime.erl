-module(lamporttime).
-export([zero/0, inc/1, merge/2, leq/2, initClocks/1, updateClocks/3, canLog/1]).

zero() -> 0.

inc(T) -> T + 1.

merge(Ti, Tj) -> erlang:max(Ti, Tj).

leq(Ti, Tj) -> Ti =< Tj.

initClocks(Nodes) -> lists:foldl(fun(Node, Clocks) -> [{Node, zero()} | Clocks] end, [], Nodes).

updateClocks(Node, Time, Clocks) -> lists:keyreplace(Node, 1, Clocks, {Node, Time}).

canLog(Clocks) -> element(2, hd(lists:keysort(2, Clocks))).