import gleam/list
import gleam/string

pub fn reject(l: List(a), rejecting: fn(a) -> Bool) -> List(a) {
  list.filter(l, fn(a) { !rejecting(a) })
}

pub fn reject_empty(l: List(String)) -> List(String) {
  reject(l, string.is_empty)
}
