import gleam/dynamic.{bool, int, string}
import gleeunit/should
import gxyz/tuple

pub fn at_test() {
  let x = #(1, "1", True)

  tuple.at(x, 0, int)
  |> should.be_ok()
  |> should.equal(1)

  tuple.at(x, 1, string)
  |> should.be_ok()
  |> should.equal("1")

  tuple.at(x, 2, bool)
  |> should.be_ok()
  |> should.be_true()

  tuple.at(x, 0, string)
  |> should.be_error()

  tuple.at(x, 1, int)
  |> should.be_error()

  tuple.at(x, 2, int)
  |> should.be_error()

  tuple.at(#(), 0, string)
  |> should.be_error()
}
