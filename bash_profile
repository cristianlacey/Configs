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
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/clacey/opt/sundials-4/lib64

export PYTHONPATH=$PYTHONPATH:/home/clacey/PDRs/src/utilities

export PATH=$PATH:/home/clacey/PDRs/bin

# -------------------------------
# Tiger specific actions/aliases
# -------------------------------

# load modules on tigercpu
module load intel
module load intel-mpi
module load anaconda

# bold username
export PS1="$(tty -s && tput bold)$PS1$(tty -s && tput sgr0)"

# aliases
alias qstat='qstat -u $USER'
alias sshare='sshare -u $USER'
alias sq='squeue --start \
--format="%.10T %.8i %.9Q %.14q %.10P %.30j %.7u %.8a %.20S %.6D %.5C %.30R" --sort=S --states=all -u $USER'
alias scall="for id in \"$(sq | awk '{print $2}' | tail -n +2)\"; do scancel $id; done"

# shell functions
diskquota () {
    /usr/lpp/mmfs/bin/mmlsquota /dev/tigercpu.gpfs | awk '/[0-9]/ {$4 = $4/1073741824; $5 = $5/1073741824; $6 = $6/1073741824; print "Used: ",$4," TB\t","Quota: ",$5," TB\t","Limit: ",$6," TB"}'
}