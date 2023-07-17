
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
    features = ""
    for (i = 1; i <= NF; i++) {
        if ($i ~ /[A-Z_]+/)
            features = features "|" $i
    }
    line = "{"((faction_id * 1000) + block_spec)", extends = "$1", group = "faction_id", features=PALETTE"features"}"
    print line
    block_spec += 2
}
