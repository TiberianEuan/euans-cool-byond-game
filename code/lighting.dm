obj/lighting_plane
    plane = 2   // or whatever plane you use for lighting
    screen_loc = "CENTER"
    blend_mode = BLEND_MULTIPLY
    // this has an ambient light of 20% gray added to all lights
    color = list(null, null, null, "#0000", "#333f")

    New(client/C)
        C.screen += src

        var/obj/O = new
        O.blend_mode = BLEND_OVERLAY  // this is important so it doesn't inherit
        O.icon = 'blackness.dmi'  // a black icon using your regular world.icon_size
        O.layer = BACKGROUND_LAYER
        overlays += O
        UpdateView(C)

    // call this any time client.view changes!
    proc/UpdateView(client/C)
        var/vx,vy
        var/obj/O = new
        var/list/L = overlays.Copy()
        O.appearance = L[1]
        if(isnum(C.view)) vx = vy = (2*C.view) + 2
        else
            L = splittext(C.view, "x")
            vx = L[1] + 1
            vy = L[2] + 1
        O.transform = matrix(vx, 0, 0, 0, vy, 0)
        overlays = list(O)