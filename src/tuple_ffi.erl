-module(tuple_ffi).

-export([
    map2_0/2,
    at2_0/1,
    map2_1/2,
    at2_1/1,
    map3_0/2,
    at3_0/1,
    map3_1/2,
    at3_1/1,
    map3_2/2,
    at3_2/1,
    map4_0/2,
    at4_0/1,
    map4_1/2,
    at4_1/1,
    map4_2/2,
    at4_2/1,
    map4_3/2,
    at4_3/1,
    map5_0/2,
    at5_0/1,
    map5_1/2,
    at5_1/1,
    map5_2/2,
    at5_2/1,
    map5_3/2,
    at5_3/1,
    map5_4/2,
    at5_4/1
]).

at2_0(Tuple) ->
    at(Tuple, 0).

map2_0(Tuple, FN) ->
    map(Tuple, 0, FN).

at2_1(Tuple) ->
    at(Tuple, 1).

map2_1(Tuple, FN) ->
    map(Tuple, 1, FN).

at3_0(Tuple) ->
    at(Tuple, 0).

map3_0(Tuple, FN) ->
    map(Tuple, 0, FN).

at3_1(Tuple) ->
    at(Tuple, 1).

map3_1(Tuple, FN) ->
    map(Tuple, 1, FN).

at3_2(Tuple) ->
    at(Tuple, 2).

map3_2(Tuple, FN) ->
    map(Tuple, 2, FN).

at4_0(Tuple) ->
    at(Tuple, 0).

map4_0(Tuple, FN) ->
    map(Tuple, 0, FN).

at4_1(Tuple) ->
    at(Tuple, 1).

map4_1(Tuple, FN) ->
    map(Tuple, 1, FN).

at4_2(Tuple) ->
    at(Tuple, 2).

map4_2(Tuple, FN) ->
    map(Tuple, 2, FN).

at4_3(Tuple) ->
    at(Tuple, 3).

map4_3(Tuple, FN) ->
    map(Tuple, 3, FN).

at5_0(Tuple) ->
    at(Tuple, 0).

map5_0(Tuple, FN) ->
    map(Tuple, 0, FN).

at5_1(Tuple) ->
    at(Tuple, 1).

map5_1(Tuple, FN) ->
    map(Tuple, 1, FN).

at5_2(Tuple) ->
    at(Tuple, 2).

map5_2(Tuple, FN) ->
    map(Tuple, 2, FN).

at5_3(Tuple) ->
    at(Tuple, 3).

map5_3(Tuple, FN) ->
    map(Tuple, 3, FN).

at5_4(Tuple) ->
    at(Tuple, 4).

map5_4(Tuple, FN) ->
    map(Tuple, 4, FN).

at(Tuple, Index) ->
    element(Index + 1, Tuple).

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