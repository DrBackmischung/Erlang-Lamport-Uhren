-module(mylogger).
-export([start/1, stop/1]).

start(Nodes) ->
  spawn_link(fun() -> init(Nodes) end).

stop(Logger) ->
  Logger ! stop.

init(Nodes) ->
  loop(lamporttime:initClocks(Nodes), []).

loop(Clock, Queue) ->
  receive
    {log, From, Time, Msg} ->
      UpdatedClocks = lamporttime:updateClocks(From, Time, Clocks),
      LowestClock = lamporttime:canLog(UpdatedClocks),
      case Time of 
        1 -> 
          log(From, Time, Msg),
          SortedQueue = lists:keysort(2, Queue);
        _ ->
          SortedQueue = lists:keysort(2, Queue ++ [{From, Time, Msg}])
      end,
      {ReadyQueue, WaitQueue} = lists:splitwith(fun({_, Timestamp, _}) ->
        lamporttime:leq(Timestamp, LowestTimestamp)
        end,
      SortedQueue),
      lists:foreach(fun({Sender, Time, Message}) -> log(Sender, Time, Message) end, ReadyQueue),
      loop(UpdatedClocks, WaitQueue);
    stop ->
      ok
end.

log(From, Time, Msg) ->
  io:format("log: ~w ~w ~p~n", [Time, From, Msg]). 
