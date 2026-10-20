# /function herald:delete {id:7} — remove one announcement (ids are shown on the board and in herald:list)
$execute unless data storage herald:data archive[{id:$(id)}] run return run tellraw @s {text:"✘ There is no announcement #$(id).",color:"red"}
$data remove storage herald:data archive[{id:$(id)}]
$data remove storage herald:data history[{id:$(id)}]
$tellraw @s {text:"✔ Deleted announcement #$(id).",color:"green"}
return 1
