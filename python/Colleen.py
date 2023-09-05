#!/usr/bin/python3

"""
    Comment outside of main.
"""
def dummy():
    return
def main():
    """
        Comment inside main.
    """
    dummy()
    mystr = "#!/usr/bin/python3{0}{0}{1}{1}{1}{0}    Comment outside of main.{0}{1}{1}{1}{0}def dummy():{0}    return{0}def main():{0}    {1}{1}{1}{0}        Comment inside main.{0}    {1}{1}{1}{0}    dummy(){0}    mystr = {1}{2}{1}{0}    print(mystr.format(chr(10), chr(34), mystr), end=''){0}{0}if __name__ == {1}__main__{1}:{0}    main(){0}"
    print(mystr.format(chr(10), chr(34), mystr), end='')

if __name__ == "__main__":
    main()
