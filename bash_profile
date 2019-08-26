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
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/$USER/opt/SuiteSparse/lib

export PYTHONPATH=$PYTHONPATH:/home/clacey/PDRs/src/utilities

export PATH=$PATH:/home/clacey/PDRs/bin

# -------------------------------
# Tiger specific actions/aliases
# -------------------------------

# load modules on tigercpu
# --------------------------------------
# .BASH_PROFILE
# --------------------------------------

module load intel
module load intel-mpi
module load anaconda

# bold username
export PS1="$(tty -s && tput bold)$PS1$(tty -s && tput sgr0)"

# --------------------------------------
# ALIASES
# --------------------------------------

alias qstat='qstat -u $USER'
alias sshare='sshare -u $USER'
alias sq='squeue --start \
--format="%.10T %.8i %.9Q %.14q %.10P %.30j %.7u %.8a %.20S %.6D %.5C %.30R" --sort=S --states=all -u $USER'
#alias scall="for id in \"$(sq | awk '{print $2}' | tail -n +2)\"; do echo $id; scancel $id; done"

# --------------------------------------
# SHELL FUNCTIONS
# --------------------------------------

function diskquota () {
    /usr/lpp/mmfs/bin/mmlsquota /dev/tigercpu.gpfs | awk '/[0-9]/ {$4 = $4/1073741824; $5 = $5/1073741824; $6 = $6/1073741824; print "Used: ",$4," TB\t","Quota: ",$5," TB\t","Limit: ",$6," TB"}'
}

function scall () {
	 jobids="$(sq | awk '{print $2}' | tail -n +2)"
	 for id in $jobids
	 do
		scancel $id
	 done
	 echo 'Cancelled jobs: '${jobids}
}