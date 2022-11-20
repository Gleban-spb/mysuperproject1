#!/bin/bash
#Шкала прогресса с помощью цикла while
#Счетчик
COUNTER=1
#Шкала
BAR='##########'
while [[ $COUNTER -lt 11 ]]
do
#Печатаем шкалу прогресса, начиная с индекса 0
echo -ne "\r${BAR:0:COUNTER}"
#Ждем 1 секунду
sleep 1
#Увеличиваем счетчик
COUNTER=$(( $COUNTER +1 ))
done
echo 
#Шкала прогресса с циклом For
#Шкала
BAR='##########'
for COUNTER in {1..10}
do
#Печатаем шкалу прогресса, начиная с индекса 0
echo -ne "\r${BAR:0:$COUNTER}"
#Ждем 1 секунду
sleep 1
done
