import { Error, Ok } from "../prelude.mjs";
const err = new Error(undefined);

export function element(index, tuple) {
  const val = tuple[index - 1];

  if (val === undefined) {
    return err;
  } else {
    return new Ok(val);
  }
}
