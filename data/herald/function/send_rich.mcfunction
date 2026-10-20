# Usage:  /function herald:send_rich {msg:{text:"Event tonight!",color:"gold",bold:true}}
#         /function herald:send_rich {msg:["",{text:"PvP arena ",color:"red"},{text:"opens at 8pm",color:"white"}]}
# msg can be any text component (compound or list).
$data modify storage herald:data new set value {msg:$(msg)}
function herald:core/publish
