import gleam/dynamic.{type DecodeError, type Dynamic, element, from}

/// returns the value at index from the a tuple, using a dynamic.Decode function
pub fn at(
  tuple: a,
  index: Int,
  fun: fn(Dynamic) -> Result(b, List(DecodeError)),
) -> Result(b, List(DecodeError)) {
  from(tuple)
  |> element(index, fun)
}
