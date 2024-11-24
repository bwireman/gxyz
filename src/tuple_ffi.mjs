export function at(tuple, index) {
  return tuple[index];
}

export function map2_0(tuple, fn) {
  return map(tuple, 0, fn);
}

export function map2_1(tuple, fn) {
  return map(tuple, 1, fn);
}

export function map3_0(tuple, fn) {
  return map(tuple, 0, fn);
}

export function map3_1(tuple, fn) {
  return map(tuple, 1, fn);
}

export function map3_2(tuple, fn) {
  return map(tuple, 2, fn);
}

export function map4_0(tuple, fn) {
  return map(tuple, 0, fn);
}

export function map4_1(tuple, fn) {
  return map(tuple, 1, fn);
}

export function map4_2(tuple, fn) {
  return map(tuple, 2, fn);
}

export function map4_3(tuple, fn) {
  return map(tuple, 3, fn);
}

export function map5_0(tuple, fn) {
  return map(tuple, 0, fn);
}

export function map5_1(tuple, fn) {
  return map(tuple, 1, fn);
}

export function map5_2(tuple, fn) {
  return map(tuple, 2, fn);
}

export function map5_3(tuple, fn) {
  return map(tuple, 3, fn);
}

export function map5_4(tuple, fn) {
  return map(tuple, 4, fn);
}

function map(tuple, index, fn) {
  const new_tuple = structuredClone(tuple);
  new_tuple[index] = fn(tuple[index]);

  return new_tuple;
}
