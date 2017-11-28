#!/bin/sh

PC_OUTPUT="DVI-I-1"
PC_MODE="1920x1200"
PC_SINK="usb-Roland_UA-1G-00"
PC_MIRROR_TV=0

TV_OUTPUT="HDMI-0"
TV_MODE="1920x1080"
TV_SINK="hdmi-stereo-extra1"

# Check which output has resolution set and consider it as active
pc_on=$([[ -z $(xrandr | /bin/grep -E "${PC_OUTPUT} connected primary [0-9]+x[0-9]+") ]])$?
tv_on=$([[ -z $(xrandr | /bin/grep -E "${TV_OUTPUT} connected [0-9]+x[0-9]+") ]])$?
default_sink_idx=$(pacmd list-sinks | /bin/grep "* index:" | grep -oE "[0-9]+\$")
default_sink=$(pactl list sinks short | /bin/grep -E "^${default_sink_idx}" | /bin/grep -oE "(${PC_SINK}|${TV_SINK})")

echo "Current state:"
echo "    PC screen: $([[ ${pc_on} -eq 1 ]] && echo on || echo off)"
echo "    TV screen: $([[ ${tv_on} -eq 1 ]] && echo on || echo off)"
echo "    Default sink: ${default_sink}"
echo

if [[ $pc_on == 1 && $tv_on == 0 ]]; then
    # PC's on -> turn on TV, turn off PC
    OUTPUT_ON="${TV_OUTPUT}"
    MODE_ON="${TV_MODE}"
    SINK_ON="${TV_SINK}"
    OUTPUT_OFF="${PC_OUTPUT}"
elif [[ $tv_on == 1 ]]; then
    # TV's on -> turn on PC, turn off TV
    OUTPUT_ON="${PC_OUTPUT}"
    MODE_ON="${PC_MODE}"
    SINK_ON="${PC_SINK}"
    OUTPUT_OFF="${TV_OUTPUT}"
else
    # PC's off and TV's off, turn on PC
    OUTPUT_ON="${PC_OUTPUT}"
    MODE_ON="${PC_MODE}"
    SINK_ON="${PC_SINK}"
fi

echo "New state:"
echo "    PC screen: $([[ ${OUTPUT_ON} == ${PC_OUTPUT} ]] && echo on || echo off)"
echo "    TV screen: $([[ ${OUTPUT_ON} == ${TV_OUTPUT} ]] && echo on || echo off)"
echo "    Default sink: ${SINK_ON}"

# Toggle screens
xrandr --output ${OUTPUT_OFF} --off \
       --output ${OUTPUT_ON} --mode ${MODE_ON} || echo "Failed to change screen output"

if [[ ${PC_MIRROR_TV} == 1 && $tv_on == 1 ]]; then
    xrandr --output ${PC_OUTPUT} --mode ${TV_MODE} --same-as ${TV_OUTPUT} || echo "Failed to mirror TV to PC"
fi


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
