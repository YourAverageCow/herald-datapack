data modify storage herald:data cur set from storage herald:data show[0]
data remove storage herald:data show[0]
function herald:core/display with storage herald:data cur
execute if data storage herald:data show[0] run function herald:core/catchup_show
