$data modify storage herald:data menu.dlg.actions append value {label:{text:"◀ Newer"},tooltip:{text:"Page $(prev)"},action:{type:"minecraft:run_command",command:"/trigger announce set $(prev)"}}
