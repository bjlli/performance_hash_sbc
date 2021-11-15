#Desempenho de funções hash criptográficas em computadores de placa única.

Os scripts deste repositório tem como objetivo testar e analisar o desempenho de funções hash criptográficas implementadas em python em computadores de placa única (com sistema operacional Linux, com base Debian). São utilizadas para os testes as seguintes funções: SHA2, Blake2, SHA3 (Keccak) e SHAKE e todas foram elas implementadas para retornar códigos hash de 256 bits (32 bytes).

Os testes realizados são:

- Análise de tempo: São gerados arquivos pseudoaleatórios de tamanhos pré-determinados (1B, 100, 1KB, 100KB e 1MB) contendo caracteres alfanuméricos e especiais, esses arquivos são as entradas das funções hash. O tempo de execução do script para a obtenção do código hash é aferido utilizando-se o módulo timeit em python, para cada medição de tempo um novo arquivo pseudoaleatório é gerado e depois são tirados os dados estatísticos dos ensaios.

 
- Consumo energético: Para os testes referentes ao consumo energético do dispositivo iot na execução das funções hash utiliza-se o sensor de corrente INA219 com comunicação I²C com um terceiro dispositivo. O sensor deve ser fazer medições enquanto o dispositivo (sem nenhum periférico) executa os scripts das funções por diversas vezes.

Para a execução destes scripts você vai precisar de:

-PyCryptodome: pip3 install pycryptodomex

-Hashlib: pip3 install hashlib

-Timeit module

-Pi-ina219 library

-Sys module

-Numpy package

Python version 3.6.9
