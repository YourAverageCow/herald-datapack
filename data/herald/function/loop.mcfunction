# Runs once per second (no tick function needed).

# 1) Players flagged last pass get their missed announcements (1-2 s after joining, after join spam)
execute as @a[tag=ann.pending] at @s run function herald:core/catchup

# 2) Flag players who just rejoined, or are joining for the first time
tag @a[scores={ann.left=1..}] add ann.pending
scoreboard players reset @a[scores={ann.left=1..}] ann.left
tag @a[tag=!ann.known] add ann.pending
tag @a[tag=!ann.known] add ann.known

schedule function herald:loop 1s replace
