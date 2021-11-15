import timeit
from hashlib import shake_256
setup_details = """
from hashlib import shake_256
text_as_string = open('data.txt', 'r').read()
b = bytes(text_as_string, 'utf-8')
"""
code_timeit = """
message = shake_256()
message.update(b)
"""
min_time = min(timeit.repeat(code_timeit, setup_details,repeat=100, number=1))
print(min_time)