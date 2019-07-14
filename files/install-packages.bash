#!/bin/bash -e

if [[ $# -lt 1 ]] ; then
    echo -e "\nMissing argurment. Provide file(s) with list of packages.\n" >&2
    exit 1
fi

FILES="$*"

for f in $FILES
do
    if [[ ! -f $f ]] ; then
        echo -e "\n\"$f\" is not a file. Aborting.\n" >&2
        exit 1
    fi
done

TMPFILE=mktemp
trap "rm -rf $TMPFILE" EXIT
cut -d\# -f1 ../files/packages.common  |grep -v '^$' >$TMPFILE
sudo xargs -a $TMPFILE apt install -y

sudo apt upgrade -y
sudo apt autoremove

