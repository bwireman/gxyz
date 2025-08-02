-module(ffi).

-export([
    do_element/2
]).

do_element(Index, Tuple) ->
    try element(Index, Tuple) of
        Res -> {ok, Res}
    catch
        _:_ -> {error, nil}
    end.


    
