import gleam/dynamic.{type DecodeError, type Dynamic, element, from}

/// returns the value at index from the a tuple, using a dynamic.Decode function
pub fn at_dynamic(
  tuple: a,
  index: Int,
  fun: fn(Dynamic) -> Result(b, List(DecodeError)),
) -> Result(b, List(DecodeError)) {
  from(tuple)
  |> element(index, fun)
}

{{#mappers}}
@external(erlang, "tuple_ffi", "at__{{index}}")
@external(javascript, "../tuple_ffi.mjs", "at__{{index}}")
/// returns the {{index_name}} element of a tuple of length {{count}}
pub fn at{{count}}_{{index}}(tuple: {{tuple}}) -> {{type}}

@external(erlang, "tuple_ffi", "map__{{index}}")
@external(javascript, "../tuple_ffi.mjs", "map__{{index}}")
/// applies the function to the {{index_name}} element of a tuple of length {{count}}
pub fn map{{count}}_{{index}}(tuple: {{tuple}}, fun: fn({{type}}) -> mapped) -> {{new_tuple}}
{{/mappers}}

{{#applys}}
/// use the values of a tuple of length {{count}} as the arguments to the supplied function
pub fn apply_from{{count}}(tuple: {{tuple}}, fun: fn({{args}}) -> {{type}}) -> {{type}} {
  fun(
    {{#ats}}
      at{{count}}_{{index}}(tuple){{#not_last}},{{/not_last}}
    {{/ats}}
  )
}
{{/applys}}
