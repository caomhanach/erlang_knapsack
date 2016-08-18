-module(erlang_knapsack_0_1_tests).

-include_lib("eunit/include/eunit.hrl").

-define(STUFF,
        [{"map",                      9,   150},
         {"compass",                 13,    35},
         {"water",                  153,   200},
         {"sandwich",                50,   160},
         {"glucose",                 15,    60},
         {"tin",                     68,    45},
         {"banana",                  27,    60},
         {"apple",                   39,    40},
         {"cheese",                  23,    30},
         {"beer",                    52,    10},
         {"suntan cream",            11,    70},
         {"camera",                  32,    30},
         {"T-shirt",                 24,    15},
         {"trousers",                48,    10},
         {"umbrella",                73,    40},
         {"waterproof trousers",     42,    70},
         {"waterproof overclothes",  43,    75},
         {"note-case",               22,    80},
         {"sunglasses",               7,    20},
         {"towel",                   18,    12},
         {"socks",                    4,    50},
         {"book",                    30,    10}
        ]).

-define(MAX_WEIGHT, 400).
-define(SOLVED_ITEM_LIST,
        ["socks",
         "sunglasses",
         "note-case",
         "waterproof overclothes",
         "waterproof trousers",
         "suntan cream",
         "banana",
         "glucose",
         "sandwich",
         "water",
         "compass",
         "map"]).
-define(SOLVED_TOTAL_VALUE, 1030).
-define(SOLVED_TOTAL_WEIGHT, 396).

solve_test() ->
    StartTime = os:timestamp(),
    {ItemList, TotalValue, TotalWeight} =
        erlang_knapsack_0_1:solve(?STUFF, ?MAX_WEIGHT, [], 0, 0),
    TimeElapsed = timer:now_diff(os:timestamp(), StartTime),
    io:format(user, "Items: ~n", []),
    [io:format(user, "~p~n", [Item]) || Item <- ItemList],
    io:format(user,
              "Total value: ~p~n"
              "Total weight: ~p~n"
              "Time elapsed in milliseconds: ~p~n",
              [TotalValue, TotalWeight, TimeElapsed/1000]),
    ?assertEqual(ItemList, ?SOLVED_ITEM_LIST),
    ?assertEqual(TotalValue, ?SOLVED_TOTAL_VALUE),
    ?assertEqual(TotalWeight, ?SOLVED_TOTAL_WEIGHT).

