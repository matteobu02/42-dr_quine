CXX			=	gcc
CXXFLAGS	=	-Wall -Wextra -Werror

COLLEEN		=	Colleen
GRACE		=	Grace
SULLY		=	Sully


# ===== #


all:			$(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN):		Colleen.c
				$(CXX) $(CXXFLAGS) Colleen.c -o $(COLLEEN)

$(GRACE):		Grace.c
				$(CXX) $(CXXFLAGS) Grace.c -o $(GRACE)

$(SULLY):		Sully.c
				$(CXX) $(CXXFLAGS) Sully.c -o $(SULLY)

clean:
				rm -rf $(COLLEEN) $(GRACE) $(SULLY)

re:				clean all

.PHONY:			re clean all
