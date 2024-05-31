#!/bin/bash -e
rm -rf /tmp/* /run/dbus/pid || true
export PULSE_COOKIE=/var/run/pulse/.config/pulse/cookie
export DISPLAY=:0.0
dbus-daemon --system
avahi-daemon &
pulseaudio --system --disallow-exit -D
pactl load-module module-rtp-send format=s16le channels=2 rate=44100 source=auto_null.monitor destination=$RTP_TARGET port=$RTP_PORT mtu=1164
cd /app
./xtigervnc.sh &
./openbox.sh &
firefox-esr