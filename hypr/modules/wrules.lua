hl.window_rule({
    match = { class = "Spotify" },
    workspace = "8",
    float = true,
    size = { 1400, 850 },
    move = { 220, 100 },
})

hl.window_rule({ match = { class = "vesktop" }, workspace = "7" })


hl.window_rule({ match = { class = "^steam_app_\\d+$" }, workspace = "name:game" })
hl.window_rule({ match = { class = "net.lutris.Lutris" }, workspace = "name:game" })


hl.window_rule({
    match = { class = "^(com.gabm.satty)$" },
    float = true,
    center = true,
    size = "1000 700",
})
