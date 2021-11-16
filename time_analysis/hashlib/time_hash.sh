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

#Para 16B:
func_loop 100 16 sha256_time.py
echo "Para 16B:"
python3 calc.py ${time_array[@]}

#Para 64B:
func_loop 100 64 sha256_time.py
echo "Para 64B:"
python3 calc.py ${time_array[@]}

#Para 256B:
func_loop 100 256 sha256_time.py
echo "Para 256B:"
python3 calc.py ${time_array[@]}

#Para 1KB:
func_loop 100 1024 sha256_time.py
echo "Para 1KB:"
python3 calc.py ${time_array[@]}

#Para 8KB:
func_loop 100 8192 sha256_time.py
echo "Para 8KB:"
python3 calc.py ${time_array[@]}

#Para 32KB:
func_loop 100 32768 sha256_time.py
echo "Para 32KB:"
python3 calc.py ${time_array[@]}


#--------------------------------------------------------
#PARA BLAKE2:
#--------------------------------------------------------
echo "--------------------"
echo "Medidas para BLAKE2:"
echo "--------------------"

#Para 16B:
func_loop 100 16 blake2_time.py
echo "Para 16B:"
python3 calc.py ${time_array[@]}

#Para 64B:
func_loop 100 64 blake2_time.py
echo "Para 64B:"
python3 calc.py ${time_array[@]}

#Para 256B:
func_loop 100 256 blake2_time.py
echo "Para 256B:"
python3 calc.py ${time_array[@]}

#Para 1KB:
func_loop 100 1024 blake2_time.py
echo "Para 1KB:"
python3 calc.py ${time_array[@]}

#Para 8KB:
func_loop 100 8192 blake2_time.py
echo "Para 8KB:"
python3 calc.py ${time_array[@]}

#Para 32KB:
func_loop 100 32768 blake2_time.py
echo "Para 32KB:"
python3 calc.py ${time_array[@]}

#------------------------------------------------------------
#PARA SHA3_256:
#------------------------------------------------------------
echo "----------------------"
echo "Medidas para SHA3_256:"
echo "----------------------"

#Para 16B:
func_loop 100 16 sha3_256_time.py
echo "Para 16B:"
python3 calc.py ${time_array[@]}

#Para 64B:
func_loop 100 64 sha256_time.py
echo "Para 64B:"
python3 calc.py ${time_array[@]}

#Para 256B:
func_loop 100 256 sha3_256_time.py
echo "Para 256B:"
python3 calc.py ${time_array[@]}

#Para 1KB:
func_loop 100 1024 sha3_256_time.py
echo "Para 1KB:"
python3 calc.py ${time_array[@]}

#Para 8KB:
func_loop 100 8192 sha3_256_time.py
echo "Para 8KB:"
python3 calc.py ${time_array[@]}

#Para 32KB:
func_loop 100 32768 sha3_256_time.py
echo "Para 32KB:"
python3 calc.py ${time_array[@]}

 #------------------------------------------------------------
#PARA SHAKE256:
#------------------------------------------------------------
echo "----------------------"
echo "Medidas para SHAKE256:"
echo "----------------------"

#Para 16B:
func_loop 100 16 shake256_time.py
echo "Para 16B:"
python3 calc.py ${time_array[@]}

#Para 64B:
func_loop 100 64 shake256_time.py
echo "Para 64B:"
python3 calc.py ${time_array[@]}

#Para 256B:
func_loop 100 256 shake256_time.py
echo "Para 256B:"
python3 calc.py ${time_array[@]}

#Para 1KB:
func_loop 100 1024 shake256_time.py
echo "Para 1KB:"
python3 calc.py ${time_array[@]}

#Para 8KB:
func_loop 100 8192 shake256_time.py
echo "Para 8KB:"
python3 calc.py ${time_array[@]}


#Para 32KB:
func_loop 100 32768 shake256_time.py
echo "Para 32KB:"
python3 calc.py ${time_array[@]}
