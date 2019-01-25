#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

int main(void)
{
	int fd = 0;
	int8_t index = 5;
	char file[4096] = {0};
	char cmd[4096] = {0};
	char *str = "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdlib.h>%1$c%1$cint main(void)%1$c{%1$c%2$cint fd = 0;%1$c%2$cint8_t index = %5$d;%1$c%2$cchar file[4096] = {0};%1$c%2$cchar cmd[4096] = {0};%1$c%2$cchar *str = %3$c%6$s%3$c;%1$c%1$c%2$cif (index < 0)%1$c%2$c%2$creturn 0;%1$C%1$c%2$csprintf(file, %3$cSully_%4$cd.c%3$c, index);%1$c%2$csprintf(cmd, %3$cgcc Sully_%4$c1$d.c -o Sully_%4$c1$d && ./Sully_%4$c1$d%3$c, index);%1$c%1$c%2$cif ((fd = open(file, O_WRONLY | O_CREAT | O_TRUNC, 0644)) == -1)%1$c%2$c%2$creturn -1;%1$c%1$c%2$cdprintf(fd, str, 0xa, 0x9, 0x22, 0x25, index - 1, str);%1$c%1$c%2$cif (close(fd) == -1)%1$c%2$c%2$creturn -1;%1$c%1$c%2$cif (system(cmd) == -1)%1$c%2$c%2$creturn -1;%1$c%1$c%2$creturn 0;%1$c}%1$c";

	if (index < 0)
		return 0;

	sprintf(file, "Sully_%d.c", index);
	sprintf(cmd, "gcc Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d", index);

	if ((fd = open(file, O_WRONLY | O_CREAT | O_TRUNC, 0644)) == -1)
		return -1;

	dprintf(fd, str, 0xa, 0x9, 0x22, 0x25, index - 1, str);

	if (close(fd) == -1)
		return -1;

	if (system(cmd) == -1)
		return -1;

	return 0;
}
