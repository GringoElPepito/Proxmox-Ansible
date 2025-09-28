if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "`id -u`" -eq 0 ]; then
        PS1COLOR1='31'
        PS1COLOR2='31'
else
        PS1COLOR1='32'
        PS1COLOR2='00'
fi

case "`tty`" in
/dev/tty*)
        PS1TITLE=''
        ;;
*)
        PS1TITLE='\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]'
        ;;
esac

readonly PS1=$PS1TITLE'${debian_chroot:+($debian_chroot)}\[\033[01;'$PS1COLOR1'm\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;'$PS1COLOR2'm\]\$ \[\033[00m\]' 2>/dev/null
