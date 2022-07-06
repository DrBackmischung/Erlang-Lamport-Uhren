-module(mylogger).
-export([start/1, stop/1]).

start(Nodes) ->
  spawn_link(fun() -> init(Nodes) end).

stop(Logger) ->
  Logger ! stop.

init(Nodes) ->
  loop(lamporttime:initClocks(Nodes), []).

loop(Clocks, Queue) ->

  receive

    {log, From, Time, Msg} ->

        UpdatedClocks = lamporttime:updateClocks(From, Time, Clocks),
        CheckedTimestamp = lamporttime:canLog(UpdatedClocks),

        case Time of
            1 ->
                SortedQueue = lists:keysort(2, Queue),
                log(From, Time, Msg);
            _ ->
                SortedQueue = lists:keysort(2, Queue ++ [{From, Time, Msg}])
        end,

        {ReadyQueue, UpdatedQueue} = partition(SortedQueue, CheckedTimestamp),

        printAll(ReadyQueue),
  
        loop(UpdatedClocks, UpdatedQueue);

    stop ->
        ok

  end.

partition(SortedQueue, CheckedTimestamp) ->
  lists:splitwith(fun({_, Timestamp, _}) -> 
    lamporttime:leq(Timestamp, CheckedTimestamp)
    end,
  SortedQueue).

printAll(ReadyQueue) ->

  lists:foreach(
    fun({Sender, Timestamp, Message}) -> 
      log(Sender, Timestamp, Message)
    end,
  ReadyQueue).


log(From, Time, Msg) ->
  io:format("log: ~w ~w ~p~n", [Time, From, Msg]). 
