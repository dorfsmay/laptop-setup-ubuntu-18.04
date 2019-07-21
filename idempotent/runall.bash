#!/bin/bash -e

cd "$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
if [[ ! -f $(basename ${BASH_SOURCE[0]}) ]] ; then
    echo -e "\nSomething went wrong" >&1
    echo -e "Lost myself in directory \'$PWD\'" >&1
    echo -e "Aborting...\n" >&1
    exit 1
fi

for f in [0-9][0-9][0-9]*
do
    tput bold ; echo -e "\n\n\n\n    #### RUNNING $(basename $f) ####\n" ; tput sgr0
    ./$f
done

