#!/bin/bash
if [ -f /.ssh_copy_id  ]; then
    echo "ssh id already copyed"
    exit 0
fi

echo "=> ssh-keygen begin"
ssh-keygen

echo "=> ssh-copy-id begin"
ssh-copy-id -i ~/.ssh/id_rsa.pub root@beyondspider.com
echo "=> Done!"

touch /.ssh_copy_id
