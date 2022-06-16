-module(lamporttime).
-export([zero/0, inc/1, merge/2, leq/2, returnClock/1, updateClock/3, canLog/2]).

zero() -> 0.

inc(T) -> T + 1.

merge(Ti, Tj) -> erlang:max(Ti, Tj).

leq(Ti, Tj) -> Ti =< Tj.

returnClock(Nodes) -> lists:foldl(fun(Node, Acc) -> [{Node, zero()} | Acc] end, [], Nodes).

updateClock(Node, Time, Clock) -> lists:keyreplace(Node, 1, Clock, {Node, Time}).

returnClockHead(Clock) -> hd(lists:keysort(2, Clock)).

canLog(Clock, T) ->
    {_, Min} = getHead(Clock),
    leq(T, Min).