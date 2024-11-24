-module(tuple_ffi).

-export([
    map2_0/2,
    map2_1/2,
    map3_0/2,
    map3_1/2,
    map3_2/2,
    map4_0/2,
    map4_1/2,
    map4_2/2,
    map4_3/2,
    map5_0/2,
    map5_1/2,
    map5_2/2,
    map5_3/2,
    map5_4/2,
    at/2
]).

at(Tuple, Index) ->
    element(Index + 1, Tuple).

map2_0(Tuple, FN) ->
    map(Tuple, 0, FN).

map2_1(Tuple, FN) ->
    map(Tuple, 1, FN).

map3_0(Tuple, FN) ->
    map(Tuple, 0, FN).

map3_1(Tuple, FN) ->
    map(Tuple, 1, FN).

map3_2(Tuple, FN) ->
    map(Tuple, 2, FN).

map4_0(Tuple, FN) ->
    map(Tuple, 0, FN).

map4_1(Tuple, FN) ->
    map(Tuple, 1, FN).

map4_2(Tuple, FN) ->
    map(Tuple, 2, FN).

map4_3(Tuple, FN) ->
    map(Tuple, 3, FN).

map5_0(Tuple, FN) ->
    map(Tuple, 0, FN).

map5_1(Tuple, FN) ->
    map(Tuple, 1, FN).

map5_2(Tuple, FN) ->
    map(Tuple, 2, FN).

map5_3(Tuple, FN) ->
    map(Tuple, 3, FN).

map5_4(Tuple, FN) ->
    map(Tuple, 4, FN).



map(Tuple, Index, FN) ->
    case {Tuple, Index} of
        {{A, B}, 0} -> {FN(A), B};
        {{A, B}, 1} -> {A, FN(B)};

        {{A, B, C}, 0} -> {FN(A), B, C};
        {{A, B, C}, 1} -> {A, FN(B), C};
        {{A, B, C}, 2} -> {A, B, FN(C)};

        {{A, B, C, D}, 0} -> {FN(A), B, C, D};
        {{A, B, C, D}, 1} -> {A, FN(B), C, D};
        {{A, B, C, D}, 2} -> {A, B, FN(C), D};
        {{A, B, C, D}, 3} -> {A, B, C, FN(D)};

        {{A, B, C, D, E}, 0} -> {FN(A), B, C, D, E};
        {{A, B, C, D, E}, 1} -> {A, FN(B), C, D, E};
        {{A, B, C, D, E}, 2} -> {A, B, FN(C), D, E};
        {{A, B, C, D, E}, 3} -> {A, B, C, FN(D), E};
        {{A, B, C, D, E}, 4} -> {A, B, C, D, FN(E)}
    end.