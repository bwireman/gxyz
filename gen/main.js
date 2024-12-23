import Mustache from "mustache";
const MAX_TUPLE_SIZE = 5;
const MAX_FREEZE_SIZE = 5;
const alphabet = "abcdefghijklmnopqrstuvwxyz";

async function render(src, dst, data) {
  const text = await Deno.readTextFile(src);
  const output = Mustache.render(text, data);
  Deno.writeTextFile(dst, output);
}

function get_suffix(index) {
  let suffix = "th";
  if (index == 0) {
    suffix = "st";
  } else if (index == 1) {
    suffix = "nd";
  } else if (index == 2) {
    suffix = "rd";
  }
  return suffix;
}

function get_mappers_and_applys() {
  const mappers = [];
  const applys = [];
  const tuple = ["a"];
  const tuple_literal = ["_"];
  const values = [1];
  let sum = 1;

  for (let count = 2; count < MAX_TUPLE_SIZE + 1; count++) {
    const ats = [];

    tuple.push(alphabet[count - 1]);
    tuple_literal.push("_");
    values.push(count);
    sum += count;

    for (let index = 0; index < count; index++) {
      const new_tuple = structuredClone(tuple);
      new_tuple[index] = "mapped";

      let tuple_literal_local = structuredClone(tuple_literal);
      tuple_literal_local[index] = tuple[index];

      const mapped_values = structuredClone(values);
      mapped_values[index] = mapped_values[index] * -1;

      const not_last = !(count == MAX_TUPLE_SIZE && index == count - 1);

      ats.push({
        index,
        not_last,
      });

      mappers.push({
        count: count,
        index: index,
        type: tuple[index],
        tuple: `#(${tuple.join(", ")})`,
        tuple_literal: `#(${tuple_literal_local.join(", ")})`,
        new_tuple: `#(${new_tuple.join(", ")})`,
        values: `#(${values.join(", ")})`,
        value: index + 1,
        mapped_values: `#(${mapped_values.join(", ")})`,
        index_name: `${index + 1}${get_suffix(index)}`,
      });
    }

    applys.push({
      tuple: `#(${tuple.join(", ")})`,
      count,
      values: `#(${values.join(", ")})`,
      args: tuple.join(", "),
      type: alphabet[count],
      ats: ats,
      math: tuple.join(" + "),
      sum,
    });
  }

  return [mappers, applys];
}

function get_freezes() {
  const freezes = [];
  const args = [];
  const elems = [];
  let sum = 1;

  for (let count = 1; count < MAX_FREEZE_SIZE + 1; count++) {
    sum += count;
    args.push(alphabet[count - 1]);
    const new_args = structuredClone(args);

    elems.push(count);
    const new_elems = structuredClone(elems);

    freezes.push({
      arity: count,
      args: new_args,
      type: alphabet[count],
      sum: sum,
      elems: new_elems,
      math: args.join(" + "),
    });
  }

  return freezes;
}

if (import.meta.main) {
  const [tupleMappers, tupleApplys] = get_mappers_and_applys();
  const functionFreezes = get_freezes();

  // tuples
  render(
    "./gen/templates/gxyz_tuple.gleam.tpl",
    "./src/gxyz/gxyz_tuple.gleam",
    {
      mappers: tupleMappers,
      applys: tupleApplys,
    },
  );

  render("./gen/templates/tuple_test.gleam.tpl", "./test/tuple_test.gleam", {
    mappers: tupleMappers,
    applys: tupleApplys,
  });

  // functions
  render(
    "./gen/templates/gxyz_function.gleam.tpl",
    "./src/gxyz/gxyz_function.gleam",
    { freezes: functionFreezes },
  );

  render(
    "./gen/templates/function_test.gleam.tpl",
    "./test/function_test.gleam",
    { freezes: functionFreezes },
  );
}
