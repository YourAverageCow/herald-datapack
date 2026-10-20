# Herald — setup (runs on /reload and server start)
scoreboard objectives add ann.id dummy
scoreboard objectives add ann.left minecraft.custom:minecraft.leave_game
scoreboard objectives add ann.tmp dummy
scoreboard objectives add announce trigger {text:"Announcement board"}
scoreboard objectives modify announce displayname {text:"Announcement board"}

execute unless score #latest ann.id matches 0.. run scoreboard players set #latest ann.id 0
# Upgrading from "Announce" v1/v2: move its stored announcements over once
execute unless data storage herald:data history if data storage announce:data history run data modify storage herald:data history set from storage announce:data history
execute unless data storage herald:data archive if data storage announce:data archive run data modify storage herald:data archive set from storage announce:data archive
execute if data storage announce:data {} run function herald:core/cleanup_legacy

execute unless data storage herald:data history run data modify storage herald:data history set value []
# Full archive for the board (v1 → v2: seed it from the login history)
execute unless data storage herald:data archive run data modify storage herald:data archive set from storage herald:data history

scoreboard players enable @a announce
schedule function herald:loop 1s replace
