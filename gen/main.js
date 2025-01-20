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
  if (index == 0) {
    return "st";
  } else if (index == 1) {
    return "nd";
  } else if (index == 2) {
    return "rd";
  }

  return "th";
}

function getMappersAndApplys() {
  const mappers = [];
  const applys = [];
  const tuple = ["a"];
  const tupleLiteral = ["_"];
  const values = [1];
  let sum = 1;

  for (let count = 2; count < MAX_TUPLE_SIZE + 1; count++) {
    const ats = [];

    tuple.push(alphabet[count - 1]);
    tupleLiteral.push("_");
    values.push(count);
    sum += count;

    for (let index = 0; index < count; index++) {
      const newTuple = structuredClone(tuple);
      newTuple[index] = "mapped";

      let tupleLiteralLocal = structuredClone(tupleLiteral);
      tupleLiteralLocal[index] = tuple[index];

      const mappedValues = structuredClone(values);
      mappedValues[index] = mappedValues[index] * -1;

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
        tupleLiteral: `#(${tupleLiteralLocal.join(", ")})`,
        new_tuple: `#(${newTuple.join(", ")})`,
        values: `#(${values.join(", ")})`,
        value: index + 1,
        mappedValues: `#(${mappedValues.join(", ")})`,
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

function getFreezes() {
  const freezes = [];
  const args = [];
  const elems = [];
  let sum = 1;

  for (let count = 1; count < MAX_FREEZE_SIZE + 1; count++) {
    sum += count;
    args.push(alphabet[count - 1]);
    const local_args = structuredClone(args);

    elems.push(count);
    const local_elems = structuredClone(elems);

    freezes.push({
      arity: count,
      args: local_args,
      type: alphabet[count],
      sum: sum,
      elems: local_elems,
      math: local_args.join(" + "),
    });
  }

  return freezes;
}

if (import.meta.main) {
  const [tupleMappers, tupleApplys] = getMappersAndApplys();
  const functionFreezes = getFreezes();

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
