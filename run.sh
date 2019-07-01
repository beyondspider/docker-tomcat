#!/bin/bash
/usr/sbin/sshd -D &
exec $CATALINA_HOME/bin/catalina.sh run
