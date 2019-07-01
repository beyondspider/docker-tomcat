#!/bin/bash
docker run -u root -d -p 10022:22 -p 18080:8080 --name tomcat beyondspider/tomcat:latest
