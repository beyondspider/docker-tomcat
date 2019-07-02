#!/bin/bash
if [ -f /.tomcat_admin_created ]; then
    echo "Tomcat 'admin' user already created"
    exit 0
fi
 
#generate password
PASS=${TOMCAT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${TOMCAT_PASS} ] && echo "preset" || echo "random" )
 
echo "=> Creating and admin user with a ${_word} password in Tomcat"

sed -i "s/passwordplaceholder/$PASS/g" ${CATALINA_HOME}/conf/tomcat-users.xml
echo "=> Done!"
touch /.tomcat_admin_created
 
echo "========================================================================"
echo "You can now configure to this Tomcat server using:"
echo ""
echo "    admin:${PASS}"
echo ""
echo "========================================================================"
