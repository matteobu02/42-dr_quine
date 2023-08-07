ASM			=	nasm
CXX			=	gcc
ASMFLAGS	=	-f
CXXFLAGS	=	-Wall -Wextra -Werror

ifeq ($(shell uname), Linux)
	ASMFLAGS += elf64
else
	ASMFLAGS += macho64
endif

COLLEEN		=	Colleen
GRACE		=	Grace
SULLY		=	Sully


# ===== #


all:			$(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN):		Colleen.s
				$(ASM) $(ASMFLAGS) Colleen.s
				$(CXX) $(CXXFLAGS) Colleen.o -o $(COLLEEN)

$(GRACE):		Grace.s
				$(ASM) $(ASMFLAGS) Grace.s
				$(CXX) $(CXXFLAGS) Grace.o -o $(GRACE)

$(SULLY):		Sully.s
				$(ASM) $(ASMFLAGS) Sully.s
				$(CXX) $(CXXFLAGS) Sully.o -o $(SULLY)

clean:
				rm -rf Colleen.o Grace.o Sully.o

fclean:			clean
				rm -rf $(COLLEEN) $(GRACE) $(SULLY)

re:				clean all

.PHONY:			re clean fclean all
