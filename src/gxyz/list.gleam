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
