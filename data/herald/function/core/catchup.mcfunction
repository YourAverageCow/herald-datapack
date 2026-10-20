# Run as a player who just joined: show every stored announcement (last 5) they haven't seen.
tag @s remove ann.pending
scoreboard players enable @s announce
execute unless score @s ann.id matches -2147483648.. run scoreboard players set @s ann.id 0
execute if score @s ann.id >= #latest ann.id run return 0

# Collect unseen entries into "show", oldest first
data modify storage herald:data show set value []
data modify storage herald:data tmp set from storage herald:data history
execute if data storage herald:data tmp[0] run function herald:core/catchup_step
scoreboard players operation @s ann.id = #latest ann.id
execute store result score #missed ann.tmp run data get storage herald:data show
execute if score #missed ann.tmp matches 0 run return 0

execute if score #missed ann.tmp matches 1 run tellraw @s {text:"\n✉ You missed an announcement while you were away:",color:"yellow"}
execute if score #missed ann.tmp matches 2.. run tellraw @s ["",{text:"\n✉ You missed ",color:"yellow"},{score:{name:"#missed",objective:"ann.tmp"},color:"gold",bold:true},{text:" announcements while you were away:",color:"yellow"}]
function herald:core/catchup_show

title @s times 10 70 20
title @s subtitle ["",{score:{name:"#missed",objective:"ann.tmp"},color:"white"},{text:" new while you were away — see chat",color:"gray"}]
title @s title {text:"Announcements",color:"gold",bold:true}
playsound minecraft:block.note_block.bell master @s ~ ~ ~ 1 1.2
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1.6
