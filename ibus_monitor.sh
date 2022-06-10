#!/usr/bin/sh

addr=$(ibus address)
entry="destination='org.freedesktop.IBus',interface='org.freedesktop.IBus',member='SetGlobalEngine'"
lang="$(ibus engine)"

while true; do
    dbus-monitor --monitor --address $addr $entry | 
    while read -r sign; do
        if [[ $sign == string* ]]; then
            echo $sign | grep -o '"[^"]\+"' | sed 's/"//g'
        fi
    done
done 

