
$1 ~ /^#/ { next }

/ID/ {
    faction_id = $2
    block_spec = 0
    next
}

$1 ~ /[0-9]+/ {
    line = "{"((faction_id * 1000) + block_spec)",\textends = "$1",\tgroup = "faction_id"}"
    print line
    block_spec++
}
