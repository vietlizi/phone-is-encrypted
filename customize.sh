# If you need to customize the module installation process, optionally you can create a script in the 
# installer named customize.sh. This script will be sourced (not executed!) by the module installer script 
# after all files are extracted and default permissions and secontext are applied. This is very useful if 
# your module require additional setup based on the device ABI, or you need to set special 
# permissions/secontext for some of your module files.
# 
# If you would like to fully control and customize the installation process, declare SKIPUNZIP=1 in 
# customize.sh to skip all default installation steps. By doing so, your customize.sh will be 
# responsible to install everything by itself.

# Module requires Zygisk to work
isZygiskEnabled=$(magisk --sqlite "SELECT value FROM settings WHERE key='zygisk';")
if [ "$isZygiskEnabled" == "value=0" ] && [ ! -d "/data/adb/modules/zygisksu" ]; then
    abort "! Zygisk is not enabled. Please, enable Zygisk in Magisk settings or install ZygiskNext or ReZygisk module."
fi

# Error on < Android 8
if [ "$API" -lt 26 ]; then
    abort "! You can't use this module on Android < 8.0"
fi
