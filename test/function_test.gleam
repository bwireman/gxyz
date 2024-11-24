import gleeunit/should
import gxyz/function.{freeze, freeze1, freeze2, freeze3, freeze4, freeze5}

pub fn freeze_test() {
  should.equal(freeze(1)(), 1)
}

pub fn freeze1_test() {
  should.equal(freeze1(fn(a) { a + 1 }, 1)(), 2)
}

pub fn freeze2_test() {
  should.equal(freeze2(fn(a, b) { a + b }, 1, 2)(), 3)
}

pub fn freeze3_test() {
  should.equal(freeze3(fn(a, b, c) { a + b + c }, 1, 2, 3)(), 6)
}

pub fn freeze4_test() {
  should.equal(freeze4(fn(a, b, c, d) { a + b + c + d }, 1, 2, 3, 4)(), 10)
}

pub fn freeze5_test() {
  should.equal(
    freeze5(fn(a, b, c, d, e) { a + b + c + d + e }, 1, 2, 3, 4, 5)(),
    15,
  )
}
