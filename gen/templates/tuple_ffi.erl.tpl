{{=< >=}}
-module(tuple_ffi).

-export([
    <#mappers>
    map<count>_<index>/2,
    at<count>_<index>/1<#not_last>,</not_last>
    </mappers>
]).

<#mappers>
at<count>_<index>(Tuple) ->
    at(Tuple, <index>).

map<count>_<index>(Tuple, FN) ->
    map(Tuple, <index>, FN).

</mappers>
at(Tuple, Index) ->
    element(Index + 1, Tuple).

map(Tuple, Index, FN) ->
    case {Tuple, Index} of
        <#mappers>
        {<erl_tuple>, <index>} -> <new_erl_tuple><#not_last>;</not_last>
        </mappers>
    end.