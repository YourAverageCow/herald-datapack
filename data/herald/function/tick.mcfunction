# /trigger announce [set <page>] → open the board. One score-filtered selector per tick.
execute as @a[scores={announce=1..}] run function herald:menu/open
