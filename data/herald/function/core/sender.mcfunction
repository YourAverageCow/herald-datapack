# Freeze the executing player's name into a text component via a temporary item.
summon item_display ~ ~ ~ {Tags:["ann.tmp"],item:{id:"minecraft:paper",count:1}}
item modify entity @n[type=item_display,tag=ann.tmp] contents herald:capture_name
data modify storage herald:data new.sender set from entity @n[type=item_display,tag=ann.tmp] item.components."minecraft:custom_name"
kill @e[type=item_display,tag=ann.tmp]
