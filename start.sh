#!/bin/bash
#docker run -u root -d --env TOMCAT_PASS=admin -p 10022:22 -p 18080:8080 --name tomcat beyondspider/tomcat:latest
docker run -u root -d -p 10022:22 -p 18080:8080 --name tomcat beyondspider/tomcat:latest
