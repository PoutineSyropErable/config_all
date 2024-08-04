# Stop mpd if it is running
if pgrep mpd > /dev/null
    mpd --kill
end
