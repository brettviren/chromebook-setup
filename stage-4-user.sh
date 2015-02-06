#!/bin/bash

mydir=$(dirname $(readlink -f $BASH_SOURCE))
myghurl=git@github.com:brettviren

# Configure sawfish

cd $HOME

if [ ! -d .sawfish ] ; then
    git clone $myghurl/dot-sawfish.git .sawfish
fi
if [ ! -d scripts ] ; then
    git clone $myghurl/brettviren/scripts.git
fi
mkdir -p dot
if [ ! -d dot/emacs ] ; then
    git clone $myghurl/dot-emacs.git dot/emacs
    ln -s $HOME/dot/emacs/init.el $HOME/.emacs.el
fi
if [ ! -d org-pub ] ; then
    git clone $myghurl/org-pub.git
fi

echo "fixme: making empty org/web/notes directory."
mkdir -p org/web/notes
