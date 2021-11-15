import timeit
from Cryptodome.Hash import BLAKE2s #para dispositivos 64 bits deve-se utilizar Blake2b
setup_details = """
from Cryptodome.Hash import BLAKE2s
text_as_string = open('data.txt', 'r').read()
b = bytes(text_as_string, 'utf-8')
""" 
code_timeit = """
message = BLAKE2s.new(digest_bits=256)
message.update(b)
"""
min_time = min(timeit.repeat(code_timeit, setup_details,repeat=100, number=1))
print(min_time)
