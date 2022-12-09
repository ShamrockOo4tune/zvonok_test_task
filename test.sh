#!/bin/bash
a=$1
b=$2

echo с -gt / -eq операторами:
if [[ ${a} -gt ${b} ]]; then
echo ${a} ">" ${b};
elif [[ ${a} -eq ${b} ]]; then
echo ${a} "=" ${b};
else
echo ${a} "<" ${b};
fi


echo 'с двойными скобками (арифметический контекст):'
if (( ${a} > ${b} )); then
echo ${a} ">" ${b};
elif (( ${a} == ${b} )); then
echo ${a} "=" ${b};
else
echo ${a} "<" ${b};
fi