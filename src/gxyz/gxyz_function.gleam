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
pub fn freeze(value: a) -> fn() -> a {
  fn() { value }
}

/// freezes an arity 1 function and it's arg as an arity 0 function
pub fn freeze1(fun: fn(a) -> b, a) -> fn() -> b {
  fn() { fun(a) }
}

/// freezes an arity 2 function and it's arg as an arity 0 function
pub fn freeze2(fun: fn(a, b) -> c, a, b) -> fn() -> c {
  fn() { fun(a, b) }
}

/// freezes an arity 3 function and it's arg as an arity 0 function
pub fn freeze3(fun: fn(a, b, c) -> d, a, b, c) -> fn() -> d {
  fn() { fun(a, b, c) }
}

/// freezes an arity 4 function and it's arg as an arity 0 function
pub fn freeze4(fun: fn(a, b, c, d) -> e, a, b, c, d) -> fn() -> e {
  fn() { fun(a, b, c, d) }
}

/// freezes an arity 5 function and it's arg as an arity 0 function
pub fn freeze5(fun: fn(a, b, c, d, e) -> f, a, b, c, d, e) -> fn() -> f {
  fn() { fun(a, b, c, d, e) }
}
