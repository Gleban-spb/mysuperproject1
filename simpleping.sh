#!/bin/bash
#Запускаем из под root  (sudo -i)
#bush simpleping.sh 192.168.2.35
#Пингуем хост с помощью Nmap 
### Глобальные переменные ###
#Сохраняем IP-адрес
IP_ADDRESS=$1
function ping_host (){
ping_cmd=$(nmap -sn $IP_ADDRESS | grep 'Host is up' | cut -d '(' -f 1)
}
function print_status ()
{
if [[ -z $ping_cmd ]]
then
echo 'Host ' $IP_ADDRESS  ' is down'
else
echo 'Host ' $IP_ADDRESS ' is up'
fi
}
ping_host
print_status
