# /function herald:uninstall — remove all Herald data, then disable the pack with /datapack disable
schedule clear herald:loop
scoreboard objectives remove ann.id
scoreboard objectives remove ann.left
scoreboard objectives remove ann.tmp
scoreboard objectives remove announce
tag @a remove ann.known
tag @a remove ann.pending
data remove storage herald:data history
data remove storage herald:data cur
data remove storage herald:data tmp
data remove storage herald:data archive
data remove storage herald:data show
data remove storage herald:data menu
data remove storage herald:data e
tellraw @s {text:"Herald data removed. Now run /datapack disable on the pack (see /datapack list).",color:"yellow"}
