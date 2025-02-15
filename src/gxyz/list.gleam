import gleam/list
import gleam/pair

pub fn filter_is(l: List(a), filter: a) -> List(a) {
  list.filter(l, fn(a) { a == filter })
}

pub fn reject_is(l: List(a), filter: a) -> List(a) {
  reject(l, fn(a) { a == filter })
}

pub fn filter_contains(l: List(a), filter: List(a)) -> List(a) {
  list.filter(l, list.contains(filter, _))
}

pub fn reject_contains(l: List(a), filter: List(a)) -> List(a) {
  reject(l, list.contains(filter, _))
}

pub fn filter_tap(l: List(a), tap: fn(a) -> b, filter: fn(b) -> Bool) -> List(a) {
  list.map(l, fn(original) { #(original, tap(original)) })
  |> list.filter(fn(elem) { filter(elem.1) })
  |> list.map(fn(elem) { elem.0 })
}

pub fn reject_tap(l: List(a), tap: fn(a) -> b, filter: fn(b) -> Bool) -> List(a) {
  filter_tap(l, tap, fn(b) { !filter(b) })
}

pub fn filter_contains_tap(
  l: List(a),
  tap: fn(a) -> b,
  contains: List(b),
) -> List(a) {
  filter_tap(l, tap, list.contains(contains, _))
}

pub fn reject_contains_tap(
  l: List(a),
  tap: fn(a) -> b,
  contains: List(b),
) -> List(a) {
  reject_tap(l, tap, list.contains(contains, _))
}

/// removes elements from the list if the predicate returns True
pub fn reject(l: List(a), rejecting: fn(a) -> Bool) -> List(a) {
  list.filter(l, fn(a) { !rejecting(a) })
}

pub fn with(l: List(a), value: b) -> List(#(a, b)) {
  list.map(l, pair.new(_, value))
}

pub fn map_with(l: List(a), value: b, fun: fn(a) -> c) -> List(#(c, b)) {
  list.map(l, fun)
  |> list.map(pair.new(_, value))
}
