/// calls an arity 0 function if the condition is True, otherwise returns the default value
pub fn iff(condition: Bool, f: fn() -> a, default: a) -> a {
  case condition {
    True -> f()
    _ -> default
  }
}

/// calls an arity 0 function if the condition is True, and returns Nil
pub fn iff_nil(condition: Bool, f: fn() -> Nil) -> Nil {
  iff(condition, f, Nil)
}

/// calls an arity 0 function if the condition is True, ignores the Result and returns Nil
pub fn ignore_result(condition: Bool, f: fn() -> Result(a, b)) -> Nil {
  case condition {
    True -> {
      let _ = f()
      Nil
    }
    _ -> Nil
  }
}

/// freezes a value as an arity 0 function
/// freezes a value as an arity 0 function
/// ```
///: let x = function.freeze(1)
///: assert x() == 1
///: assert x() == 1
/// ```
pub fn freeze(value: a) -> fn() -> a {
  fn() { value }
}

{{#freezes}}
/// freezes an arity {{arity}} function and it's arg as an arity 0 function
pub fn freeze{{arity}}(fun: fn({{args}}) -> {{type}}, {{args}}) -> fn() -> {{type}} {
  fn() { fun({{args}}) }
}

{{/freezes}}