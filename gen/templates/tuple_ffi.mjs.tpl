
{{#mappers}}
export function at{{count}}_{{index}}(tuple) {
    return at(tuple, {{index}})
}

export function map{{count}}_{{index}}(tuple, fn) {
    return map(tuple, {{index}}, fn)
}

{{/mappers}}

function at(tuple, index) {
    return tuple[index]
}

function map(tuple, index, fn) {
    const new_tuple = structuredClone(tuple);
    new_tuple[index] = fn(tuple[index])

    return new_tuple;
}
