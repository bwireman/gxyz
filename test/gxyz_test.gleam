import gleeunit
import testament
import testament/conf

pub fn main() {
  testament.test_main_with_opts(gleeunit.main, [
    conf.ExtraImports("src/gxyz/list.gleam", [
      conf.Import("gleam/pair", ["first", "second"]),
      conf.Import("gleam/string", ["starts_with"]),
      conf.Import("gleam/int", ["is_even", "is_odd"]),
    ]),
    conf.ExtraImports("src/gxyz/tuple.gleam", [
      conf.Import("gleam/dynamic/decode", ["int", "string"]),
    ]),
  ])
}
