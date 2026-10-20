# Appends archive[#idx] to the dialog, walking toward older entries until #left hits 0.
execute store result storage herald:data menu.nav.i int 1 run scoreboard players get #idx ann.tmp
function herald:menu/entry with storage herald:data menu.nav
scoreboard players remove #idx ann.tmp 1
scoreboard players remove #left ann.tmp 1
execute if score #left ann.tmp matches 1.. run function herald:menu/entries
