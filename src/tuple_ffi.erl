-module(tuple_ffi).

-export([
    at/2, map/3
]).

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