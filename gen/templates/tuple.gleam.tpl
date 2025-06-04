import gleam/dynamic/decode

@external(erlang, "erlang", "element")
@external(javascript, "./../ffi.mjs", "element")
fn element(index: Int, tuple: a) -> decode.Dynamic

/// returns the value at index from the a tuple, using a dynamic.Decode function
pub fn at_dynamic(
  tuple: a,
  index: Int,
  decoder: decode.Decoder(b),
) -> Result(b, List(decode.DecodeError)) {
  tuple
  |> element(index + 1, _)
  |> decode.run(decoder)
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
