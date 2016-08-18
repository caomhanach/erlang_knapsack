-module(erlang_knapsack_0_1).

-export([solve/5]).

solve([], _TotalWeight, ItemAcc, ValueAcc, WeightAcc) ->
    {ItemAcc, ValueAcc, WeightAcc};
solve([{_Item, ItemWeight, _ItemValue} | T],
      TotalWeight,
      ItemAcc,
      ValueAcc,
      WeightAcc) when ItemWeight > TotalWeight ->
    solve(T, TotalWeight, ItemAcc, ValueAcc, WeightAcc);
solve([{ItemName, ItemWeight, ItemValue} | T],
      TotalWeight,
      ItemAcc,
      ValueAcc,
      WeightAcc) ->
    {_TailItemAcc, TailValueAcc, _TailWeightAcc} = TailRes =
        solve(T, TotalWeight, ItemAcc, ValueAcc, WeightAcc),
    {_HeadItemAcc, HeadValueAcc, _HeadWeightAcc} = HeadRes =
        solve(T,
              TotalWeight - ItemWeight,
              [ItemName | ItemAcc],
              ValueAcc + ItemValue,
              WeightAcc + ItemWeight),

    case TailValueAcc > HeadValueAcc of
        true ->
            TailRes;
        false ->
            HeadRes
    end.
