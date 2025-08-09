import gleeunit
import testament
import testament/conf

pub fn main() {
  testament.test_main_with_opts(gleeunit.main, [
    conf.ExtraImports("src/gxyz/list.gleam", ["gleam/pair", "gleam/string"]),
    conf.ExtraImports("src/gxyz/tuple.gleam", [
      "gleam/dynamic/decode.{int, string}",
    ]),
  ])
}
