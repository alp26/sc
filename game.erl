-module(game).
-export([calculate_jumps/1]).

% Public
% %%%%%%
-spec calculate_jumps(nonempty_list(integer())) -> atom() |  tuple().
calculate_jumps(List) ->
% We're converting given list to a tuple because a tuple has O(1) complexity 
% for random element access while a list has O(N).
% According to the http://erlang.org/doc/efficiency_guide/advanced.html
% a tuple can have maximum 67,108,863 elements
% which fits the original task requirements regarding the array size.
%
    calculate_jumps(1, 0, length(List), list_to_tuple(List)).   

% Private
% %%%%%%%
-spec calculate_jumps(integer(), integer(), integer(), tuple()) 
                                                -> atom() |  tuple(). 
calculate_jumps(Position, Jumps, Length, _) 
        when Position > Length; Position =< 0 -> % if we out of array's bounds
    {ok, Jumps};

% The path over the array is monosemantic, so in the worst case we will be going
% over the each element of array (O(N)). So in the worst case if we're visiting 
% the same element twice we're in loop. According to the task requirements 
% we can't have more than O(n) complexity by space, it means that we can't 
% use additional data structures to store items we've already visited. So, 
% if the number of the jumps is more than array length 
% (the worst number for jumps is N) - we're in loop.
calculate_jumps(_, Jumps, Length, _) when Jumps > Length ->
    never;
calculate_jumps(Position, Jumps, Length, Tuple) ->
    Offset = element(Position, Tuple),
    calculate_jumps(Position + Offset, Jumps + 1, Length, Tuple).

