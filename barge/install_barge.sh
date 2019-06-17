#!/bin/bash
# Install argcomplete
echo " + Installing argcomplete globally"
sudo pip install argcomplete
activate-global-python-argcomplete --user

# Install barge into .bashrc
echo " + Placing Barge in your bashrc"
BARGE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "#Barge install" >> $HOME/.bashrc
echo "export BARGE_DIR=${BARGE_DIR}" >> $HOME/.bashrc
echo "export PATH=\$PATH:${BARGE_DIR}" >> $HOME/.bashrc

echo " + Start a new session for changes to take affect"
