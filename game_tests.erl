-module(game_tests).
-include_lib("eunit/include/eunit.hrl").

happy_path_test()->
    ?assert(game:calculate_jumps([2,3,-1,1,3]) =:= {ok, 4}).

loop_test() -> 
    ?assert(game:calculate_jumps([1,1,-1,1]) =:= never),
    ?assert(game:calculate_jumps([2,2,-1,-2]) =:= never).

out_of_bound_left_test()->
    ?assert(game:calculate_jumps([2,3,-4,1,3])=:= {ok, 2}).
