# Generic $dotdir/bashshrc
# Engineering Services (ES)
#
##
# Things the user might wish to set.
export USER_PATH="~/bin"			# Extra paths.
export EDITOR=vim				# Preferred editor.
export PRINTER=lp				# Preferred printer.
export NNTPSERVER=usenet.cisco.com		# Preferred news server.
export HOME=/users/abgandhi
export SHELL=/bin/bash
export PATH=$PATH:/users/abgandhi/bin
export TERM=xterm-256color

export ATS_USER_PATH="/ws/abgandhi-sjc/ats"
source $ATS_USER_PATH/env.sh

export ACME_AUTO_COMP_RECURSE=1
export ACME_CRLF_CHAR_CHECK=0
export ACME_SOURCE_BASE=aesop
export ACME_SKIPPED_TOUCHED=1
export ACME_DIFF_INTERACTIVE=1
export ACME_LOCALE=sj-acns-1
export ACME_SOURCE_BASE=acns
#export ACME_VIEW_SERVER=mcebu-view6
export ACME_DISABLE_COPYRIGHT=1
export ROC_VC_SERVER=adbu-rtp-vc
export LANG=en_US
export LANG_VAR=en_US     

##
# Should the full environment be set up even for non-interactive shells?
# Probably not but here is a variable to control it.
export FULLENV=false				# 'true' or 'false'

##
# Should all paths (even NFS, which might hang) be set up at login?
# The alias "fullpath" is available to setup your full path.  It can
# also be used to change your path by changing USER_PATH above.
export FULLPATH=true				# 'true' or 'false'

###########################################################################
# Everything above this line helps configure the environment.

# This line should not be removed.
dotdir=~/.files; [ -f $dotdir/sys_bashrc ] && . $dotdir/sys_bashrc
[ $FULLENV != "true" ] && [ -z "$PS1" ] && return

###########################################################################
# Everything below this line is run for interactive shells.
# If you wish the full environment even in non-interactive
# shells set FULLENV above to 'true'.

umask 022                        # no write by group or other
export autologout=0              # disable autologout
export FIGNORE=".o"              # don't complete .o files
export HISTFILE=~/.bash_history  # history file
export HISTFILESIZE=500          # history file size
export HISTSIZE=128              # save last 128 commands
export ignoreeof=10              # disable ^D for logout (up to 10)
set -C                           # disable redirect overwrite
set -b                           # enable immediate job notify
export PS1="\h:\w > "            # shell prompt format

bind '"\C-h": beginning-of-line'

view=`cat ~/current_view`
export PS1='$_view@\h:\w\$ '
#stty erase ''

[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
keychain -q ~/.ssh/id_rsa 
. ~/.ssh-agent-${HOSTNAME}

##
# Source other rc files after this line.
[ -f ~/.bashrc_LOB ] && . ~/.bashrc_LOB
[ -f ~/.bashrc_BU ] && . ~/.bashrc_BU
[ -f ~/.bashrc_USER ] && . ~/.bashrc_USER
alias fin="find . -name '*.c' -o -name '*.h' -o -name '*.cc' -o -name '*.mk' -o -name '*.inc' -o -name '*.sh' -o -name '*.cpp' -o -name '*.hpp' > cscope.files"
alias fin_ssl="find product/waasnet product/enc_srvc ao/enc_srvc -name '*.c' -o -name '*.h' -o -name '*.cc' -o -name '*.mk' -o -name '*.inc' -o -name '*.sh' -o -name '*.cpp' -o -name '*.hpp' > cscope.files"
alias finall="find . -name '*.*' > cscope.files"
alias ct="ctags -L cscope.files"
alias csa="fin && cscope -b -q && ct"
alias csas="fin_ssl && cscope -b -q && ct"
alias csaa="finall && cscope -b -q && ct"
alias cs="cscope -d"
alias ws="cd /ws/abgandhi-sjc"
alias air="telnet 172.19.156.86 2003"
alias tf="cd /tftpboot/abgandhi"
alias sv="select_view"
alias srtg="cd /auto/srtg-ewag/mob-opt"
alias nb="cd /nobackup/abgandhi"
alias vi="vim"
alias adiff="acme diff -cmd vimdiff -opts \"\""

