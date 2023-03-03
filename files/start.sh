#!/usr/bin/bash
set -eu

# Export CPU frequency if necessary
if ! test -e "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq"; then
    export CPU_MHZ=${CPU_MHZ:-1600}
fi

# Install/update 7 Days to Die
/usr/games/steamcmd \
    +force_install_dir "$HOME/app" \
    +login anonymous \
    +app_update 232250 \
    +quit

# Execute the server
export LD_LIBRARY_PATH="/$HOME/app:/$HOME/app/bin"
cd "$HOME/app"
exec "./srcds_run" \
    -console -game tf \
    +sv_pure 1 +randommap +maxplayers 24 \
    +sv_setsteamaccount "$GAMESERVER_TOKEN"
