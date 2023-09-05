#!/usr/bin/python3

from os import system
from os.path import exists

i = 5

if i > 0:
    mystr = "#!/usr/bin/python3{0}{0}from os import system{0}from os.path import exists{0}{0}i = {2}{0}{0}if i > 0:{0}    mystr = {1}{3}{1}{0}    filename = {1}Sully_%d.py{1} % (i){0}    if exists(filename):{0}        i -= 1{0}        filename = {1}Sully_%d.py{1} % (i){0}{0}    with open(filename, {1}w{1}) as f:{0}        f.write(mystr.format(chr(10), chr(34), i, mystr)){0}{0}    system({1}/usr/bin/python3 %s{1} % (filename)){0}"
    filename = "Sully_%d.py" % (i)
    if exists(filename):
        i -= 1
        filename = "Sully_%d.py" % (i)

    with open(filename, "w") as f:
        f.write(mystr.format(chr(10), chr(34), i, mystr))

    system("/usr/bin/python3 %s" % (filename))
