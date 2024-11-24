import gleam/dynamic.{type DecodeError, type Dynamic, element, from}

@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at2(tuple: #(a, b), index: Int) -> c

@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at3(tuple: #(a, b, c), index: Int) -> d

@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at4(tuple: #(a, b, c, d), index: Int) -> e

@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at5(tuple: #(a, b, c, d, e), index: Int) -> f

{{#mappers}}
@external(erlang, "tuple_ffi", "map{{count}}_{{index}}")
@external(javascript, "../tuple_ffi.mjs", "map{{count}}_{{index}}")
pub fn map{{count}}_{{index}}(tuple: {{tuple}}, fun: fn({{type}}) -> mapped) -> {{new_tuple}}

{{/mappers}}

/// returns the value at index from the a tuple, using a dynamic.Decode function
pub fn at_dynamic(
  tuple: a,
  index: Int,
  fun: fn(Dynamic) -> Result(b, List(DecodeError)),
) -> Result(b, List(DecodeError)) {
  from(tuple)
  |> element(index, fun)
}
