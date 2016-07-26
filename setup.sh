#! /usr/bin/env bash

###
#
# setup.sh
# Interface that generates Vagrantfile
#
###
echo -e "Hey, let's set up your workstation\n"
echo -e "All workstations follow the same naming convention: your_name.workstation.dev\n"
echo -n "So, what's your name? [ENTER]: "
read NAME
CLEANNAME=${NAME//[^a-zA-Z0-9_]/};
CLEANNAME=`echo -n $CLEANNAME | tr A-Z a-z`
CUSTOM_HOST="${CLEANNAME}.workstation.dev"
echo -n "what's SSH Key name on Digital Ocean? [ENTER]: "
read KEY_NAME
echo -n "What's the Digital Ocean Token? [ENTER]: "
read TOKEN
read -p "Aha! your workstation will be called ${CUSTOM_HOST}. Continue? [y/n] " CHOICE

case "$CHOICE" in y|Y )
    ./files/vagrantfile.sh $CUSTOM_HOST "$KEY_NAME" $TOKEN > Vagrantfile;echo -e "Your Vagrantfile has been created. Now it's time to vagrant up!\n";;
  n|N )
    echo "Ok, bye...";;
  * ) echo "invalid";;
esac