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
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at2_0(tuple: #(a, b), index: Int) -> a

/// returns the 2nd element of a tuple of length 2
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at2_1(tuple: #(a, b), index: Int) -> b

/// returns the 1st element of a tuple of length 3
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at3_0(tuple: #(a, b, c), index: Int) -> a

/// returns the 2nd element of a tuple of length 3
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at3_1(tuple: #(a, b, c), index: Int) -> b

/// returns the 3rd element of a tuple of length 3
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at3_2(tuple: #(a, b, c), index: Int) -> c

/// returns the 1st element of a tuple of length 4
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at4_0(tuple: #(a, b, c, d), index: Int) -> a

/// returns the 2nd element of a tuple of length 4
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at4_1(tuple: #(a, b, c, d), index: Int) -> b

/// returns the 3rd element of a tuple of length 4
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at4_2(tuple: #(a, b, c, d), index: Int) -> c

/// returns the 4th element of a tuple of length 4
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at4_3(tuple: #(a, b, c, d), index: Int) -> d

/// returns the 1st element of a tuple of length 5
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at5_0(tuple: #(a, b, c, d, e), index: Int) -> a

/// returns the 2nd element of a tuple of length 5
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at5_1(tuple: #(a, b, c, d, e), index: Int) -> b

/// returns the 3rd element of a tuple of length 5
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at5_2(tuple: #(a, b, c, d, e), index: Int) -> c

/// returns the 4th element of a tuple of length 5
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at5_3(tuple: #(a, b, c, d, e), index: Int) -> d

/// returns the 5th element of a tuple of length 5
@external(erlang, "tuple_ffi", "at")
@external(javascript, "../tuple_ffi.mjs", "at")
pub fn at5_4(tuple: #(a, b, c, d, e), index: Int) -> e

/// applies the function to the 1st element of a tuple of length 2
@external(erlang, "tuple_ffi", "map2_0")
@external(javascript, "../tuple_ffi.mjs", "map2_0")
pub fn map2_0(tuple: #(a, b), fun: fn(a) -> mapped) -> #(mapped, b)

/// applies the function to the 2nd element of a tuple of length 2
@external(erlang, "tuple_ffi", "map2_1")
@external(javascript, "../tuple_ffi.mjs", "map2_1")
pub fn map2_1(tuple: #(a, b), fun: fn(b) -> mapped) -> #(a, mapped)

/// applies the function to the 1st element of a tuple of length 3
@external(erlang, "tuple_ffi", "map3_0")
@external(javascript, "../tuple_ffi.mjs", "map3_0")
pub fn map3_0(tuple: #(a, b, c), fun: fn(a) -> mapped) -> #(mapped, b, c)

/// applies the function to the 2nd element of a tuple of length 3
@external(erlang, "tuple_ffi", "map3_1")
@external(javascript, "../tuple_ffi.mjs", "map3_1")
pub fn map3_1(tuple: #(a, b, c), fun: fn(b) -> mapped) -> #(a, mapped, c)

/// applies the function to the 3rd element of a tuple of length 3
@external(erlang, "tuple_ffi", "map3_2")
@external(javascript, "../tuple_ffi.mjs", "map3_2")
pub fn map3_2(tuple: #(a, b, c), fun: fn(c) -> mapped) -> #(a, b, mapped)

/// applies the function to the 1st element of a tuple of length 4
@external(erlang, "tuple_ffi", "map4_0")
@external(javascript, "../tuple_ffi.mjs", "map4_0")
pub fn map4_0(tuple: #(a, b, c, d), fun: fn(a) -> mapped) -> #(mapped, b, c, d)

/// applies the function to the 2nd element of a tuple of length 4
@external(erlang, "tuple_ffi", "map4_1")
@external(javascript, "../tuple_ffi.mjs", "map4_1")
pub fn map4_1(tuple: #(a, b, c, d), fun: fn(b) -> mapped) -> #(a, mapped, c, d)

/// applies the function to the 3rd element of a tuple of length 4
@external(erlang, "tuple_ffi", "map4_2")
@external(javascript, "../tuple_ffi.mjs", "map4_2")
pub fn map4_2(tuple: #(a, b, c, d), fun: fn(c) -> mapped) -> #(a, b, mapped, d)

/// applies the function to the 4th element of a tuple of length 4
@external(erlang, "tuple_ffi", "map4_3")
@external(javascript, "../tuple_ffi.mjs", "map4_3")
pub fn map4_3(tuple: #(a, b, c, d), fun: fn(d) -> mapped) -> #(a, b, c, mapped)

/// applies the function to the 1st element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_0")
@external(javascript, "../tuple_ffi.mjs", "map5_0")
pub fn map5_0(
  tuple: #(a, b, c, d, e),
  fun: fn(a) -> mapped,
) -> #(mapped, b, c, d, e)

/// applies the function to the 2nd element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_1")
@external(javascript, "../tuple_ffi.mjs", "map5_1")
pub fn map5_1(
  tuple: #(a, b, c, d, e),
  fun: fn(b) -> mapped,
) -> #(a, mapped, c, d, e)

/// applies the function to the 3rd element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_2")
@external(javascript, "../tuple_ffi.mjs", "map5_2")
pub fn map5_2(
  tuple: #(a, b, c, d, e),
  fun: fn(c) -> mapped,
) -> #(a, b, mapped, d, e)

/// applies the function to the 4th element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_3")
@external(javascript, "../tuple_ffi.mjs", "map5_3")
pub fn map5_3(
  tuple: #(a, b, c, d, e),
  fun: fn(d) -> mapped,
) -> #(a, b, c, mapped, e)

/// applies the function to the 5th element of a tuple of length 5
@external(erlang, "tuple_ffi", "map5_4")
@external(javascript, "../tuple_ffi.mjs", "map5_4")
pub fn map5_4(
  tuple: #(a, b, c, d, e),
  fun: fn(e) -> mapped,
) -> #(a, b, c, d, mapped)
