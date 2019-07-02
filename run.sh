#!/bin/bash
if [ ! -f /.tomcat_admin_created ]; then
    /tomcat.sh
fi
/usr/sbin/sshd -D &
exec $CATALINA_HOME/bin/catalina.sh run
