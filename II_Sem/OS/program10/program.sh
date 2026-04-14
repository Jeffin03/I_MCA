#!/bin/bash
USER_TO_CHECK="ram"
while true
do
    if who | grep -i -wq "$USER_TO_CHECK"; then
        echo "Success: $USER_TO_CHECK is logged in."
        break
    else
        echo "$USER_TO_CHECK is not logged in. Checking again in 30 seconds..."
        sleep 30
    fi
done