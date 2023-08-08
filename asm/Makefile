ASM			=	nasm
LD			=	ld
ASMFLAGS	=	-f
LDFLAGS		=	--dynamic-linker /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc

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
				$(LD) $(LDFLAGS) -e main Colleen.o -o $(COLLEEN)

$(GRACE):		Grace.s
				$(ASM) $(ASMFLAGS) Grace.s
				$(LD) $(LDFLAGS) -e main Grace.o -o $(GRACE)

$(SULLY):		Sully.s
				$(ASM) $(ASMFLAGS) Sully.s
				$(LD) $(LDFLAGS) -e main Sully.o -o $(SULLY)

clean:
				rm -rf Colleen.o Grace.o Sully.o

fclean:			clean
				rm -rf $(COLLEEN) $(GRACE) $(SULLY)

re:				clean all

.PHONY:			re clean fclean all
