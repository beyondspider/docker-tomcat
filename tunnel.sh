#!/bin/bash
if [ ! -f /.ssh_copy_id  ]; then
    /copy.sh
fi

#ssh -fCNR 4200:localhost:8080 root@beyondspider.com
autossh -M 4201 -fCNR 4200:localhost:8080 root@beyondspider.com
