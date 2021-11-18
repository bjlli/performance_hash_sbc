#!/bin/bash

file_gen_wname(){
    tr -dc A-Za-z0-9_/*@_?! </dev/urandom | head -c $1 > "data_$echo$2.txt"
}

declare -a name_array

func_loop_wname(){
    for ((i=0;i<$1;i++)); do
        file_gen $2 $i
        name_array[$i]="data_$echo$i.txt"
    done
}


func_loop_wname 1000 16

echo "--------------------------"
echo "Rodando scripts de SHA256:"
echo "--------------------------"

python3 sha256_power.py ${name_array[@]}


echo "1 min para o novo script"

sleep 60

echo "--------------------------"
echo "Rodando scripts de Blake2:"
echo "--------------------------"

python3 blake2_power.py ${name_array[@]}

echo "1 min para o novo script"

sleep 60

echo "---------------------------"
echo "Rodando scripts de SHA3_256:"
echo "---------------------------"

python3 sha3_256_power.py ${name_array[@]}

echo "1 min para o novo script"

sleep 60

echo "---------------------------"
echo "Rodando scripts de SHAKE256:"
echo "---------------------------"

python3 shake256_power.py ${name_array[@]}
