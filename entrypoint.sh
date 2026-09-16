#!/bin/bash
set -e

# Checks if bound directories are populated. If not, seed them with the initial files.
for d in conf local_conf local_scripts prt dasd pch jcl log; do
    if [ -z "$(ls -A /tk5/$d 2>/dev/null)" ]; then
        echo "Seeding empty /tk5/$d from defaults..."
        cp -r /tk5-defaults/$d/. /tk5/$d/
    fi
done

echo "Setting ownership of mounted volumes to UID 1000..."
chown -R 1000:1000 /tk5/conf /tk5/local_conf /tk5/local_scripts /tk5/prt /tk5/dasd /tk5/pch /tk5/jcl /tk5/log

echo "Starting MVS TK5..."
# Ensure execution happens inside working directory so local configs resolve
cd /tk5
gosu tk5:tk5 /tk5/mvs &
MVS_PID=$!

LOGFILE="/tk5/log/3033.log"
while [ ! -f "$LOGFILE" ]; do
    sleep 0.5
done

tail -F "$LOGFILE" &
TAIL_PID=$!

wait $MVS_PID
kill $TAIL_PID 2>/dev/null || true
