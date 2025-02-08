import gleam/option
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

pub fn filter_is_test() {
  list.filter_is([], 0)
  |> should.equal([])

  list.filter_is([1, 2, 3], 1)
  |> should.equal([1])

  list.filter_is([1, 2, 3], 0)
  |> should.equal([])
}

pub fn reject_is_test() {
  list.reject_is([], 0)
  |> should.equal([])

  list.reject_is([1, 2, 3], 1)
  |> should.equal([2, 3])

  list.reject_is([1, 2, 3], 0)
  |> should.equal([1, 2, 3])
}

pub fn filter_contains_test() {
  list.filter_contains([], [])
  |> should.equal([])

  list.filter_contains([1, 2, 3], [])
  |> should.equal([])

  list.filter_contains([1, 2, 3], [0, 1])
  |> should.equal([1])
}

pub fn reject_contains_test() {
  list.reject_contains([], [])
  |> should.equal([])

  list.reject_contains([1, 2, 3], [])
  |> should.equal([1, 2, 3])

  list.reject_contains([1, 2, 3], [0, 1])
  |> should.equal([2, 3])
}

pub fn with_test() {
  list.with([], option.None)
  |> should.equal([])

  list.with([1, 2, 3], "foo")
  |> should.equal([#(1, "foo"), #(2, "foo"), #(3, "foo")])
}

pub fn map_with_test() {
  list.map_with([], option.None, fn(x) { x + 1 })
  |> should.equal([])

  list.map_with([1, 2, 3], "bar", fn(x) { x + 1 })
  |> should.equal([#(2, "bar"), #(3, "bar"), #(4, "bar")])
}
