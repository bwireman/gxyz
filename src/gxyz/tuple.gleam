import gleam/dynamic.{type DecodeError, type Dynamic, element, from}

pub fn at(tup: a, index: Int, fun: fn(Dynamic) -> Result(b, List(DecodeError))) {
  from(tup)
  |> element(index, fun)
}
