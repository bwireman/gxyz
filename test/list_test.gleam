import gleeunit/should
import gxyz/gxyz_list

pub fn reject_test() {
  gxyz_list.reject([], fn(a) { a > 0 })
  |> should.equal([])

  gxyz_list.reject([1, 2, 3], fn(a) { a > 0 })
  |> should.equal([])

  gxyz_list.reject([1, 2, 3], fn(a) { a < 0 })
  |> should.equal([1, 2, 3])
}
