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

  for (let count = 2; count < MAX_TUPLE_SIZE + 1; count++) {
    tuple.push(alphabet[count - 1]);
    for (let index = 0; index < count; index++) {
      const new_tuple = structuredClone(tuple);
      new_tuple[index] = "mapped";

      mappers.push({
        count: count,
        index: index,
        type: tuple[index],
        tuple: `#(${tuple.join(", ")})`,
        new_tuple: `#(${new_tuple.join(", ")})`,
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
}
