import timeit
from hashlib import sha256
setup_details = """
from hashlib import sha256
text_as_string = open('data.txt', 'r').read()
b = bytes(text_as_string, 'utf-8')
"""
code_timeit = """
message = sha256()
message.update(b)
"""
min_time = min(timeit.repeat(code_timeit, setup_details,repeat=100, number=1))
print(min_time)