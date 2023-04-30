#!/bin/bash
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main --config=$HOME/.config/i3/polybar/config