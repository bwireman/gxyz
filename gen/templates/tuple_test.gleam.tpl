import gleam/dynamic/decode.{bool, int, string}
import gleeunit/should
import gxyz/tuple

fn invert(x: Int) { x * -1 }

pub fn at_dynamic_test() {
  let x = #(1, "1", True)

  tuple.at_dynamic(x, 0, int)
  |> should.be_ok()
  |> should.equal(1)

  tuple.at_dynamic(x, 1, string)
  |> should.be_ok()
  |> should.equal("1")

  tuple.at_dynamic(x, 2, bool)
  |> should.be_ok()
  |> should.be_true()

  tuple.at_dynamic(x, 0, string)
  |> should.be_error()

  tuple.at_dynamic(x, 1, int)
  |> should.be_error()

  tuple.at_dynamic(x, 2, int)
  |> should.be_error()

  tuple.at_dynamic(x, 200, int)
  |> should.be_error()

  tuple.at_dynamic(#(1), 0, int)
  |> should.be_ok()
  |> should.equal(1)
}

{{#mappers}}
pub fn map{{count}}_{{index}}_test() {
  {{values}}
  |> tuple.map{{count}}_{{index}}(invert)
  |> should.equal({{mappedValues}})
}
{{/mappers}}

{{#applys}}
pub fn apply_from{{count}}_test() {
  let fun = fn({{args}}) {
    {{math}}
  }
  
  {{values}}
  |> tuple.apply_from{{count}}(fun)
  |> should.equal({{sum}})
}
{{/applys}}