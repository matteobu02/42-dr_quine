#!/usr/bin/python3

from os import system

i = 5

if i > 0:
    mystr = "#!/usr/bin/python3{0}{0}from os import system{0}{0}i = {2}{0}{0}if i > 0:{0}    mystr = {1}{3}{1}{0}{0}    with open({1}Sully_%d.py{1} % (i - 1), {1}w{1}) as f:{0}        f.write(mystr.format(chr(10), chr(34), i - 1, mystr)){0}{0}    system({1}/usr/bin/python3 Sully_%d.py{1} % (i - 1)){0}"

    with open("Sully_%d.py" % (i - 1), "w") as f:
        f.write(mystr.format(chr(10), chr(34), i - 1, mystr))

    system("/usr/bin/python3 Sully_%d.py" % (i - 1))
