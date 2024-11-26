{{=< >=}}
-module(tuple_ffi).

-export([
    <#indexers>
    map__<zero_indexed>/2,
    at__<zero_indexed>/1<#not_last>,</not_last>
    </indexers>
]).

<#indexers>
at__<zero_indexed>(Tuple) ->
    element(<one_indexed>, Tuple).

map__<zero_indexed>(Tuple, FN) ->
    map(Tuple, <zero_indexed>, FN).

</indexers>

map(Tuple, Index, FN) ->
    case {Index, Tuple} of
        <#mappers>
        {<index>, <erl_tuple>} -> <new_erl_tuple><#not_last>;</not_last>
        </mappers>
    end.