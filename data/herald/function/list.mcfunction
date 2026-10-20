# /function herald:list — show stored announcements (newest last)
execute unless data storage herald:data history[0] run return run tellraw @s {text:"No stored announcements.",color:"gray",italic:true}
tellraw @s {text:"━━━ Stored announcements (login queue, last 5) ━━━",color:"gold"}
data modify storage herald:data tmp set from storage herald:data history
function herald:core/list_step
