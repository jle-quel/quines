#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

# define FAILURE -1
# define STR "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c%1$c# define FAILURE -1%1$c# define STR %3$c%4$s%3$c%1$c# define FT(x)int main(void){x}%1$c%1$cFT%1$c(%1$cint fd = 0;%1$c%1$cif ((fd = open(%3$cGrace_kid.c%3$c, O_WRONLY | O_CREAT | O_TRUNC, 0644)) == FAILURE)%1$c%2$creturn FAILURE;%1$cchar *str = STR;%1$cdprintf(fd, str, 0xa, 0x9, 0x22, str);%1$cclose(fd);%1$c)%1$c"
# define FT(x)int main(void){x}

FT
(
int fd = 0;

if ((fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC, 0644)) == FAILURE)
	return FAILURE;
char *str = STR;
dprintf(fd, str, 0xa, 0x9, 0x22, str);
close(fd);
)
