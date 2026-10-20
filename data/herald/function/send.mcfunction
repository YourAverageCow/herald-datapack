# Usage:  /function herald:send {text:"Server restarts at 6pm!"}
# (works from the server console too — leave off the leading /)
# Note: don't use double quotes (") inside the text; use herald:send_rich for that.
$data modify storage herald:data new set value {msg:{text:"$(text)"}}
function herald:core/publish
