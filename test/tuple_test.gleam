import gleam/dynamic.{bool, int, string}
import gleeunit/should
import gxyz/gxyz_tuple

fn invert(x: Int) {
  x * -1
}

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

pub fn at2_0_test() {
  #(1, 2)
  |> gxyz_tuple.at2_0()
  |> should.equal(1)
}

pub fn map2_0_test() {
  #(1, 2)
  |> gxyz_tuple.map2_0(invert)
  |> should.equal(#(-1, 2))
}

pub fn at2_1_test() {
  #(1, 2)
  |> gxyz_tuple.at2_1()
  |> should.equal(2)
}

pub fn map2_1_test() {
  #(1, 2)
  |> gxyz_tuple.map2_1(invert)
  |> should.equal(#(1, -2))
}

pub fn at3_0_test() {
  #(1, 2, 3)
  |> gxyz_tuple.at3_0()
  |> should.equal(1)
}

pub fn map3_0_test() {
  #(1, 2, 3)
  |> gxyz_tuple.map3_0(invert)
  |> should.equal(#(-1, 2, 3))
}

pub fn at3_1_test() {
  #(1, 2, 3)
  |> gxyz_tuple.at3_1()
  |> should.equal(2)
}

pub fn map3_1_test() {
  #(1, 2, 3)
  |> gxyz_tuple.map3_1(invert)
  |> should.equal(#(1, -2, 3))
}

pub fn at3_2_test() {
  #(1, 2, 3)
  |> gxyz_tuple.at3_2()
  |> should.equal(3)
}

pub fn map3_2_test() {
  #(1, 2, 3)
  |> gxyz_tuple.map3_2(invert)
  |> should.equal(#(1, 2, -3))
}

pub fn at4_0_test() {
  #(1, 2, 3, 4)
  |> gxyz_tuple.at4_0()
  |> should.equal(1)
}

pub fn map4_0_test() {
  #(1, 2, 3, 4)
  |> gxyz_tuple.map4_0(invert)
  |> should.equal(#(-1, 2, 3, 4))
}

pub fn at4_1_test() {
  #(1, 2, 3, 4)
  |> gxyz_tuple.at4_1()
  |> should.equal(2)
}

pub fn map4_1_test() {
  #(1, 2, 3, 4)
  |> gxyz_tuple.map4_1(invert)
  |> should.equal(#(1, -2, 3, 4))
}

pub fn at4_2_test() {
  #(1, 2, 3, 4)
  |> gxyz_tuple.at4_2()
  |> should.equal(3)
}

pub fn map4_2_test() {
  #(1, 2, 3, 4)
  |> gxyz_tuple.map4_2(invert)
  |> should.equal(#(1, 2, -3, 4))
}

pub fn at4_3_test() {
  #(1, 2, 3, 4)
  |> gxyz_tuple.at4_3()
  |> should.equal(4)
}

pub fn map4_3_test() {
  #(1, 2, 3, 4)
  |> gxyz_tuple.map4_3(invert)
  |> should.equal(#(1, 2, 3, -4))
}

pub fn at5_0_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.at5_0()
  |> should.equal(1)
}

pub fn map5_0_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.map5_0(invert)
  |> should.equal(#(-1, 2, 3, 4, 5))
}

pub fn at5_1_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.at5_1()
  |> should.equal(2)
}

pub fn map5_1_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.map5_1(invert)
  |> should.equal(#(1, -2, 3, 4, 5))
}

pub fn at5_2_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.at5_2()
  |> should.equal(3)
}

pub fn map5_2_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.map5_2(invert)
  |> should.equal(#(1, 2, -3, 4, 5))
}

pub fn at5_3_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.at5_3()
  |> should.equal(4)
}

pub fn map5_3_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.map5_3(invert)
  |> should.equal(#(1, 2, 3, -4, 5))
}

pub fn at5_4_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.at5_4()
  |> should.equal(5)
}

pub fn map5_4_test() {
  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.map5_4(invert)
  |> should.equal(#(1, 2, 3, 4, -5))
}

pub fn apply_from2_test() {
  let fun = fn(a, b) { a + b }

  #(1, 2)
  |> gxyz_tuple.apply_from2(fun)
  |> should.equal(3)
}

pub fn apply_from3_test() {
  let fun = fn(a, b, c) { a + b + c }

  #(1, 2, 3)
  |> gxyz_tuple.apply_from3(fun)
  |> should.equal(6)
}

pub fn apply_from4_test() {
  let fun = fn(a, b, c, d) { a + b + c + d }

  #(1, 2, 3, 4)
  |> gxyz_tuple.apply_from4(fun)
  |> should.equal(10)
}

pub fn apply_from5_test() {
  let fun = fn(a, b, c, d, e) { a + b + c + d + e }

  #(1, 2, 3, 4, 5)
  |> gxyz_tuple.apply_from5(fun)
  |> should.equal(15)
}
