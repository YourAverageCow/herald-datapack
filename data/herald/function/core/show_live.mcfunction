# Live announcement for one online player: chat box + title + chime.
function herald:core/display with storage herald:data cur
title @s times 10 70 20
title @s subtitle ["",{text:"from ",color:"gray"},{storage:"herald:data",nbt:"cur.sender",interpret:true},{text:" — see chat",color:"gray"}]
title @s title {text:"Announcement",color:"gold",bold:true}
playsound minecraft:block.note_block.bell master @s ~ ~ ~ 1 1.2
playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 1.6
