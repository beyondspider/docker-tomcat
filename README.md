# docker tomcat

## build
```bash
docker build -t beyondspider/tomcat:latest .
```

## start
```bash
docker run -u root -d \
    --env TOMCAT_PASS=admin \
    -p 10022:22 \
    -p 18080:8080 \
    --name tomcat \
    beyondspider/tomcat:latest

docker run -u root -d \
    -p 10022:22 \
    -p 18080:8080 \
    --name tomcat \
    beyondspider/tomcat:latest
```

## ssh
```bash
ssh root@127.0.0.1 -p 10022
```

## tunnel
```bash
cd /
./tunnel.sh
```

## push
```bash
docker push beyondspider/tomcat:latest
```