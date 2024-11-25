
{{#indexers}}
export function at__{{zero_indexed}}(tuple) {
    return tuple[{{zero_indexed}}]
}

export function map__{{zero_indexed}}(tuple, fn) {
    return map(tuple, {{zero_indexed}}, fn)
}

{{/indexers}}

function map(tuple, index, fn) {
    const new_tuple = structuredClone(tuple);
    new_tuple[index] = fn(tuple[index])

    return new_tuple;
}
