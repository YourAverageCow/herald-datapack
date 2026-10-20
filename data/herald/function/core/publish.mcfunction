# Called by send / send_rich with storage herald:data new.msg filled in.
scoreboard players add #latest ann.id 1
execute store result storage herald:data new.id int 1 run scoreboard players get #latest ann.id
# In-game day number (26.x: "time query time" = total clock ticks; 24000 ticks per day)
scoreboard players set #24000 ann.tmp 24000
execute store result score #day ann.tmp run time query time
scoreboard players operation #day ann.tmp /= #24000 ann.tmp
scoreboard players add #day ann.tmp 1
execute store result storage herald:data new.day int 1 run scoreboard players get #day ann.tmp

# Sender: the player who ran it, otherwise "Server" (console, command block)
data modify storage herald:data new.sender set value {text:"Server",color:"red"}
execute if entity @s[type=player] at @s run function herald:core/sender

# Archive keeps everything (for the board); history keeps the 5 most recent (for login catch-up)
data modify storage herald:data archive append from storage herald:data new
data modify storage herald:data history append from storage herald:data new
execute if data storage herald:data history[5] run data remove storage herald:data history[0]

# Show to everyone online and mark it as seen for them
data modify storage herald:data cur set from storage herald:data new
data remove storage herald:data new
execute as @a at @s run function herald:core/show_live
scoreboard players operation @a ann.id = #latest ann.id

return run scoreboard players get #latest ann.id
