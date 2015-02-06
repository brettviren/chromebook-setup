#!/bin/bash

mydir=$(dirname $(readlink -f $BASH_SOURCE))

# configure auth

mkdir -p $HOME/.ssh
if [ ! -f $HOME/.ssh/id_rsa ] ; then
    ssh-keygen -t rsa
fi
echo "ssh-copy-id -i ~/.ssh/id_rsa.pub USER@HOST"
