import gleam/list

/// removes elements from the list if the predicate returns True
pub fn reject(l: List(a), rejecting: fn(a) -> Bool) -> List(a) {
  list.filter(l, fn(a) { !rejecting(a) })
}
