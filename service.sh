#!/system/bin/sh
resetprop ro.crypto.state encrypted
resetprop ro.crypto.type block

until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done
