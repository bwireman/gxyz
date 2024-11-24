export function at(tuple, index) {
    return tuple[index]
}

{{#mappers}}
export function map{{count}}_{{index}}(tuple, fn) {
    return map(tuple, {{index}}, fn)
}

{{/mappers}}

function map(tuple, index, fn) {
    const new_tuple = structuredClone(tuple);
    new_tuple[index] = fn(tuple[index])

    return new_tuple;
}
