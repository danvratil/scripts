#!/bin/sh

if [[ ! $(id -u) -eq 0 ]]; then
    echo "Executing as root"
    sudo $0
    exit $?
fi

echo "watchdog 0" > /proc/acpi/ibm/fan
echo "level full-speed" > /proc/acpi/ibm/fan

