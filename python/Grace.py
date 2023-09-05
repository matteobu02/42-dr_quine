#!/usr/bin/python3

"""
	This program will print its own source when run.
"""

mystr = "#!/usr/bin/python3{0}{0}{1}{1}{1}{0}	This program will print its own source when run.{0}{1}{1}{1}{0}{0}mystr = {1}{2}{1}{0}{0}with open({1}Grace_kid.py{1}, {1}w{1}) as f:{0}    f.write(mystr.format(chr(10), chr(34), mystr)){0}"

with open("Grace_kid.py", "w") as f:
    f.write(mystr.format(chr(10), chr(34), mystr))
