import gleam/io
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/string
import gleave
import gxyz/list as glist

const default = FailConf(None, 1, False)

type FailConf {
  FailConf(message: Option(String), exit: Int, do_echo: Bool)
}

pub type FailOpt {
  FailOptMessage(String)
  FailOptExitCode(Int)
  FailOptEcho
}

fn do_hard_fail(res: Result(a, b), conf: FailConf) -> a {
  case res {
    Ok(a) -> a
    Error(err) -> {
      option.map(conf.message, io.print_error)
      case conf.do_echo {
        False -> Nil
        True ->
          err
          |> string.inspect()
          |> io.print_error()
      }

      gleave.exit(conf.exit)
      panic as "Unreachable, please create an issue in https://github.com/bwireman/gxyz if you see this"
    }
  }
}

/// Hard exit the program if the result is an Error and return the value if an Ok, exit 1, without a message 
pub fn hard_fail(res: Result(a, b)) -> a {
  do_hard_fail(res, default)
}

/// Hard exit the program if the result is an Error and return the value if an Ok, with the exit 1 and printing msg to stderror
pub fn hard_fail_with_msg(res: Result(a, b), msg: String) -> a {
  do_hard_fail(res, FailConf(..default, message: Some(msg)))
}

pub fn custom_hard_fail(res: Result(a, b), options: List(FailOpt)) {
  list.fold(options, default, fn(conf, opt) {
    case opt {
      FailOptMessage(msg) -> FailConf(..conf, message: Some(msg))
      FailOptExitCode(status) -> FailConf(..conf, exit: status)
      FailOptEcho -> FailConf(..conf, do_echo: True)
    }
  })
  |> do_hard_fail(res, _)
}

/// Hard exit the program if the result is an Error and return the value if an Ok, with the exit code and printing msg to stderror
@deprecated("Please use `custom_hard_fail/2` instead")
pub fn hard_fail_with_opts(
  res: Result(a, b),
  msg: String,
  status_code: Int,
) -> a {
  do_hard_fail(res, FailConf(..default, message: Some(msg), exit: status_code))
}

/// strip js/ts files from argv (often present in node and deno implementation)
pub fn strip_js_from_argv(args: List(String)) -> List(String) {
  args
  |> glist.reject(string.ends_with(_, ".js"))
  |> glist.reject(string.ends_with(_, ".mjs"))
  |> glist.reject(string.ends_with(_, ".cjs"))
  |> glist.reject(string.ends_with(_, ".ts"))
  |> glist.reject(string.ends_with(_, ".mts"))
  |> glist.reject(string.ends_with(_, ".cts"))
}
