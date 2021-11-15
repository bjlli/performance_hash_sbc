import timeit
from Cryptodome.Hash import SHA256
setup_details = """
from Cryptodome.Hash import SHA256
text_as_string = open('data.txt', 'r').read()
b = bytes(text_as_string, 'utf-8')
"""
code_timeit = """
message = SHA256.new()
message.update(b)
"""
min_time = min(timeit.repeat(code_timeit, setup_details,repeat=100, number=1))

print(min_time)