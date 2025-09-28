if [ "`id -u`" -eq 0 ]; then
        readonly TMOUT=3600 2>/dev/null
else
        readonly TMOUT=10800 2>/dev/null
fi
