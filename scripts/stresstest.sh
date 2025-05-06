#!/bin/sh

# CPU stress test for TrimUI Brick (Allwinner A133P)

# Function to clean up when exiting
cleanup() {
    echo "Cleaning up..."
    killall stress
    echo "Cleanup complete."
    exit 0
}

# Set trap for Ctrl+C
trap cleanup INT TERM EXIT

# Set CPU governor to performance
echo "Setting CPU governor to performance..."
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
    echo "performance" > $cpu 2>/dev/null
done

# Get maximum frequency available
MAX_FREQ=$(cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq 2>/dev/null)
echo "Max frequency available: $((MAX_FREQ / 1000)) MHz"

# Set frequencies to maximum
echo "Setting CPU frequency to maximum..."
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq; do
    echo "$MAX_FREQ" > $cpu 2>/dev/null
done
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq; do
    echo "$MAX_FREQ" > $cpu 2>/dev/null
done

# Get number of CPU cores
NUM_CORES=$(grep -c processor /proc/cpuinfo)
echo "Detected $NUM_CORES CPU cores"

# Start stress test in background
echo "Starting CPU stress test..."
stress --cpu $NUM_CORES &
echo "Stress test running"

# Monitor loop
echo "=============================================="
echo "Starting monitoring - press Ctrl+C to stop"
echo "=============================================="
echo "Time       | CPU Frequencies                | Temperature"
echo "=============================================="

# Continue until interrupted
while true; do
    # Get current time
    TIME_NOW=$(date +"%H:%M:%S")
    
    # Get temperature
    if [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
        TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
        TEMP_C=$(($TEMP / 1000))
        THERMAL="${TEMP_C}°C"
    else
        THERMAL="N/A"
    fi
    
    # Print time
    echo -n "$TIME_NOW | "
    
    # Print CPU frequencies
    for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq; do
        if [ -f "$cpu" ]; then
            freq_khz=$(cat "$cpu" 2>/dev/null)
            freq_mhz=$(($freq_khz / 1000))
            cpu_num=$(echo "$cpu" | grep -o "cpu[0-9]*" | grep -o "[0-9]*")
            echo -n "CPU$cpu_num: ${freq_mhz}MHz "
        fi
    done
    
    echo "| $THERMAL"
    
    # Wait before next update
    sleep 5
done