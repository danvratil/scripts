#!/bin/sh

PC1_OUTPUT="DP-1"
PC1_MODE="3840x2160"
PC2_OUTPUT="DVI-I-1"
PC2_MODE="1920x1200"
PC_SINK="usb-Roland_UA-1G-00"
PC_MIRROR_TV=0

TV_OUTPUT="HDMI-0"
TV_MODE="1920x1080"
TV_SINK="hdmi-stereo-extra2"

# Check which output has resolution set and consider it as active
pc1_on=$([[ -z $(xrandr | /bin/grep -E "${PC1_OUTPUT} connected primary [0-9]+x[0-9]+") ]])$?
pc2_on=$([[ -z $(xrandr | /bin/grep -E "${PC2_OUTPUT} connected [0-9]+x[0-9]+") ]])$?
tv_on=$([[ -z $(xrandr | /bin/grep -E "${TV_OUTPUT} connected [0-9]+x[0-9]+") ]])$?
default_sink_idx=$(pacmd list-sinks | /bin/grep "* index:" | grep -oE "[0-9]+\$")
default_sink=$(pactl list sinks short | /bin/grep -E "^${default_sink_idx}" | /bin/grep -oE "(${PC_SINK}|${TV_SINK})")

echo "Current state:"
echo "    PC screen 1: $([[ ${pc1_on} -eq 1 ]] && echo on || echo off)"
echo "    PC screen 2: $([[ ${pc2_on} -eq 1 ]] && echo on || echo off)"
echo "    TV screen: $([[ ${tv_on} -eq 1 ]] && echo on || echo off)"
echo "    Default sink: ${default_sink}"
echo

if [[ $pc1_on == 1 && $tv_on == 0 ]]; then
    # PC's on -> turn on TV, turn off PC
    SINK_ON="${TV_SINK}"
    xrandr --output ${PC1_OUTPUT} --off \
           --output ${PC2_OUTPUT} --off
    xrandr --output ${TV_OUTPUT} --mode ${TV_MODE} || echo "Failed to change screen output"
else
    # TV's on or both off -> turn on PC, turn off TV
    SINK_ON="${PC_SINK}"
    xrandr --output ${TV_OUTPUT} --off
    xrandr --output ${PC1_OUTPUT} --mode ${PC1_MODE} --primary \
           --output ${PC2_OUTPUT} --mode ${PC2_MODE} --right-of ${PC1_OUTPUT} --rotate left --scale 1.5x1.5
fi

echo "New state:"
echo "    Default sink: ${SINK_ON}"

# Get index of the new sink
sink_idx=$(pactl list sinks short | /bin/grep "${SINK_ON}" | /bin/grep -oE "^[0-9]+")
if [[ -z "${sink_idx}" ]]; then
    echo "Failed to detect index of sink ${SINK_ON}"
    exit 2
fi

# Set the new sink as default for all future inputs
pactl set-default-sink ${sink_idx} || echo "Failed to change default sink to ${sink_idx}"

# And move all active inputs to the new sink
pactl list sink-inputs short | while read -r sink_input; do
    sink_input_idx=$(echo ${sink_input} | /bin/grep -oE "^[0-9]+")
    if [[ -z "${sink_input_idx}" ]]; then
        echo "Failed to detect index of sink input ${sink_input}, skipping"
        continue
    fi
    pactl move-sink-input ${sink_input_idx} ${sink_idx} || echo "Failed to move sink-input ${sink_input_idx} to sink ${sink_idx}"
    echo "Moved sink input ${sink_input_idx} to sink ${sink_idx}"
done

# Done.

