import gleam/dynamic/decode
import gleam/result

@external(erlang, "gxyz_ffi", "do_element")
@external(javascript, "./../gxyz_ffi.mjs", "element")
fn element(index: Int, tuple: a) -> Result(decode.Dynamic, Nil)

/// returns the value at index from the a tuple, using a dynamic.Decode function
/// ```
///: import gleam/dynamic/decode.{int, string}
///: let x = #(1, "foo")
///: let assert Ok(1) = tuple.at_dynamic(x, 0, int)
///: let assert Ok("foo") = tuple.at_dynamic(x, 1, string) 
///: let assert Error(_) = tuple.at_dynamic(x, 1, int)
///: let assert Error(_) = tuple.at_dynamic(x, 10, int)
///: let assert Error(_) = tuple.at_dynamic(123, 10, int)
///: let assert Error(_) = tuple.at_dynamic("not a tuple", 10, int)
/// ```
pub fn at_dynamic(
  tuple: a,
  index: Int,
  decoder: decode.Decoder(b),
) -> Result(b, List(decode.DecodeError)) {
  use val <- result.try(
    element(index + 1, tuple)
    |> result.replace_error([decode.DecodeError("element failed", "", [])]),
  )

  decode.run(val, decoder)
}

{{#mappers}}
/// applies the function to the {{index_name}} element of a tuple of length {{count}}
pub fn map{{count}}_{{index}}(tuple: {{tuple}}, fun: fn({{type}}) -> mapped) -> {{new_tuple}} {
  let {{tuple}} = tuple
  let mapped = fun({{type}})
  {{new_tuple}}
}
{{/mappers}}

{{#applys}}
/// use the values of a tuple of length {{count}} as the arguments to the supplied function
pub fn apply_from{{count}}(tuple: {{tuple}}, fun: fn({{args}}) -> {{type}}) -> {{type}} {
  fun(
    {{#ats}}
      tuple.{{index}}{{#not_last}},{{/not_last}}
    {{/ats}}
  )
}
{{/applys}}
