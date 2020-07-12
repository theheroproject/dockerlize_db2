#! /bin/bash
# bash_profile의 설정
echo 'export LANG=ko_KR.UTF-8' >> ~/.bash_profile
echo 'export LANGUAGE=ko_KR.:ko' >> ~/.bash_profile
echo 'export LC_ALL=ko_KR.UTF-8' >> ~/.bash_profile
source ~/.bash_profile

su - db2inst1 -c 'bash -c "/var/custom/custom/cfg.sh"'
exit 0