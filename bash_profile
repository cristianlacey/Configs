# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
PATH=$PATH:/home/clacey/NGA/bin

export PATH

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/clacey/opt/sundials/lib
