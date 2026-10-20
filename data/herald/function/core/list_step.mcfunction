data modify storage herald:data cur set from storage herald:data tmp[0]
data remove storage herald:data tmp[0]
function herald:core/list_line with storage herald:data cur
execute if data storage herald:data tmp[0] run function herald:core/list_step
