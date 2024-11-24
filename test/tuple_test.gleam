import gleam/dynamic.{bool, int, string}
import gleeunit/should
import gxyz/gxyz_tuple

pub fn at_dynamic_test() {
  let x = #(1, "1", True)

  gxyz_tuple.at_dynamic(x, 0, int)
  |> should.be_ok()
  |> should.equal(1)

  gxyz_tuple.at_dynamic(x, 1, string)
  |> should.be_ok()
  |> should.equal("1")

  gxyz_tuple.at_dynamic(x, 2, bool)
  |> should.be_ok()
  |> should.be_true()

  gxyz_tuple.at_dynamic(x, 0, string)
  |> should.be_error()

  gxyz_tuple.at_dynamic(x, 1, int)
  |> should.be_error()

  gxyz_tuple.at_dynamic(x, 2, int)
  |> should.be_error()

  gxyz_tuple.at_dynamic(#(), 0, string)
  |> should.be_error()

  gxyz_tuple.at_dynamic(#(1), 0, int)
  |> should.be_ok()
  |> should.equal(1)
}

pub fn at2_test() {
  let x = #(1, "1")

  gxyz_tuple.at2(x, 0)
  |> should.equal(1)

  gxyz_tuple.at2(x, 1)
  |> should.equal("1")
}

pub fn at3_test() {
  let x = #(1, "1", True)

  gxyz_tuple.at3(x, 0)
  |> should.equal(1)

  gxyz_tuple.at3(x, 1)
  |> should.equal("1")

  gxyz_tuple.at3(x, 2)
  |> should.be_true()
}

pub fn at4_test() {
  let x = #(1, "1", True, Nil)

  gxyz_tuple.at4(x, 0)
  |> should.equal(1)

  gxyz_tuple.at4(x, 1)
  |> should.equal("1")

  gxyz_tuple.at4(x, 2)
  |> should.be_true()

  gxyz_tuple.at4(x, 3)
  |> should.equal(Nil)
}

pub fn at5_test() {
  let x = #(1, "1", True, Nil, [1, 2, 3])

  gxyz_tuple.at5(x, 0)
  |> should.equal(1)

  gxyz_tuple.at5(x, 1)
  |> should.equal("1")

  gxyz_tuple.at5(x, 2)
  |> should.be_true()

  gxyz_tuple.at5(x, 3)
  |> should.equal(Nil)

  gxyz_tuple.at5(x, 4)
  |> should.equal([1, 2, 3])
}

pub fn map_test() {
  gxyz_tuple.map2_0(#(1, 2), fn(x) { x * -1 })
  |> should.equal(#(-1, 2))

  gxyz_tuple.map2_1(#(1, 2), fn(x) { x * -1 })
  |> should.equal(#(1, -2))

  gxyz_tuple.map3_0(#(1, 2, 3), fn(x) { x * -1 })
  |> should.equal(#(-1, 2, 3))

  gxyz_tuple.map3_1(#(1, 2, 3), fn(x) { x * -1 })
  |> should.equal(#(1, -2, 3))

  gxyz_tuple.map3_2(#(1, 2, 3), fn(x) { x * -1 })
  |> should.equal(#(1, 2, -3))

  gxyz_tuple.map4_0(#(1, 2, 3, 4), fn(x) { x * -1 })
  |> should.equal(#(-1, 2, 3, 4))

  gxyz_tuple.map4_1(#(1, 2, 3, 4), fn(x) { x * -1 })
  |> should.equal(#(1, -2, 3, 4))

  gxyz_tuple.map4_2(#(1, 2, 3, 4), fn(x) { x * -1 })
  |> should.equal(#(1, 2, -3, 4))

  gxyz_tuple.map4_3(#(1, 2, 3, 4), fn(x) { x * -1 })
  |> should.equal(#(1, 2, 3, -4))

  gxyz_tuple.map5_0(#(1, 2, 3, 4, 5), fn(x) { x * -1 })
  |> should.equal(#(-1, 2, 3, 4, 5))

  gxyz_tuple.map5_1(#(1, 2, 3, 4, 5), fn(x) { x * -1 })
  |> should.equal(#(1, -2, 3, 4, 5))

  gxyz_tuple.map5_2(#(1, 2, 3, 4, 5), fn(x) { x * -1 })
  |> should.equal(#(1, 2, -3, 4, 5))

  gxyz_tuple.map5_3(#(1, 2, 3, 4, 5), fn(x) { x * -1 })
  |> should.equal(#(1, 2, 3, -4, 5))

  gxyz_tuple.map5_4(#(1, 2, 3, 4, 5), fn(x) { x * -1 })
  |> should.equal(#(1, 2, 3, 4, -5))
}
