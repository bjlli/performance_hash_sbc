Observações importantes:

-Para a execução das medições de tempo executa-se o script time_hash.sh.
>> bash time_hash.sh

-A função timeit é repetida várias vezes para a medição do tempo de execução para cada 
arquivo pseudoaleatório gerado. O menor valor dessas várias medições é utilizado para o 
cálculo do tempo de execução final (onde são considerados os tempos de execução para outros arquivos
gerados) devido ao fato de que os valores de tempo maiores geralmente não ocorrem por conta
da rapidez do script e sim devido aos outros processos realizados pelo sistema da máquina.

-Para dispositivos com 64 bits utiliza-se Blake2b e para dispositivos de 32 bits utiliza-se
Blake2s. Para operar com os testes em plataformas 64 bits basta substituir BLAKE2s no arquivo 
blake2_time por BLAKE2b:
>> from Cryptodome.Hash import BLAKE2b

