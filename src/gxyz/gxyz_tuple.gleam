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

/// returns the 1st element of a tuple of length 2
pub fn at2_0(tuple: #(a, b)) -> a {
  let #(a, _) = tuple
  a
}

/// applies the function to the 1st element of a tuple of length 2
pub fn map2_0(tuple: #(a, b), fun: fn(a) -> mapped) -> #(mapped, b) {
  let #(a, b) = tuple
  let mapped = fun(a)
  #(mapped, b)
}

/// returns the 2nd element of a tuple of length 2
pub fn at2_1(tuple: #(a, b)) -> b {
  let #(_, b) = tuple
  b
}

/// applies the function to the 2nd element of a tuple of length 2
pub fn map2_1(tuple: #(a, b), fun: fn(b) -> mapped) -> #(a, mapped) {
  let #(a, b) = tuple
  let mapped = fun(b)
  #(a, mapped)
}

/// returns the 1st element of a tuple of length 3
pub fn at3_0(tuple: #(a, b, c)) -> a {
  let #(a, _, _) = tuple
  a
}

/// applies the function to the 1st element of a tuple of length 3
pub fn map3_0(tuple: #(a, b, c), fun: fn(a) -> mapped) -> #(mapped, b, c) {
  let #(a, b, c) = tuple
  let mapped = fun(a)
  #(mapped, b, c)
}

/// returns the 2nd element of a tuple of length 3
pub fn at3_1(tuple: #(a, b, c)) -> b {
  let #(_, b, _) = tuple
  b
}

/// applies the function to the 2nd element of a tuple of length 3
pub fn map3_1(tuple: #(a, b, c), fun: fn(b) -> mapped) -> #(a, mapped, c) {
  let #(a, b, c) = tuple
  let mapped = fun(b)
  #(a, mapped, c)
}

/// returns the 3rd element of a tuple of length 3
pub fn at3_2(tuple: #(a, b, c)) -> c {
  let #(_, _, c) = tuple
  c
}

/// applies the function to the 3rd element of a tuple of length 3
pub fn map3_2(tuple: #(a, b, c), fun: fn(c) -> mapped) -> #(a, b, mapped) {
  let #(a, b, c) = tuple
  let mapped = fun(c)
  #(a, b, mapped)
}

/// returns the 1st element of a tuple of length 4
pub fn at4_0(tuple: #(a, b, c, d)) -> a {
  let #(a, _, _, _) = tuple
  a
}

/// applies the function to the 1st element of a tuple of length 4
pub fn map4_0(tuple: #(a, b, c, d), fun: fn(a) -> mapped) -> #(mapped, b, c, d) {
  let #(a, b, c, d) = tuple
  let mapped = fun(a)
  #(mapped, b, c, d)
}

/// returns the 2nd element of a tuple of length 4
pub fn at4_1(tuple: #(a, b, c, d)) -> b {
  let #(_, b, _, _) = tuple
  b
}

/// applies the function to the 2nd element of a tuple of length 4
pub fn map4_1(tuple: #(a, b, c, d), fun: fn(b) -> mapped) -> #(a, mapped, c, d) {
  let #(a, b, c, d) = tuple
  let mapped = fun(b)
  #(a, mapped, c, d)
}

/// returns the 3rd element of a tuple of length 4
pub fn at4_2(tuple: #(a, b, c, d)) -> c {
  let #(_, _, c, _) = tuple
  c
}

/// applies the function to the 3rd element of a tuple of length 4
pub fn map4_2(tuple: #(a, b, c, d), fun: fn(c) -> mapped) -> #(a, b, mapped, d) {
  let #(a, b, c, d) = tuple
  let mapped = fun(c)
  #(a, b, mapped, d)
}

/// returns the 4th element of a tuple of length 4
pub fn at4_3(tuple: #(a, b, c, d)) -> d {
  let #(_, _, _, d) = tuple
  d
}

/// applies the function to the 4th element of a tuple of length 4
pub fn map4_3(tuple: #(a, b, c, d), fun: fn(d) -> mapped) -> #(a, b, c, mapped) {
  let #(a, b, c, d) = tuple
  let mapped = fun(d)
  #(a, b, c, mapped)
}

/// returns the 1st element of a tuple of length 5
pub fn at5_0(tuple: #(a, b, c, d, e)) -> a {
  let #(a, _, _, _, _) = tuple
  a
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

/// returns the 2nd element of a tuple of length 5
pub fn at5_1(tuple: #(a, b, c, d, e)) -> b {
  let #(_, b, _, _, _) = tuple
  b
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

/// returns the 3rd element of a tuple of length 5
pub fn at5_2(tuple: #(a, b, c, d, e)) -> c {
  let #(_, _, c, _, _) = tuple
  c
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

/// returns the 4th element of a tuple of length 5
pub fn at5_3(tuple: #(a, b, c, d, e)) -> d {
  let #(_, _, _, d, _) = tuple
  d
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

/// returns the 5th element of a tuple of length 5
pub fn at5_4(tuple: #(a, b, c, d, e)) -> e {
  let #(_, _, _, _, e) = tuple
  e
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
  fun(at2_0(tuple), at2_1(tuple))
}

/// use the values of a tuple of length 3 as the arguments to the supplied function
pub fn apply_from3(tuple: #(a, b, c), fun: fn(a, b, c) -> d) -> d {
  fun(at3_0(tuple), at3_1(tuple), at3_2(tuple))
}

/// use the values of a tuple of length 4 as the arguments to the supplied function
pub fn apply_from4(tuple: #(a, b, c, d), fun: fn(a, b, c, d) -> e) -> e {
  fun(at4_0(tuple), at4_1(tuple), at4_2(tuple), at4_3(tuple))
}

/// use the values of a tuple of length 5 as the arguments to the supplied function
pub fn apply_from5(tuple: #(a, b, c, d, e), fun: fn(a, b, c, d, e) -> f) -> f {
  fun(at5_0(tuple), at5_1(tuple), at5_2(tuple), at5_3(tuple), at5_4(tuple))
}
