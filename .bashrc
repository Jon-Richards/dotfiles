# This is incomplete!  It only includes the lines that I usually customize.

# Change '$ ls' highlighting to something more readable.
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS

# Display only the user's name and the current directory in bash prompt.
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# Display just the current directory in bash prompt.
PS1='\[\033[01;34m\]\W\[\033[00m\]> '
