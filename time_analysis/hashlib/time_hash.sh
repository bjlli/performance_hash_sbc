#!/bin/bash

: '
 Esse script deve ser executado no dispositivo iot com sistema
operacional debian ou ubuntu para calcular a média do tempo de
execução de funções hash para blocos de dados diferentes tamanhos. '

#Função que gera um arquivo txt com caracteres pseudoaleatórios e 
#tamanho pré determinado em bytes:
file_gen(){
    tr -dc A-Za-z0-9_/*@_?! </dev/urandom | head -c $1 > data.txt
}
#O tamanho do arquivo é um argumento e a função pode ser chamada
#desta maneira: file_gen 1024 (para gerar 1KB, por exemplo).

declare -a time_array

#Função que pega a medição do tempo do script em python para
#diferentes arquivos gerados de maneira pseudoaleatória e 
#aloca os valores em no array time_array:
func_loop(){
    for ((i=0;i<$1;i++)); do
        file_gen $2
        time_array[$i]=$(python3 $3)
    done
}
#O número de arquivos e medições (num), o tamanho do arquivo (tam) 
#e o nome do script em python (script.py) são,respectivamente, 
#argumentos dessa função que deve ser chamada dessa maneira:
#func_loop num tam script.py

#------------------------------------------------------------
#PARA SHA256:
#------------------------------------------------------------
echo "--------------------"
echo "Medidas para SHA256:"
echo "--------------------"

#Para 1B:
func_loop 100 1 sha256_time.py
echo "Para 1B:"
python3 calc.py ${time_array[@]}

#Para 100B:
func_loop 100 100 sha256_time.py
echo "Para 100B:"
python3 calc.py ${time_array[@]}

#Para 1KB:
func_loop 100 1024 sha256_time.py
echo "Para 1KB:"
python3 calc.py ${time_array[@]}

#Para 100KB:
func_loop 100 102400 sha256_time.py
echo "Para 100KB:"
python3 calc.py ${time_array[@]}

#Para 1MB:
func_loop 100 1048576 sha256_time.py
echo "Para 1MB:"
python3 calc.py ${time_array[@]}

#--------------------------------------------------------
#PARA BLAKE2:
#--------------------------------------------------------
echo "--------------------"
echo "Medidas para BLAKE2:"
echo "--------------------"

#Para 1B:
func_loop 100 1 blake2_time.py
echo "Para 1B:"
python3 calc.py ${time_array[@]}

#Para 100B:
func_loop 100 100 blake2_time.py
echo "Para 100B:"
python3 calc.py ${time_array[@]}

#Para 1KB:
func_loop 100 1024 blake2_time.py
echo "Para 1KB:"
python3 calc.py ${time_array[@]}

#Para 100KB:
func_loop 100 102400 blake2_time.py
echo "Para 100KB:"
python3 calc.py ${time_array[@]}

#Para 1MB:
func_loop 100 1048576 blake2_time.py
echo "Para 1MB:"
python3 calc.py ${time_array[@]}

#------------------------------------------------------------
#PARA SHA3_256:
#------------------------------------------------------------
echo "----------------------"
echo "Medidas para SHA3_256:"
echo "----------------------"

#Para 1B:
func_loop 100 1 sha3_256_time.py
echo "Para 1B:"
python3 calc.py ${time_array[@]}

#Para 100B:
func_loop 100 100 sha256_time.py
echo "Para 100B:"
python3 calc.py ${time_array[@]}

#Para 1KB:
func_loop 100 1024 sha3_256_time.py
echo "Para 1KB:"
python3 calc.py ${time_array[@]}

#Para 100KB:
func_loop 100 102400 sha3_256_time.py
echo "Para 100KB:"
python3 calc.py ${time_array[@]}

#Para 1MB:
func_loop 100 1048576 sha3_256_time.py
echo "Para 1MB:"
python3 calc.py ${time_array[@]}

 #------------------------------------------------------------
#PARA SHAKE256:
#------------------------------------------------------------
echo "----------------------"
echo "Medidas para SHAKE256:"
echo "----------------------"

#Para 1B:
func_loop 100 1 shake256_time.py
echo "Para 1B:"
python3 calc.py ${time_array[@]}

#Para 100B:
func_loop 100 100 shake256_time.py
echo "Para 100B:"
python3 calc.py ${time_array[@]}

#Para 1KB:
func_loop 100 1024 shake256_time.py
echo "Para 1KB:"
python3 calc.py ${time_array[@]}

#Para 100KB:
func_loop 5 102400 shake256_time.py
echo "Para 100KB:"
python3 calc.py ${time_array[@]}

#Para 1MB:
func_loop 100 1048576 shake256_time.py
echo "Para 1MB:"
python3 calc.py ${time_array[@]}
