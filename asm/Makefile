ASM			=	nasm
LD			=	ld
ASMFLAGS	=	-felf64
LDFLAGS		=	--dynamic-linker /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2 -lc

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
				$(LD) $(LDFLAGS) Grace.o -o $(GRACE)

$(SULLY):		Sully.s
				$(ASM) $(ASMFLAGS) Sully.s
				$(LD) $(LDFLAGS) Sully.o -o $(SULLY)

clean:
				rm -rf Colleen.o Grace.o Grace_kid.s Sully.o Sully_*

fclean:			clean
				rm -rf $(COLLEEN) $(GRACE) $(SULLY)

re:				fclean all

.PHONY:			re clean fclean all
