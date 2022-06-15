-modul(lamporttime).
-export([zero/0, inc/1, merge/2, leq/2]).

zero() -> 0.

inc(T) -> T + 1.

merge(Ti, Tj) -> erlang:max(Ti, Tj).

leq(Ti, Tj) -> Ti =< Tj.