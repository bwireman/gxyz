import gleam/dynamic.{bool, int, string}
import gleeunit/should
import gxyz/gxyz_tuple

fn invert(x: Int) { x * -1 }

pub fn at_dynamic_test() {
  let x = #(1, "1", True)

  gxyz_tuple.at_dynamic(x, 0, int)
  |> should.be_ok()
  |> should.equal(1)

  gxyz_tuple.at_dynamic(x, 1, string)
  |> should.be_ok()
  |> should.equal("1")

  gxyz_tuple.at_dynamic(x, 2, bool)
  |> should.be_ok()
  |> should.be_true()

  gxyz_tuple.at_dynamic(x, 0, string)
  |> should.be_error()

  gxyz_tuple.at_dynamic(x, 1, int)
  |> should.be_error()

  gxyz_tuple.at_dynamic(x, 2, int)
  |> should.be_error()

  gxyz_tuple.at_dynamic(#(), 0, string)
  |> should.be_error()

  gxyz_tuple.at_dynamic(#(1), 0, int)
|> should.be_ok()
  |> should.equal(1)
}

{{#mappers}}
pub fn at{{count}}_{{index}}_test() {
  {{values}}
  |> gxyz_tuple.at{{count}}_{{index}}()
  |> should.equal({{value}})
}

pub fn map{{count}}_{{index}}_test() {
  {{values}}
  |> gxyz_tuple.map{{count}}_{{index}}(invert)
  |> should.equal({{mapped_values}})
}

{{/mappers}}

{{#applys}}
pub fn apply_from{{count}}_test() {
  let fun = fn({{args}}) {
    {{math}}
  }
  
  {{values}}
  |> gxyz_tuple.apply_from{{count}}(fun)
  |> should.equal({{sum}})
}
{{/applys}}