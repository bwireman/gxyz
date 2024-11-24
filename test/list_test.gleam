import gleeunit/should
import gxyz/list.{reject, reject_empty}

pub fn reject_test() {
  reject([], fn(a) { a > 0 })
  |> should.equal([])

  reject([1, 2, 3], fn(a) { a > 0 })
  |> should.equal([])

  reject([1, 2, 3], fn(a) { a < 0 })
  |> should.equal([1, 2, 3])
}

pub fn reject_empty_test() {
  reject_empty([])
  |> should.equal([])

  reject_empty(["1", "", "3"])
  |> should.equal(["1", "3"])

  reject_empty([""])
  |> should.equal([])

  reject_empty(["", "", ""])
  |> should.equal([])
}
