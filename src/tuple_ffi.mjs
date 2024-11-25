export function at__0(tuple) {
  return tuple[0];
}

export function map__0(tuple, fn) {
  return map(tuple, 0, fn);
}

export function at__1(tuple) {
  return tuple[1];
}

export function map__1(tuple, fn) {
  return map(tuple, 1, fn);
}

export function at__2(tuple) {
  return tuple[2];
}

export function map__2(tuple, fn) {
  return map(tuple, 2, fn);
}

export function at__3(tuple) {
  return tuple[3];
}

export function map__3(tuple, fn) {
  return map(tuple, 3, fn);
}

export function at__4(tuple) {
  return tuple[4];
}

export function map__4(tuple, fn) {
  return map(tuple, 4, fn);
}

function map(tuple, index, fn) {
  const new_tuple = structuredClone(tuple);
  new_tuple[index] = fn(tuple[index]);

  return new_tuple;
}
