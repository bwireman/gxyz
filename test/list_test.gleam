import gleeunit/should
import gxyz/list.{reject}

pub fn reject_test() {
  reject([], fn(a) { a > 0 })
  |> should.equal([])

  reject([1, 2, 3], fn(a) { a > 0 })
  |> should.equal([])

  reject([1, 2, 3], fn(a) { a < 0 })
  |> should.equal([1, 2, 3])
}
