import gleeunit/should
import gxyz/cli

pub fn strip_js_from_argv_test() {
  []
  |> cli.strip_js_from_argv()
  |> should.equal([])

  ["foo.js", "foo.mjs", "foo.cjs", "foo.ts", "foo.mts", "foo.cts"]
  |> cli.strip_js_from_argv()
  |> should.equal([])
}

pub fn hard_exit_happy_path_test() {
  Ok([])
  |> cli.hard_fail()
  |> should.equal([])

  Ok(True)
  |> cli.hard_fail_with_msg("foo")
  |> should.equal(True)

  Ok("foo")
  |> cli.custom_hard_fail([
    cli.FailOptEcho,
    cli.FailOptExitCode(2),
    cli.FailOptMessage("bummer"),
  ])
  |> should.equal("foo")

  Ok(1)
  |> cli.hard_fail()
  |> should.equal(1)
}
