FROM ibmcom/db2

# CentOS Project의GPG공개키를 인스톨 한다.
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

# 인스톨한 패키지를 업데이트&캐쉬 클리어
RUN yum -y update && yum clean all

# 언어 설정
RUN localedef -i ko_KR -f UTF-8 ko_KR.UTF-8
RUN echo 'LANG="ko_KR.UTF-8"' > /etc/locale.conf
ENV LANG=ko_KR.UTF-8
ENV LANGUAGE=ko_KR.:ko
ENV LC_ALL=ko_KR.UTF-8

# 날짜형식을 변경
RUN echo 'ZONE="Asia/Seoul"' > /etc/sysconfig/clock
RUN rm -f /etc/localtime
RUN ln -fs /user/share/zoneinfo/Asia/Tokyo /etc/localtime

# man을 설치하기 전에 man파일을 인스톨 하도록 설정
RUN sed -i -e"s/^tsflags=nodocs/\# tsflags=nodocs/" /etc/yum.conf

# man과 man-page를 설치
RUN yum -y install man
RUN yum -y install man-pages.noarch
RUN yum -y install man-pages-ko.noarch

# 워크 디렉토리 설정
WORKDIR /var/custom

# 디렉토리 생성
RUN mkdir custom/
RUN mkdir ddl/

# 실행
# docker build -t <name> .
# ex) docker build -t mydb2 .
# docker run -itd --name mydb2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INST1_PASSWORD=db2inst1 mydb2
# 접속
# docker exec -ti mydb2 bash -c "su - db2inst1"
# locale 을 확인
# locale
# db2 'get db cfg for <DB명> | grep 'Database code set'

