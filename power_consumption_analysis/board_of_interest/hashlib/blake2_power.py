from hashlib import blake2s 
import sys
text_as_string = []
count = len(sys.argv)
for i in range(1,count,1):
    string = open(sys.argv[i], 'r').read()
    text_as_string.append(string)
print("Execução da função:")
for i in range(count-1):
    for j in range(1000):
        message = blake2s()
        message.update(bytes(text_as_string[i], 'utf-8'))


