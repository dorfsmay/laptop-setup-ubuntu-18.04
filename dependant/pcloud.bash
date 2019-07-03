#!/bin/bash -e

if [[ ! -f ~/Downloads/pcloud ]] ; then
    echo -e '\nDownload pcloud executable from https://www.pcloud.com/download-free-online-cloud-file-storage.html\n'
else
    chmod +rx ~/Downloads/pcloud
    sudo mkdir -p /usr/local/bin
    sudo mv ~/Downloads/pcloud /usr/local/bin/.
fi

