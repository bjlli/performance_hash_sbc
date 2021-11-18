from Cryptodome.Hash import SHA3_256
import sys
text_as_string = []
count = len(sys.argv)
for i in range(1,count,1):
    string = open(sys.argv[i], 'r').read()
    text_as_string.append(string)
print("Execução da função:")
for i in range(count-1):
    for j in range(2):
        message = SHA3_256.new()
        message.update(bytes(text_as_string[i], 'utf-8'))


