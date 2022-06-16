-module(mylogger).
-export([start/1, stop/1]).

start(Nodes) ->
  spawn_link(fun() -> init(Nodes) end).

stop(Logger) ->
  Logger ! stop.

init(Nodes) ->
  loop(lamporttime:returnClock(Nodes), []).

loop(Clock, HoldBackQueue) ->
  receive
    {log, From, Time, Msg} ->
      Queue = lists:keysort(2, [{From, Time, Msg} | HoldBackQueue]),
      UpdatedClock = time:update(From, Time, Clock),
      UpdatedHoldBackQueue = [],
      lists:foreach(fun({FromElement, TimeElement, MsgElement}) ->
        case time:safe(TimeElement, UpdatedClock) of
          true ->
            log(FromElement, TimeElement, MsgElement);
          false ->
            lists:append([{FromElement, TimeElement, MsgElement}], UpdatedHoldBackQueue)
        end
      end, Queue),
      loop(UpdatedClock, UpdatedHoldBackQueue);
    stop ->
      ok
end.

log(From, Time, Msg) ->
  io:format("log: ~w ~w ~p~n", [Time, From, Msg]). 
