#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>

int i = 5;

int main(void)
{
	if (i > 0)
	{
		char str[]="#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <stdlib.h>%1$c%1$cint i = %3$d;%1$c%1$cint main(void)%1$c{%1$c	if (i > 0)%1$c	{%1$c		char str[]=%2$c%4$s%2$c;%1$c%1$c		char filename[32] = {0};%1$c		sprintf(filename, %2$cSully_%%d.c%2$c, i - 1);%1$c%1$c		int fd = creat(filename, 0600);%1$c		if (fd == -1) return 1;%1$c%1$c		dprintf(fd, str, 10, 34, i - 1, str);%1$c%1$c		char sys_command[256] = {0};%1$c		char child_exec[64] = {0};%1$c		sprintf(child_exec, %2$cSully_%%d%2$c, i - 1);%1$c		sprintf(sys_command, %2$cgcc -Wall -Wextra -Werror %%1$s -o %%2$s && ./%%2$s%2$c, filename, child_exec);%1$c%1$c		system(sys_command);%1$c	}%1$c	return 0;%1$c}%1$c";

		char filename[32] = {0};
		sprintf(filename, "Sully_%d.c", i - 1);

		int fd = creat(filename, 0600);
		if (fd == -1) return 1;

		dprintf(fd, str, 10, 34, i - 1, str);

		char sys_command[256] = {0};
		char child_exec[64] = {0};
		sprintf(child_exec, "Sully_%d", i - 1);
		sprintf(sys_command, "gcc -Wall -Wextra -Werror %1$s -o %2$s && ./%2$s", filename, child_exec);

		system(sys_command);
	}
	return 0;
}
