#include <stdio.h>

/*
	Comment
*/

int function(void)
{
	char *str = "#include <stdio.h>%1$c%1$c/*%1$c%2$cComment%1$c*/%1$c%1$cint function(void)%1$c{%1$c%2$cchar *str = %3$c%4$s%3$c;%1$c%2$creturn printf(str, 0xa, 0x9, 0x22, str);%1$c}%1$c%1$cint main(void)%1$c{%1$c%2$c/*%1$c%2$c%2$cComment%1$c%2$c*/%1$c%2$creturn function();%1$c}%1$c";
	return printf(str, 0xa, 0x9, 0x22, str);
}

int main(void)
{
	/*
		Comment
	*/
	return function();
}
