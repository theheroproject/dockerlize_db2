#! /bin/bash
# bash_profile의 설정
echo 'export LANG=ko_KR.UTF-8' >> ~/.bash_profile
echo 'export LANGUAGE=ko_KR.:ko' >> ~/.bash_profile
echo 'export LC_ALL=ko_KR.UTF-8' >> ~/.bash_profile
source ~/.bash_profile

# 디렉토리 작성

# . /database/config/de2inst1/sqllib/db2profile

# SQL파일의 실행
db2 'connect to homesalesdb'
db2 'CREATE SCHEMA DB2WML'
db2 'get dbm cfg' | grep i diaglevel
db2 'update dbm cfg using diaglevel 4'
db2 'get dbm cfg' | grep i diaglevel

db2 -tvf /var/custom/ddl/ddl.sql

# import실행
db2 'IMPORT FROM /var/custom/data/home-sales-training-data.csv OF DEL SKIPCOUNT 1 INSERT INTO DB2WML.HOME_SALES'

# db2 commit
db2 "commit"

# 파일 종료
exit 0