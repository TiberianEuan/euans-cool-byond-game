obj/items

    verb/Get()
        set src in oview(1)
        if(src in oview(1))  // sanity check; the verb could come in late
            loc = usr
            usr << "You pick up [src]."
            oview() << "[usr] picks up \a [src]."
            usr.UpdateInventory()

    verb/Drop()
        set src in usr
        if(src in usr)  // sanity check; the verb could come in late
            if(IsEquipped())
                usr.Unequip(src)
                if(IsEquipped()) return // unequip failed
            loc = usr.loc
            usr << "You drop [src]."
            oview() << "[usr] drops \a [src]."
            usr.UpdateInventory()

    proc/IsEquipped()
        if(islot)
            var/mob/M = loc
            if(ismob(M) && M.equipment && M.equipment[islot]==src)
                return 1
        return 0

    verb/Equip()
        if(islot) usr.Equip(src)

    verb/Unequip()
        if(islot) usr.Unequip(src)

mob/proc/UpdateInventory()
    var/items = 0
    for(var/obj/items/O in src)
        if(equipment && O.islot && equipment[O.islot]==O)
            continue    // don't show equipped items
        winset(src, "inventory", "current-cell=[++items]")
        src << output(O, "inventory")
    winset(src, "inventory", "cells=[items]")   // cut off any remaining cells
///*
mob/proc/UpdateEquipment()
    var/items = 0
    for(var/islot in equipment)
        winset(src, "equipment", "current-cell=1,[++items]")
        src << output(islot, "equipment")
        winset(src, "equipment", "current-cell=2,[items]")
        src << output(equipment[islot], "equipment")
    winset(src, "equipment", "cells=2x[items]")  // cut off any remaining rows
//*/