import gleam/dynamic
import gleam/dynamic/decode

@external(erlang, "erlang", "element")
@external(javascript, "./../ffi.mjs", "element")
fn element(index: Int, tuple: decode.Dynamic) -> decode.Dynamic

/// returns the value at index from the a tuple, using a dynamic.Decode function
pub fn at_dynamic(
  tuple: a,
  index: Int,
  decoder: decode.Decoder(b),
) -> Result(b, List(decode.DecodeError)) {
  tuple
  |> dynamic.from()
  |> element(index + 1, _)
  |> decode.run(decoder)
}

/// applies the function to the 1st element of a tuple of length 2
pub fn map2_0(tuple: #(a, b), fun: fn(a) -> mapped) -> #(mapped, b) {
  let #(a, b) = tuple
  let mapped = fun(a)
  #(mapped, b)
}

/// applies the function to the 2nd element of a tuple of length 2
pub fn map2_1(tuple: #(a, b), fun: fn(b) -> mapped) -> #(a, mapped) {
  let #(a, b) = tuple
  let mapped = fun(b)
  #(a, mapped)
}

/// applies the function to the 1st element of a tuple of length 3
pub fn map3_0(tuple: #(a, b, c), fun: fn(a) -> mapped) -> #(mapped, b, c) {
  let #(a, b, c) = tuple
  let mapped = fun(a)
  #(mapped, b, c)
}

/// applies the function to the 2nd element of a tuple of length 3
pub fn map3_1(tuple: #(a, b, c), fun: fn(b) -> mapped) -> #(a, mapped, c) {
  let #(a, b, c) = tuple
  let mapped = fun(b)
  #(a, mapped, c)
}

/// applies the function to the 3rd element of a tuple of length 3
pub fn map3_2(tuple: #(a, b, c), fun: fn(c) -> mapped) -> #(a, b, mapped) {
  let #(a, b, c) = tuple
  let mapped = fun(c)
  #(a, b, mapped)
}

/// applies the function to the 1st element of a tuple of length 4
pub fn map4_0(tuple: #(a, b, c, d), fun: fn(a) -> mapped) -> #(mapped, b, c, d) {
  let #(a, b, c, d) = tuple
  let mapped = fun(a)
  #(mapped, b, c, d)
}

/// applies the function to the 2nd element of a tuple of length 4
pub fn map4_1(tuple: #(a, b, c, d), fun: fn(b) -> mapped) -> #(a, mapped, c, d) {
  let #(a, b, c, d) = tuple
  let mapped = fun(b)
  #(a, mapped, c, d)
}

/// applies the function to the 3rd element of a tuple of length 4
pub fn map4_2(tuple: #(a, b, c, d), fun: fn(c) -> mapped) -> #(a, b, mapped, d) {
  let #(a, b, c, d) = tuple
  let mapped = fun(c)
  #(a, b, mapped, d)
}

/// applies the function to the 4th element of a tuple of length 4
pub fn map4_3(tuple: #(a, b, c, d), fun: fn(d) -> mapped) -> #(a, b, c, mapped) {
  let #(a, b, c, d) = tuple
  let mapped = fun(d)
  #(a, b, c, mapped)
}

/// applies the function to the 1st element of a tuple of length 5
pub fn map5_0(
  tuple: #(a, b, c, d, e),
  fun: fn(a) -> mapped,
) -> #(mapped, b, c, d, e) {
  let #(a, b, c, d, e) = tuple
  let mapped = fun(a)
  #(mapped, b, c, d, e)
}

/// applies the function to the 2nd element of a tuple of length 5
pub fn map5_1(
  tuple: #(a, b, c, d, e),
  fun: fn(b) -> mapped,
) -> #(a, mapped, c, d, e) {
  let #(a, b, c, d, e) = tuple
  let mapped = fun(b)
  #(a, mapped, c, d, e)
}

/// applies the function to the 3rd element of a tuple of length 5
pub fn map5_2(
  tuple: #(a, b, c, d, e),
  fun: fn(c) -> mapped,
) -> #(a, b, mapped, d, e) {
  let #(a, b, c, d, e) = tuple
  let mapped = fun(c)
  #(a, b, mapped, d, e)
}

/// applies the function to the 4th element of a tuple of length 5
pub fn map5_3(
  tuple: #(a, b, c, d, e),
  fun: fn(d) -> mapped,
) -> #(a, b, c, mapped, e) {
  let #(a, b, c, d, e) = tuple
  let mapped = fun(d)
  #(a, b, c, mapped, e)
}

/// applies the function to the 5th element of a tuple of length 5
pub fn map5_4(
  tuple: #(a, b, c, d, e),
  fun: fn(e) -> mapped,
) -> #(a, b, c, d, mapped) {
  let #(a, b, c, d, e) = tuple
  let mapped = fun(e)
  #(a, b, c, d, mapped)
}

/// use the values of a tuple of length 2 as the arguments to the supplied function
pub fn apply_from2(tuple: #(a, b), fun: fn(a, b) -> c) -> c {
  fun(tuple.0, tuple.1)
}

/// use the values of a tuple of length 3 as the arguments to the supplied function
pub fn apply_from3(tuple: #(a, b, c), fun: fn(a, b, c) -> d) -> d {
  fun(tuple.0, tuple.1, tuple.2)
}

/// use the values of a tuple of length 4 as the arguments to the supplied function
pub fn apply_from4(tuple: #(a, b, c, d), fun: fn(a, b, c, d) -> e) -> e {
  fun(tuple.0, tuple.1, tuple.2, tuple.3)
}

/// use the values of a tuple of length 5 as the arguments to the supplied function
pub fn apply_from5(tuple: #(a, b, c, d, e), fun: fn(a, b, c, d, e) -> f) -> f {
  fun(tuple.0, tuple.1, tuple.2, tuple.3, tuple.4)
}
