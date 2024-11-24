import Mustache from "mustache";
const MAX_TUPLE_SIZE = 5;
const alphabet = "abcdefghijklmnopqrstuvwxyz";

async function render(src, dst, data) {
  const text = await Deno.readTextFile(src);
  const output = Mustache.render(text, data);
  Deno.writeTextFile(dst, output);
}

if (import.meta.main) {
  const mappers = [];
  const tuple = ["a"];
  const values = [1];

  for (let count = 2; count < MAX_TUPLE_SIZE + 1; count++) {
    tuple.push(alphabet[count - 1]);
    values.push(count);
    for (let index = 0; index < count; index++) {
      const new_tuple = structuredClone(tuple);
      new_tuple[index] = "mapped";

      const new_erl_tuple = structuredClone(tuple);
      new_erl_tuple[index] = `FN(${tuple[index]})`;

      const mapped_values = structuredClone(values);
      mapped_values[index] = mapped_values[index] * -1;

      let suffix = "th";
      if (index == 0) {
        suffix = "st";
      } else if (index == 1) {
        suffix = "nd";
      } else if (index == 2) {
        suffix = "rd";
      }

      mappers.push({
        count: count,
        index: index,
        type: tuple[index],
        tuple: `#(${tuple.join(", ")})`,
        new_tuple: `#(${new_tuple.join(", ")})`,
        // erlang
        erl_tuple: `{${tuple.join(", ")}}`.toUpperCase(),
        new_erl_tuple: `{${new_erl_tuple.join(", ")}}`.toUpperCase(),
        not_last: !(count == MAX_TUPLE_SIZE && index == count - 1),
        values: `#(${values.join(", ")})`,
        value: index + 1,
        mapped_values: `#(${mapped_values.join(", ")})`,

        index_name: `${index + 1}${suffix}`,
      });
    }
  }

  render("./gen/templates/tuple_ffi.erl.tpl", "./src/tuple_ffi.erl", {
    mappers: mappers,
  });
  render(
    "./gen/templates/gxyz_tuple.gleam.tpl",
    "./src/gxyz/gxyz_tuple.gleam",
    { mappers: mappers },
  );
  render("./gen/templates/tuple_ffi.mjs.tpl", "./src/tuple_ffi.mjs", {
    mappers: mappers,
  });

  render("./gen/templates/tuple_test.gleam.tpl", "./test/tuple_test.gleam", {
    mappers: mappers,
  });
}
