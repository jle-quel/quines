#include <stdio.h>

/*
	Commentaire
*/

static inline void function(void)
{
}

int main(void)
{
	/*
		Commentaire
	*/
	function();
	char *str = "#include <stdio.h>%1$c%1$c/*%1$c%2$cCommentaire%1$c*/%1$c%1$cstatic inline void function(void)%1$c{%1$c}%1$c%1$cint main(void)%1$c{%1$c%2$c/*%1$c%2$c%2$cCommentaire%1$c%2$c*/%1$c%2$cfunction();%1$c%2$cchar *str = %3$c%4$s%3$c;%1$c%2$cprintf(str, 0xa, 0x9, 0x22, str);%1$c}%1$c";
	printf(str, 0xa, 0x9, 0x22, str);
}
