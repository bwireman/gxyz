import gleeunit/should
import gxyz/gxyz_function
import simplifile

pub fn freeze_test() {
  gxyz_function.freeze(1)()
  |> should.equal(1)
}

pub fn freeze1_test() {
  gxyz_function.freeze1(fn(a) { a + 1 }, 1)()
  |> should.equal(2)
}

pub fn freeze2_test() {
  gxyz_function.freeze2(fn(a, b) { a + b }, 1, 2)()
  |> should.equal(3)
}

pub fn freeze3_test() {
  gxyz_function.freeze3(fn(a, b, c) { a + b + c }, 1, 2, 3)()
  |> should.equal(6)
}

pub fn freeze4_test() {
  gxyz_function.freeze4(fn(a, b, c, d) { a + b + c + d }, 1, 2, 3, 4)()
  |> should.equal(10)
}

pub fn freeze5_test() {
  gxyz_function.freeze5(fn(a, b, c, d, e) { a + b + c + d + e }, 1, 2, 3, 4, 5)()
  |> should.equal(15)
}

pub fn iff_test() {
  let one = gxyz_function.freeze(1)
  gxyz_function.iff(True, one, 2)
  |> should.equal(1)

  gxyz_function.iff(False, one, 2)
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

  gxyz_function.iff_nil(False, fun)
  |> should.equal(Nil)

  simplifile.is_file(f)
  |> should.be_ok()
  |> should.be_false()

  gxyz_function.iff_nil(True, fun)
  |> should.equal(Nil)

  simplifile.is_file(f)
  |> should.be_ok()
  |> should.be_true()
}

pub fn ignore_result_test() {
  let f = "ignore_result.test"
  let _ = simplifile.delete(f)
  let fun = gxyz_function.freeze1(simplifile.create_file, f)

  gxyz_function.ignore_result(False, fun)
  |> should.equal(Nil)

  simplifile.is_file(f)
  |> should.be_ok()
  |> should.be_false()

  gxyz_function.ignore_result(True, fun)
  |> should.equal(Nil)

  simplifile.is_file(f)
  |> should.be_ok()
  |> should.be_true()
}
