# dockerlize_db2
# 실행
```
docker build -t <name> .
ex) docker build -t mydb2 .
```

```
docker run -itd --name mydb2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INST1_PASSWORD=db2inst1  -e DBNAME= homesalesdb mydb2
```

or

docker-compose up -d

# 접속
```
docker exec -ti mydb2 bash -c "su - db2inst1"
```
# locale 을 확인

```
locale
```

# db2의 문자를 확인
```
db2 'get db cfg for <DB명>' | grep 'Database code set'
ex) db2 'get db cfg for homesalesdb' | grep 'Database code set'

```
