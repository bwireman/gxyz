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
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
/// returns the {{index_name}} element of a tuple of length {{count}}
pub fn at{{count}}_{{index}}(tuple: {{tuple}}, index: Int) -> {{type}}

{{/mappers}}

{{#mappers}}
@external(erlang, "tuple_ffi", "map{{count}}_{{index}}")
@external(javascript, "../tuple_ffi.mjs", "map{{count}}_{{index}}")
/// applies the function to the {{index_name}} element of a tuple of length {{count}}
pub fn map{{count}}_{{index}}(tuple: {{tuple}}, fun: fn({{type}}) -> mapped) -> {{new_tuple}}

{{/mappers}}
