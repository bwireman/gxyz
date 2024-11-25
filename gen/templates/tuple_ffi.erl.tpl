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
    element(<value>, Tuple).

map<count>_<index>(Tuple, FN) ->
    map(Tuple, <index>, FN).

</mappers>

map(Tuple, Index, FN) ->
    case {Tuple, Index} of
        <#mappers>
        {<erl_tuple>, <index>} -> <new_erl_tuple><#not_last>;</not_last>
        </mappers>
    end.