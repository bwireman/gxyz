import gleam/dynamic.{type DecodeError, type Dynamic, element, from}

/// returns the value at index from the a tuple, using a dynamic.Decode function
pub fn at_dynamic(
  tuple: tuple,
  index: Int,
  fun: fn(Dynamic) -> Result(b, List(DecodeError)),
) -> Result(b, List(DecodeError)) {
  from(tuple)
  |> element(index, fun)
}

/// returns the 1st element of a tuple of length 2
@external(erlang, "tuple_ffi", "at2_0")
@external(javascript, "../tuple_ffi.mjs", "at2_0")
pub fn at2_0(tuple: #(a, b)) -> a

/// applies the function to the 1st element of a tuple of length 2
@external(erlang, "tuple_ffi", "map2_0")
@external(javascript, "../tuple_ffi.mjs", "map2_0")
pub fn map2_0(tuple: #(a, b), fun: fn(a) -> mapped) -> #(mapped, b)

/// returns the 2nd element of a tuple of length 2
@external(erlang, "tuple_ffi", "at2_1")
@external(javascript, "../tuple_ffi.mjs", "at2_1")
pub fn at2_1(tuple: #(a, b)) -> b

/// applies the function to the 2nd element of a tuple of length 2
@external(erlang, "tuple_ffi", "map2_1")
@external(javascript, "../tuple_ffi.mjs", "map2_1")
pub fn map2_1(tuple: #(a, b), fun: fn(b) -> mapped) -> #(a, mapped)

/// returns the 1st element of a tuple of length 3
@external(erlang, "tuple_ffi", "at3_0")
@external(javascript, "../tuple_ffi.mjs", "at3_0")
pub fn at3_0(tuple: #(a, b, c)) -> a

/// applies the function to the 1st element of a tuple of length 3
@external(erlang, "tuple_ffi", "map3_0")
@external(javascript, "../tuple_ffi.mjs", "map3_0")
pub fn map3_0(tuple: #(a, b, c), fun: fn(a) -> mapped) -> #(mapped, b, c)

/// returns the 2nd element of a tuple of length 3
@external(erlang, "tuple_ffi", "at3_1")
@external(javascript, "../tuple_ffi.mjs", "at3_1")
pub fn at3_1(tuple: #(a, b, c)) -> b

/// applies the function to the 2nd element of a tuple of length 3
@external(erlang, "tuple_ffi", "map3_1")
@external(javascript, "../tuple_ffi.mjs", "map3_1")
pub fn map3_1(tuple: #(a, b, c), fun: fn(b) -> mapped) -> #(a, mapped, c)

/// returns the 3rd element of a tuple of length 3
@external(erlang, "tuple_ffi", "at3_2")
@external(javascript, "../tuple_ffi.mjs", "at3_2")
pub fn at3_2(tuple: #(a, b, c)) -> c

/// applies the function to the 3rd element of a tuple of length 3
@external(erlang, "tuple_ffi", "map3_2")
@external(javascript, "../tuple_ffi.mjs", "map3_2")
pub fn map3_2(tuple: #(a, b, c), fun: fn(c) -> mapped) -> #(a, b, mapped)

/// returns the 1st element of a tuple of length 4
@external(erlang, "tuple_ffi", "at4_0")
@external(javascript, "../tuple_ffi.mjs", "at4_0")
pub fn at4_0(tuple: #(a, b, c, d)) -> a

/// applies the function to the 1st element of a tuple of length 4
@external(erlang, "tuple_ffi", "map4_0")
@external(javascript, "../tuple_ffi.mjs", "map4_0")
pub fn map4_0(tuple: #(a, b, c, d), fun: fn(a) -> mapped) -> #(mapped, b, c, d)

/// returns the 2nd element of a tuple of length 4
@external(erlang, "tuple_ffi", "at4_1")
@external(javascript, "../tuple_ffi.mjs", "at4_1")
pub fn at4_1(tuple: #(a, b, c, d)) -> b

/// applies the function to the 2nd element of a tuple of length 4
@external(erlang, "tuple_ffi", "map4_1")
@external(javascript, "../tuple_ffi.mjs", "map4_1")
pub fn map4_1(tuple: #(a, b, c, d), fun: fn(b) -> mapped) -> #(a, mapped, c, d)

/// returns the 3rd element of a tuple of length 4
@external(erlang, "tuple_ffi", "at4_2")
@external(javascript, "../tuple_ffi.mjs", "at4_2")
pub fn at4_2(tuple: #(a, b, c, d)) -> c

/// applies the function to the 3rd element of a tuple of length 4
@external(erlang, "tuple_ffi", "map4_2")
@external(javascript, "../tuple_ffi.mjs", "map4_2")
pub fn map4_2(tuple: #(a, b, c, d), fun: fn(c) -> mapped) -> #(a, b, mapped, d)

/// returns the 4th element of a tuple of length 4
@external(erlang, "tuple_ffi", "at4_3")
@external(javascript, "../tuple_ffi.mjs", "at4_3")
pub fn at4_3(tuple: #(a, b, c, d)) -> d

/// applies the function to the 4th element of a tuple of length 4
@external(erlang, "tuple_ffi", "map4_3")
@external(javascript, "../tuple_ffi.mjs", "map4_3")
pub fn map4_3(tuple: #(a, b, c, d), fun: fn(d) -> mapped) -> #(a, b, c, mapped)

/// returns the 1st element of a tuple of length 5
@external(erlang, "tuple_ffi", "at5_0")
@external(javascript, "../tuple_ffi.mjs", "at5_0")
pub fn at5_0(tuple: #(a, b, c, d, e)) -> a

/// applies the function to the 1st element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_0")
@external(javascript, "../tuple_ffi.mjs", "map5_0")
pub fn map5_0(
  tuple: #(a, b, c, d, e),
  fun: fn(a) -> mapped,
) -> #(mapped, b, c, d, e)

/// returns the 2nd element of a tuple of length 5
@external(erlang, "tuple_ffi", "at5_1")
@external(javascript, "../tuple_ffi.mjs", "at5_1")
pub fn at5_1(tuple: #(a, b, c, d, e)) -> b

/// applies the function to the 2nd element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_1")
@external(javascript, "../tuple_ffi.mjs", "map5_1")
pub fn map5_1(
  tuple: #(a, b, c, d, e),
  fun: fn(b) -> mapped,
) -> #(a, mapped, c, d, e)

/// returns the 3rd element of a tuple of length 5
@external(erlang, "tuple_ffi", "at5_2")
@external(javascript, "../tuple_ffi.mjs", "at5_2")
pub fn at5_2(tuple: #(a, b, c, d, e)) -> c

/// applies the function to the 3rd element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_2")
@external(javascript, "../tuple_ffi.mjs", "map5_2")
pub fn map5_2(
  tuple: #(a, b, c, d, e),
  fun: fn(c) -> mapped,
) -> #(a, b, mapped, d, e)

/// returns the 4th element of a tuple of length 5
@external(erlang, "tuple_ffi", "at5_3")
@external(javascript, "../tuple_ffi.mjs", "at5_3")
pub fn at5_3(tuple: #(a, b, c, d, e)) -> d

/// applies the function to the 4th element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_3")
@external(javascript, "../tuple_ffi.mjs", "map5_3")
pub fn map5_3(
  tuple: #(a, b, c, d, e),
  fun: fn(d) -> mapped,
) -> #(a, b, c, mapped, e)

/// returns the 5th element of a tuple of length 5
@external(erlang, "tuple_ffi", "at5_4")
@external(javascript, "../tuple_ffi.mjs", "at5_4")
pub fn at5_4(tuple: #(a, b, c, d, e)) -> e

/// applies the function to the 5th element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_4")
@external(javascript, "../tuple_ffi.mjs", "map5_4")
pub fn map5_4(
  tuple: #(a, b, c, d, e),
  fun: fn(e) -> mapped,
) -> #(a, b, c, d, mapped)
