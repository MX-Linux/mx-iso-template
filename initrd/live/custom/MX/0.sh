# File: /live/custom/antiX/0.sh
# MX Specific /init code

LIST_MODULES=true
CHECK_BOOTCODES=true

MENUS_LIST=ltopfs

DO_DEB=true
DO_FSCK=true
DO_XTRA=true
DO_GFX=true

FANCY_PROMPT="prompt-fancy"
AUTO_LOGIN_PROG="autologin"
AUTO_LOGIN_TERMS="2-4"

live_param_filter() {
    local param val disable
    for param; do
        val=${param#*=}

        case $param in
        disable=*)                       disable=$val ;;
        lean)                           CMD_LEAN=true ;;
        mean)                           CMD_MEAN=true ;;
        Xtralean)                  CMD_XTRA_LEAN=true ;;
        nodbus)                      CMD_NO_DBUS=true ;;

        # Our Live params
        hwclock=utc|hwclock=local|xorg|xorg=*|noearlyvid|earlyvid) ;;
        confont=*|conkeys=*|conkbd=*);;
        dpi=*|hostname=*|kbd=*|kbopt=*|kbvar=*);;
        lang=*|mirror=*|noloadkeys|noprompt);;
        nosplash|password|password=*|prompt|pw|pw=*|tz=*|ubp=*|ushow=*);;
        uverb=*|xres=*|noxorg);;
        nosavestate|savestate|dbsavestate) ;;
        norepo|norepo=*|nostore) ;;
        udpi=*|sdpi=*) ;;
        fontsize=*) ;;

        *) printf "$param " ;;
        esac
    done

    if [ "$disable" ]; then
        # If the ## expression matches then the resulting string length is zero
        [ "${disable##*[lL]*}" ] ||      touch /live/config/lean
        [ "${disable##*[mM]*}" ] ||      touch /live/config/mean
        [ "${disable##*[xX]*}" ] ||      touch /live/config/xtra-lean
        [ "${disable##*[dD]*}" ] ||      touch /live/config/no-dbus
    fi

}
