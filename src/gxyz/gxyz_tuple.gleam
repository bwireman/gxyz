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
@external(erlang, "tuple_ffi", "at__0")
@external(javascript, "../tuple_ffi.mjs", "at__0")
pub fn at2_0(tuple: #(a, b)) -> a

/// applies the function to the 1st element of a tuple of length 2
@external(erlang, "tuple_ffi", "map__0")
@external(javascript, "../tuple_ffi.mjs", "map__0")
pub fn map2_0(tuple: #(a, b), fun: fn(a) -> mapped) -> #(mapped, b)

/// returns the 2nd element of a tuple of length 2
@external(erlang, "tuple_ffi", "at__1")
@external(javascript, "../tuple_ffi.mjs", "at__1")
pub fn at2_1(tuple: #(a, b)) -> b

/// applies the function to the 2nd element of a tuple of length 2
@external(erlang, "tuple_ffi", "map__1")
@external(javascript, "../tuple_ffi.mjs", "map__1")
pub fn map2_1(tuple: #(a, b), fun: fn(b) -> mapped) -> #(a, mapped)

/// returns the 1st element of a tuple of length 3
@external(erlang, "tuple_ffi", "at__0")
@external(javascript, "../tuple_ffi.mjs", "at__0")
pub fn at3_0(tuple: #(a, b, c)) -> a

/// applies the function to the 1st element of a tuple of length 3
@external(erlang, "tuple_ffi", "map__0")
@external(javascript, "../tuple_ffi.mjs", "map__0")
pub fn map3_0(tuple: #(a, b, c), fun: fn(a) -> mapped) -> #(mapped, b, c)

/// returns the 2nd element of a tuple of length 3
@external(erlang, "tuple_ffi", "at__1")
@external(javascript, "../tuple_ffi.mjs", "at__1")
pub fn at3_1(tuple: #(a, b, c)) -> b

/// applies the function to the 2nd element of a tuple of length 3
@external(erlang, "tuple_ffi", "map__1")
@external(javascript, "../tuple_ffi.mjs", "map__1")
pub fn map3_1(tuple: #(a, b, c), fun: fn(b) -> mapped) -> #(a, mapped, c)

/// returns the 3rd element of a tuple of length 3
@external(erlang, "tuple_ffi", "at__2")
@external(javascript, "../tuple_ffi.mjs", "at__2")
pub fn at3_2(tuple: #(a, b, c)) -> c

/// applies the function to the 3rd element of a tuple of length 3
@external(erlang, "tuple_ffi", "map__2")
@external(javascript, "../tuple_ffi.mjs", "map__2")
pub fn map3_2(tuple: #(a, b, c), fun: fn(c) -> mapped) -> #(a, b, mapped)

/// returns the 1st element of a tuple of length 4
@external(erlang, "tuple_ffi", "at__0")
@external(javascript, "../tuple_ffi.mjs", "at__0")
pub fn at4_0(tuple: #(a, b, c, d)) -> a

/// applies the function to the 1st element of a tuple of length 4
@external(erlang, "tuple_ffi", "map__0")
@external(javascript, "../tuple_ffi.mjs", "map__0")
pub fn map4_0(tuple: #(a, b, c, d), fun: fn(a) -> mapped) -> #(mapped, b, c, d)

/// returns the 2nd element of a tuple of length 4
@external(erlang, "tuple_ffi", "at__1")
@external(javascript, "../tuple_ffi.mjs", "at__1")
pub fn at4_1(tuple: #(a, b, c, d)) -> b

/// applies the function to the 2nd element of a tuple of length 4
@external(erlang, "tuple_ffi", "map__1")
@external(javascript, "../tuple_ffi.mjs", "map__1")
pub fn map4_1(tuple: #(a, b, c, d), fun: fn(b) -> mapped) -> #(a, mapped, c, d)

/// returns the 3rd element of a tuple of length 4
@external(erlang, "tuple_ffi", "at__2")
@external(javascript, "../tuple_ffi.mjs", "at__2")
pub fn at4_2(tuple: #(a, b, c, d)) -> c

/// applies the function to the 3rd element of a tuple of length 4
@external(erlang, "tuple_ffi", "map__2")
@external(javascript, "../tuple_ffi.mjs", "map__2")
pub fn map4_2(tuple: #(a, b, c, d), fun: fn(c) -> mapped) -> #(a, b, mapped, d)

/// returns the 4th element of a tuple of length 4
@external(erlang, "tuple_ffi", "at__3")
@external(javascript, "../tuple_ffi.mjs", "at__3")
pub fn at4_3(tuple: #(a, b, c, d)) -> d

/// applies the function to the 4th element of a tuple of length 4
@external(erlang, "tuple_ffi", "map__3")
@external(javascript, "../tuple_ffi.mjs", "map__3")
pub fn map4_3(tuple: #(a, b, c, d), fun: fn(d) -> mapped) -> #(a, b, c, mapped)

/// returns the 1st element of a tuple of length 5
@external(erlang, "tuple_ffi", "at__0")
@external(javascript, "../tuple_ffi.mjs", "at__0")
pub fn at5_0(tuple: #(a, b, c, d, e)) -> a

/// applies the function to the 1st element of a tuple of length 5
@external(erlang, "tuple_ffi", "map__0")
@external(javascript, "../tuple_ffi.mjs", "map__0")
pub fn map5_0(
  tuple: #(a, b, c, d, e),
  fun: fn(a) -> mapped,
) -> #(mapped, b, c, d, e)

/// returns the 2nd element of a tuple of length 5
@external(erlang, "tuple_ffi", "at__1")
@external(javascript, "../tuple_ffi.mjs", "at__1")
pub fn at5_1(tuple: #(a, b, c, d, e)) -> b

/// applies the function to the 2nd element of a tuple of length 5
@external(erlang, "tuple_ffi", "map__1")
@external(javascript, "../tuple_ffi.mjs", "map__1")
pub fn map5_1(
  tuple: #(a, b, c, d, e),
  fun: fn(b) -> mapped,
) -> #(a, mapped, c, d, e)

/// returns the 3rd element of a tuple of length 5
@external(erlang, "tuple_ffi", "at__2")
@external(javascript, "../tuple_ffi.mjs", "at__2")
pub fn at5_2(tuple: #(a, b, c, d, e)) -> c

/// applies the function to the 3rd element of a tuple of length 5
@external(erlang, "tuple_ffi", "map__2")
@external(javascript, "../tuple_ffi.mjs", "map__2")
pub fn map5_2(
  tuple: #(a, b, c, d, e),
  fun: fn(c) -> mapped,
) -> #(a, b, mapped, d, e)

/// returns the 4th element of a tuple of length 5
@external(erlang, "tuple_ffi", "at__3")
@external(javascript, "../tuple_ffi.mjs", "at__3")
pub fn at5_3(tuple: #(a, b, c, d, e)) -> d

/// applies the function to the 4th element of a tuple of length 5
@external(erlang, "tuple_ffi", "map__3")
@external(javascript, "../tuple_ffi.mjs", "map__3")
pub fn map5_3(
  tuple: #(a, b, c, d, e),
  fun: fn(d) -> mapped,
) -> #(a, b, c, mapped, e)

/// returns the 5th element of a tuple of length 5
@external(erlang, "tuple_ffi", "at__4")
@external(javascript, "../tuple_ffi.mjs", "at__4")
pub fn at5_4(tuple: #(a, b, c, d, e)) -> e

/// applies the function to the 5th element of a tuple of length 5
@external(erlang, "tuple_ffi", "map__4")
@external(javascript, "../tuple_ffi.mjs", "map__4")
pub fn map5_4(
  tuple: #(a, b, c, d, e),
  fun: fn(e) -> mapped,
) -> #(a, b, c, d, mapped)

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
