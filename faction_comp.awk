
$1 ~ /^#/ {
    $1 = ""
    print "--"$0
}

/ID/ {
    faction_id = $2
    block_spec = 0
    next
}

$1 ~ /[0-9]+/ {
    line = "{"((faction_id * 1000) + block_spec)", extends = "$1", group = "faction_id"}"
    print line
    block_spec += 2
}
