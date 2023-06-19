alias podman-stop-all-containers="sudo podman stop \$(sudo podman ps -q)"
alias podman-remove-all-containers="sudo podman rm \$(sudo podman ps -aq)"
alias podman-stop-and-remove-all-containers="podman-stop-all-containers && podman-remove-all-containers"
alias podman-compose="sudo podman-compose"
alias run-maria-platzi="sudo podman run --rm -d -p 3306:3306 --name mariadb-platzi -e MARIADB_USER=mariadb -e MARIADB_ROOT_PASSWORD=chroot -e MARIADB_PASSWORD=root mariadb:10.6.5-focal"

alias podman-containers="sudo podman ps -a --format \"table {{.State}}\\t{{.Names}}\\t{{.ID}}\\t{{.Image}}\""
alias hdmiA050="xrandr --output HDMI-A-0 --mode 1920x1080 --rate 50"

################################################################################
################################## GIT SSH #####################################

if [ "$(whoami)" != "root" ]; then
    env=~/.ssh/agent.env

    agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

    agent_start () {
        (umask 077; ssh-agent >| "$env")
        . "$env" >| /dev/null ; }

     agent_load_env

     # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
    agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

    if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
        agent_start
        ssh-add
    elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
        ssh-add
    fi
    unset env
fi
#
