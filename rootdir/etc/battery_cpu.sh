# Akkukapazität überwachen
battery_capacity=$(cat /sys/class/power_supply/battery/capacity)

# Schritt 1: Sehr niedrige Akkukapazität
if [ "$battery_capacity" -lt 10 ]; then
    echo "768000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "768000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Schritt 2: Niedrige Akkukapazität
elif [ "$battery_capacity" -lt 25 ]; then
    echo "960000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "960000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Schritt 3: Akkukapazität leicht erhöht
elif [ "$battery_capacity" -lt 30 ]; then
    echo "1209600" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "1248000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Schritt 4: ...
elif [ "$battery_capacity" -lt 40 ]; then
    echo "1344000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "1344000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Schritt 5: ...
elif [ "$battery_capacity" -lt 50 ]; then
    echo "1478400" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "1440000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Schritt 6: ...
elif [ "$battery_capacity" -lt 60 ]; then
    echo "1555200" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "1536000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Schritt 7: ...
elif [ "$battery_capacity" -lt 70 ]; then
    echo "1632000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "1728000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Schritt 8: ...
elif [ "$battery_capacity" -lt 80 ]; then
    echo "1747200" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "1958400" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Schritt 9: ...
elif [ "$battery_capacity" -lt 90 ]; then
    echo "1843200" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "2054400" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# Schritt 10: Normale Akkukapazität
else
    echo "1920000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
    echo "2208000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
fi

