%{

#include <stdio.h>

%}

%%

mov|MOV|jmp|JMP|nop|NOP { printf("OPCODE ");  printf("%s\n", yytext); }
a|A|x|X|y|Y { printf("REGISTER "); printf("%s\n", yytext); }

(0|1|2|3|4|5|6|7|8|9)+ { printf("DECIMALNUMBER "); printf("%s\n", yytext); }
0[xX][0-9a-fA-F]+ { printf("HEXADECIMALNUMBER "); printf("%s\n", yytext); }

" " { printf(""); }
"	" { printf(""); }
"\n" { printf(""); }

"," { printf("COMMA "); printf("%s\n", yytext); }
"[" { printf("OPENBRACKET "); printf("%s\n", yytext); }
"]" { printf("CLOSEDBRACKET "); printf("%s\n", yytext); }

. { printf("SYNTAXERROR "); printf("%s\n", yytext); }
              
%%            
              
int yywrap(void){return 1;}
              
int main()
{
  yylex();
  return 0;
}
