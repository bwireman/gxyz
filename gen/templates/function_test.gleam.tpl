import gleeunit/should
import gxyz/gxyz_function
import simplifile

pub fn freeze_test() {
  gxyz_function.freeze(1)()
  |> should.equal(1)
}

{{#freezes}}
pub fn freeze{{arity}}_test() {
  gxyz_function.freeze{{arity}}(fn({{args}}) { {{math}} + 1 }, {{elems}})()
  |> should.equal({{sum}})
}

{{/freezes}}

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
