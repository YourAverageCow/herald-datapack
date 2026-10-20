# /function herald:clear — wipe ALL announcements (board archive + login queue)
data modify storage herald:data history set value []
data modify storage herald:data archive set value []
tellraw @s {text:"✔ All announcements cleared.",color:"green"}
