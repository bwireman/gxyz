import gleeunit/should
import gxyz/function
import simplifile

pub fn freeze_test() {
  function.freeze(1)()
  |> should.equal(1)
}

pub fn freeze1_test() {
  function.freeze1(fn(a) { a + 1 }, 1)()
  |> should.equal(2)
}

pub fn freeze2_test() {
  function.freeze2(fn(a, b) { a + b + 1 }, 1, 2)()
  |> should.equal(4)
}

pub fn freeze3_test() {
  function.freeze3(fn(a, b, c) { a + b + c + 1 }, 1, 2, 3)()
  |> should.equal(7)
}

pub fn freeze4_test() {
  function.freeze4(fn(a, b, c, d) { a + b + c + d + 1 }, 1, 2, 3, 4)()
  |> should.equal(11)
}

pub fn freeze5_test() {
  function.freeze5(fn(a, b, c, d, e) { a + b + c + d + e + 1 }, 1, 2, 3, 4, 5)()
  |> should.equal(16)
}

pub fn iff_test() {
  let one = function.freeze(1)
  function.iff(True, one, 2)
  |> should.equal(1)

  function.iff(False, one, 2)
  |> should.equal(2)
}

pub fn iff_nil_test() {
  let f = "iff_nil.test"
  let _ = simplifile.delete(f)

  let fun = fn() {
    simplifile.create_file(f)
    |> should.be_ok()

    Nil
  }

  function.iff_nil(False, fun)
  |> should.equal(Nil)

  simplifile.is_file(f)
  |> should.be_ok()
  |> should.be_false()

  function.iff_nil(True, fun)
  |> should.equal(Nil)

  simplifile.is_file(f)
  |> should.be_ok()
  |> should.be_true()
}

pub fn ignore_result_test() {
  let f = "ignore_result.test"
  let _ = simplifile.delete(f)
  let fun = function.freeze1(simplifile.create_file, f)

  function.ignore_result(False, fun)
  |> should.equal(Nil)

  simplifile.is_file(f)
  |> should.be_ok()
  |> should.be_false()

  function.ignore_result(True, fun)
  |> should.equal(Nil)

  simplifile.is_file(f)
  |> should.be_ok()
  |> should.be_true()
}
