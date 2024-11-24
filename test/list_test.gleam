import gleeunit/should
import gxyz/list

pub fn reject_test() {
  list.reject([], fn(a) { a > 0 })
  |> should.equal([])

  list.reject([1, 2, 3], fn(a) { a > 0 })
  |> should.equal([])

  list.reject([1, 2, 3], fn(a) { a < 0 })
  |> should.equal([1, 2, 3])
}
