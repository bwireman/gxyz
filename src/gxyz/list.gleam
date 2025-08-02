import gleam/list
import gleam/pair

/// removes elements from the list that don't satisfy the predicate
/// ```
///: let nums = [1, 2, 3, 2, 1]
///: assert list.reject(nums, fn(n) {n % 2 == 0} ) == [1, 3, 1]
///: assert list.reject(nums, fn(n) {n % 2 == 1} ) == [2, 2]
///  ```
pub fn reject(l: List(a), rejecting: fn(a) -> Bool) -> List(a) {
  list.filter(l, fn(a) { !rejecting(a) })
}

/// returns elements equal to filter value
/// ```
///: let nums = [1, 2, 3, 2, 1]
///: assert list.filter_is(nums, 1) == [1, 1]
///: assert list.filter_is(nums, 4) == []
/// ```
pub fn filter_is(l: List(a), filter: a) -> List(a) {
  list.filter(l, fn(a) { a == filter })
}

/// returns elements not equal to filter value
/// ```
///: let nums = [1, 2, 3, 2, 1]
///: assert list.reject_is(nums, 1) == [2, 3, 2]
///: assert list.reject_is(nums, 4) == nums
/// ```
pub fn reject_is(l: List(a), filter: a) -> List(a) {
  reject(l, fn(a) { a == filter })
}

/// returns elements contained in the filter list
/// ```
///: let nums = [1, 2, 3, 2, 1]
///: assert list.filter_contains(nums, [3, 2]) == [2, 3, 2]
///: assert list.filter_contains(nums, []) == []
/// ```
pub fn filter_contains(l: List(a), filter: List(a)) -> List(a) {
  list.filter(l, list.contains(filter, _))
}

/// returns elements not contained in the filter list
/// ```
///: let nums = [1, 2, 3, 2, 1]
///: assert list.reject_contains(nums, [3, 2]) == [1, 1]
///: assert list.reject_contains(nums, []) == nums
/// ```
pub fn reject_contains(l: List(a), filter: List(a)) -> List(a) {
  reject(l, list.contains(filter, _))
}

/// returns elements where the tapped value satisfies the predicate
/// ```
///: import gleam/pair
///: import gleam/string
///: let vals = [#(0, "Aa"), #(1, "Bb"), #(2, "Cc")]
///: assert list.filter_tap(vals, pair.first, fn(v) { v % 2 == 0  }) == [#(0, "Aa"), #(2, "Cc")]
///: assert list.filter_tap(vals, pair.second, string.starts_with(_, "A")) == [#(0, "Aa")]
/// ```
pub fn filter_tap(l: List(a), tap: fn(a) -> b, filter: fn(b) -> Bool) -> List(a) {
  list.map(l, fn(original) { #(original, tap(original)) })
  |> list.filter(fn(elem) { filter(elem.1) })
  |> list.map(fn(elem) { elem.0 })
}

/// returns elements where the tapped value does not satisfy the predicate
/// ```
///: import gleam/pair
///: import gleam/string
///: let vals = [#(0, "Aa"), #(1, "Bb"), #(2, "Cc")]
///: assert list.reject_tap(vals, pair.first, fn(v) { v % 2 == 0  }) == [#(1, "Bb")]
///: assert list.reject_tap(vals, pair.second, string.starts_with(_, "A")) == [#(1, "Bb"), #(2, "Cc")]
/// ```
pub fn reject_tap(l: List(a), tap: fn(a) -> b, filter: fn(b) -> Bool) -> List(a) {
  filter_tap(l, tap, fn(b) { !filter(b) })
}

/// returns elements where the tapped value exists in the list
/// ```
///: import gleam/pair
///: let vals = [#(0, "Aa"), #(1, "Bb"), #(2, "Cc")]
///: assert list.filter_contains_tap(vals, pair.first, [0, 1]) == [#(0, "Aa"), #(1, "Bb")]
///: assert list.filter_contains_tap(vals, pair.first, [3]) == []
/// ```
pub fn filter_contains_tap(
  l: List(a),
  tap: fn(a) -> b,
  contains: List(b),
) -> List(a) {
  filter_tap(l, tap, list.contains(contains, _))
}

/// returns elements where the tapped value does not exist in the list
/// ```
///: import gleam/pair
///: let vals = [#(0, "Aa"), #(1, "Bb"), #(2, "Cc")]
///: assert list.reject_contains_tap(vals, pair.first, [0, 1]) == [#(2, "Cc")]
///: assert list.reject_contains_tap(vals, pair.first, [3]) == vals
/// ```
pub fn reject_contains_tap(
  l: List(a),
  tap: fn(a) -> b,
  contains: List(b),
) -> List(a) {
  reject_tap(l, tap, list.contains(contains, _))
}

/// returns a list of tuples containing the value in the second position
/// ```
///: let vals = [0, 1, 2]
///: assert list.with(vals, True) == [#(0, True), #(1, True), #(2, True)]
/// ```
pub fn with(l: List(a), value: b) -> List(#(a, b)) {
  list.map(l, pair.new(_, value))
}

/// returns a list of tuples containing the value in the second position, mapping the first
/// ```
///: let vals = [0, 1, 2]
///: assert list.map_with(vals, True, fn(n) { n * 2 }) == [#(0, True), #(2, True), #(4, True)]
/// ```
pub fn map_with(l: List(a), value: b, fun: fn(a) -> c) -> List(#(c, b)) {
  list.map(l, fun)
  |> list.map(pair.new(_, value))
}
