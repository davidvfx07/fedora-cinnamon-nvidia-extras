#!/bin/bash

# Define the state file path in a persistent location
STATE_FILE="/var/lib/apply-firstboot-kargs-complete"

# Define the kernel arguments you want to append
# Replace with your actual kargs
KARGS="nvidia-drm.modeset=1 rd.driver.blacklist=nouveau"

# Check if the state file exists
if [ -f "$STATE_FILE" ]; then
    echo "First boot kargs already applied. Skipping."
    exit 0
fi

echo "Applying first boot kernel arguments: $KARGS"

# Apply the kernel arguments
# rpm-ostree kargs requires root privileges, the systemd service will run as root
if rpm-ostree kargs --append "$KARGS"; then
    echo "Kernel arguments applied successfully."
else
    echo "Error applying kernel arguments."
fi

# Create the state file to prevent running again
touch "$STATE_FILE"
echo "State file created (will not run again while exists): $STATE_FILE"

exit 0