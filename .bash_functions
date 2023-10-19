#! /bin/env bash
# Open vi and make backup of original file. Useful for config files and things you don't want to edit the original
function vibk() {
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read nul
    cp $1 $1.bak
    vi $1
}

function myip()
{
    extIp=$(curl ifconfig.me 2>/dev/null)
    echo ""
    echo "WAN IP: $extIp"

}

function chgenv() 
{
    environment=$1
    if [ "$environment" == "none" ]
    then
        rm -f ~/.kube/config
    fi
    if [ "$environment" == "micro" ]
    then
        unset KUBECONFIG
        rm -f ~/.kube/config
        export KUBECONFIG=~/.kube/config-microk8s
    fi
}
