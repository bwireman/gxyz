import gleam/io
import gleam/option.{type Option}
import gleam/string
import gleave
import gxyz/gxyz_list

/// strip js/ts files from argv (often present in node and deno implementation)
pub fn strip_js_from_argv(args: List(String)) -> List(String) {
  args
  |> gxyz_list.reject(string.ends_with(_, ".js"))
  |> gxyz_list.reject(string.ends_with(_, ".mjs"))
  |> gxyz_list.reject(string.ends_with(_, ".cjs"))
  |> gxyz_list.reject(string.ends_with(_, ".ts"))
  |> gxyz_list.reject(string.ends_with(_, ".mts"))
  |> gxyz_list.reject(string.ends_with(_, ".cts"))
}

fn do_hard_fail(
  res: Result(a, b),
  msg: Option(String),
  status_code: Option(Int),
) -> a {
  case res {
    Ok(a) -> a
    Error(_) -> {
      option.map(msg, io.print_error)

      status_code
      |> option.unwrap(1)
      |> gleave.exit()
      panic as "Unreachable, please create an issue in https://github.com/bwireman/gxyz if you see this"
    }
  }
}

/// Hard exit the program if the result is an Error and return the value if an Ok, exit 1, without a message 
pub fn hard_fail(res: Result(a, b)) -> a {
  do_hard_fail(res, option.None, option.None)
}

/// Hard exit the program if the result is an Error and return the value if an Ok, with the exit 1 and printing msg to stderror
pub fn hard_fail_with_msg(res: Result(a, b), msg: String) -> a {
  do_hard_fail(res, option.Some(msg), option.None)
}

/// Hard exit the program if the result is an Error and return the value if an Ok, with the exit code and printing msg to stderror
pub fn hard_fail_with_opts(
  res: Result(a, b),
  msg: String,
  status_code: Int,
) -> a {
  do_hard_fail(res, option.Some(msg), option.Some(status_code))
}
