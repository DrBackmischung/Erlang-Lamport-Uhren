-module(lamporttime).
-export([zero/0, inc/1, merge/2,leq/2]).

% Just a plain function returning 0
zero() ->
    0.

% Just a simple function incrementing a given number
inc(T) ->
    T + 1.

% A function which compares two values and returns the greater value
merge(Ti, Tj) ->
   if 
        % If Ti is greater than Tj, return Ti
        Ti > Tj -> Ti;
        % If Ti is less than Tj, return Tj
        Ti < Tj -> Tj;
        % If the values are the same (and for all other cases), return Ti
        true -> Ti
   end.

% Return true, if Ti is smaller or equal to Tj, otherwise return false
leq(Ti, Tj) -> (Ti =< Tj).