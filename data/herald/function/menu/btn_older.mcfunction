$data modify storage herald:data menu.dlg.actions append value {label:{text:"Older ▶"},tooltip:{text:"Page $(next)"},action:{type:"minecraft:run_command",command:"/trigger announce set $(next)"}}
