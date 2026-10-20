# Opens the announcement board for @s. Page = @s's announce trigger value (1 = newest).
scoreboard players operation #page ann.tmp = @s announce
scoreboard players set @s announce 0
scoreboard players enable @s announce

# total / pages (5 per page)
scoreboard players set #5 ann.tmp 5
scoreboard players set #-1 ann.tmp -1
execute store result score #total ann.tmp run data get storage herald:data archive
scoreboard players operation #pages ann.tmp = #total ann.tmp
scoreboard players add #pages ann.tmp 4
scoreboard players operation #pages ann.tmp /= #5 ann.tmp
execute if score #pages ann.tmp matches ..0 run scoreboard players set #pages ann.tmp 1
scoreboard players operation #page ann.tmp < #pages ann.tmp

# skip = (page-1)*5 ; left = min(5, total-skip) ; idx = -skip-1 (newest first)
scoreboard players operation #idx ann.tmp = #page ann.tmp
scoreboard players remove #idx ann.tmp 1
scoreboard players operation #idx ann.tmp *= #5 ann.tmp
scoreboard players operation #left ann.tmp = #total ann.tmp
scoreboard players operation #left ann.tmp -= #idx ann.tmp
scoreboard players operation #left ann.tmp < #5 ann.tmp
scoreboard players operation #idx ann.tmp *= #-1 ann.tmp
scoreboard players remove #idx ann.tmp 1

execute store result storage herald:data menu.nav.page int 1 run scoreboard players get #page ann.tmp
execute store result storage herald:data menu.nav.pages int 1 run scoreboard players get #pages ann.tmp
execute store result storage herald:data menu.nav.total int 1 run scoreboard players get #total ann.tmp
execute store result storage herald:data menu.nav.prev int 1 run scoreboard players remove #page ann.tmp 1
execute store result storage herald:data menu.nav.next int 1 run scoreboard players add #page ann.tmp 2
scoreboard players remove #page ann.tmp 1

data modify storage herald:data menu.dlg set value {type:"minecraft:multi_action",title:{text:"✦ Server Announcements ✦",color:"gold",bold:true},external_title:{text:"Announcements"},body:[],actions:[],columns:2,can_close_with_escape:true,pause:false,after_action:"close",exit_action:{label:{text:"Close"}}}
function herald:menu/header with storage herald:data menu.nav
execute if score #total ann.tmp matches 0 run data modify storage herald:data menu.dlg.body append value {type:"minecraft:plain_message",width:320,contents:{text:"No announcements yet.",color:"gray",italic:true}}
execute if score #left ann.tmp matches 1.. run function herald:menu/entries

# Navigation (newer ← → older); a single page becomes a simple notice with a Close button
execute if score #page ann.tmp matches 2.. run function herald:menu/btn_newer with storage herald:data menu.nav
execute if score #page ann.tmp < #pages ann.tmp run function herald:menu/btn_older with storage herald:data menu.nav
execute unless data storage herald:data menu.dlg.actions[0] run function herald:menu/as_notice

function herald:menu/show with storage herald:data menu
