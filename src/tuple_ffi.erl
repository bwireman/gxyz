-module(tuple_ffi).

-export([
    map__0/2,
    at__0/1,
    map__1/2,
    at__1/1,
    map__2/2,
    at__2/1,
    map__3/2,
    at__3/1,
    map__4/2,
    at__4/1
]).

at__0(Tuple) ->
    element(1, Tuple).

map__0(Tuple, FN) ->
    map(Tuple, 0, FN).

at__1(Tuple) ->
    element(2, Tuple).

map__1(Tuple, FN) ->
    map(Tuple, 1, FN).

at__2(Tuple) ->
    element(3, Tuple).

map__2(Tuple, FN) ->
    map(Tuple, 2, FN).

at__3(Tuple) ->
    element(4, Tuple).

map__3(Tuple, FN) ->
    map(Tuple, 3, FN).

at__4(Tuple) ->
    element(5, Tuple).

map__4(Tuple, FN) ->
    map(Tuple, 4, FN).


map(Tuple, Index, FN) ->
    case {Index, Tuple} of
        {0, {A, B}} -> {FN(A), B};
        {1, {A, B}} -> {A, FN(B)};
        {0, {A, B, C}} -> {FN(A), B, C};
        {1, {A, B, C}} -> {A, FN(B), C};
        {2, {A, B, C}} -> {A, B, FN(C)};
        {0, {A, B, C, D}} -> {FN(A), B, C, D};
        {1, {A, B, C, D}} -> {A, FN(B), C, D};
        {2, {A, B, C, D}} -> {A, B, FN(C), D};
        {3, {A, B, C, D}} -> {A, B, C, FN(D)};
        {0, {A, B, C, D, E}} -> {FN(A), B, C, D, E};
        {1, {A, B, C, D, E}} -> {A, FN(B), C, D, E};
        {2, {A, B, C, D, E}} -> {A, B, FN(C), D, E};
        {3, {A, B, C, D, E}} -> {A, B, C, FN(D), E};
        {4, {A, B, C, D, E}} -> {A, B, C, D, FN(E)}
    end.