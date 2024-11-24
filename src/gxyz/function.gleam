pub fn freeze(value: a) -> fn() -> a {
  fn() { value }
}

pub fn freeze1(fun: fn(a) -> b, arg1: a) -> fn() -> b {
  fn() { fun(arg1) }
}

pub fn freeze2(fun: fn(a, b) -> c, arg1: a, arg2: b) -> fn() -> c {
  fn() { fun(arg1, arg2) }
}

pub fn freeze3(fun: fn(a, b, c) -> d, arg1: a, arg2: b, arg3: c) -> fn() -> d {
  fn() { fun(arg1, arg2, arg3) }
}

pub fn freeze4(
  fun: fn(a, b, c, d) -> e,
  arg1: a,
  arg2: b,
  arg3: c,
  arg4: d,
) -> fn() -> e {
  fn() { fun(arg1, arg2, arg3, arg4) }
}

pub fn freeze5(
  fun: fn(a, b, c, d, e) -> f,
  arg1: a,
  arg2: b,
  arg3: c,
  arg4: d,
  arg5: e,
) -> fn() -> f {
  fn() { fun(arg1, arg2, arg3, arg4, arg5) }
}

pub fn iff(condition: Bool, f: fn() -> a, default: a) -> a {
  case condition {
    True -> f()
    _ -> default
  }
}

pub fn iff_nil(condition: Bool, f: fn() -> Nil) -> Nil {
  iff(condition, f, Nil)
}

pub fn ignore_result(condition: Bool, f: fn() -> Result(a, b)) -> Nil {
  case condition {
    True -> {
      let _ = f()
      Nil
    }
    _ -> Nil
  }
}
