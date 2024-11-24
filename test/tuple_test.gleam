import gleam/dynamic.{bool, int, string}
import gleeunit/should
import gxyz/gxyz_tuple

pub fn at_test() {
  let x = #(1, "1", True)

  gxyz_tuple.at(x, 0, int)
  |> should.be_ok()
  |> should.equal(1)

  gxyz_tuple.at(x, 1, string)
  |> should.be_ok()
  |> should.equal("1")

  gxyz_tuple.at(x, 2, bool)
  |> should.be_ok()
  |> should.be_true()

  gxyz_tuple.at(x, 0, string)
  |> should.be_error()

  gxyz_tuple.at(x, 1, int)
  |> should.be_error()

  gxyz_tuple.at(x, 2, int)
  |> should.be_error()

  gxyz_tuple.at(#(), 0, string)
  |> should.be_error()
}
