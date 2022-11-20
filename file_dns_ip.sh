#!/bin/bash
#Пингуем и получаем DNS-имена для IP-адресов, хранящихся в файле
#Запускаем из под root  (sudo -i)
#Выводим пользователю подсказку ввести имя файла и путь до него.
read -p "Enter the IP addresses file name / path:" FILE_PATH_NAME
function check_host(){
#Если значение IP-адреса не пусто
if [[ -n $IP_ADDRESS ]]
then
ping_cmd=$(nmap -sn $IP_ADDRESS| grep 'Host is up' | cut
-d '(' -f 1)
echo '------------------------------------------------'
if [[ -z $ping_cmd ]]
then
printf "$IP_ADDRESS is down\n"
else
printf "$IP_ADDRESS is up\n"
dns_name
fi
fi
}
function dns_name(){
dns_name=$(host $IP_ADDRESS)
printf "$dns_name\n"
}
#Проходим циклом по IP-адресам в файле
for ip in $(cat $FILE_PATH_NAME)
do
IP_ADDRESS=$ip
check_host
done
