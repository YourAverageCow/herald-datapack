# Walks tmp (copy of history) and keeps entries newer than @s's last seen id.
execute store result score #id ann.tmp run data get storage herald:data tmp[0].id
execute if score #id ann.tmp > @s ann.id run data modify storage herald:data show append from storage herald:data tmp[0]
data remove storage herald:data tmp[0]
execute if data storage herald:data tmp[0] run function herald:core/catchup_step
