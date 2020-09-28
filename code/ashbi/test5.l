%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include  <ctype.h>

%}

delim	                    [ \t\n]
ws	                      {delim}+
letter	                  [A-Za-z]
digit	                    [0-9]
id	                      {letter}({letter}|{digit})*
number	                  {digit}+(\.{digit}+)?(E[+-]?{digit}+)?

%%
{ws}		                  {/* No Action*/}
double                    {printf("keyword       %s \n", yytext);    return DOUBLE;}
int                       {printf("keyword       %s \n", yytext);    return INT;}
break                     {printf("keyword       %s \n", yytext);    return BREAK;}
else                      {printf("keyword       %s \n", yytext);    return ELSE;}
long                      {printf("keyword       %s \n", yytext);    return LONG;}
char                      {printf("keyword       %s \n", yytext);    return CHAR;}
return                    {printf("keyword       %s \n", yytext);    return RETURN;}
continue                  {printf("keyword       %s \n", yytext);    return CONTINUE;}
for                       {printf("keyword       %s \n", yytext);    return FOR;}
signed                    {printf("keyword       %s \n", yytext);    return SIGNED;}
do                        {printf("keyword       %s \n", yytext);    return DO;}
if                        {printf("keyword       %s \n", yytext);    return IF;}
static                    {printf("keyword       %s \n", yytext);    return STATIC;}
while                     {printf("keyword       %s \n", yytext);    return WHILE;}
float                     {printf("keyword       %s \n", yytext);    return FLOAT;}
short                     {printf("keyword       %s \n", yytext);    return SHORT;}
"++"                      {printf("operator      %s \n", yytext);    return UNIPLUS;}
"--"                      {printf("operator      %s \n", yytext);    return UNIMINUS;}
"="                       {printf("operator      %s \n", yytext);    return ASSIGN;}
"!="                      {printf("operator      %s \n", yytext);    return NOTEQUAL;}
">"                       {printf("operator      %s \n", yytext);    return GT;}
"<"                       {printf("operator      %s \n", yytext);    return LT;}
">="                      {printf("operator      %s \n", yytext);    return GE;}
"<="                      {printf("operator      %s \n", yytext);    return LE;}
"=="                      {printf("operator      %s \n", yytext);    return EQUAL;}
"{"                       {printf("seperator     %s \n", yytext);    return LBRACK;}
"}"                       {printf("seperator     %s \n", yytext);    return RBRACK;}
"("                       {printf("seperator     %s \n", yytext);    return LPARAN;}
")"                       {printf("seperator     %s \n", yytext);    return RPARAN;}
";"                       {printf("seperator     %s \n", yytext);    return SEMICOLON;}
"+"                       {printf("operator      %s \n", yytext);    return ADD;}
"/"                       {printf("operator      %s \n", yytext);    return DIV;}
"*"                       {printf("operator      %s \n", yytext);    return MUL;}
"%"                       {printf("operator      %s \n", yytext);    return MOD;}
"-"                       {printf("operator      %s \n", yytext);    return SUB;}
{id}		                  {printf("identifier    %s \n", yytext) ;   return ID;}
{number}	                {printf("number        %s \n",yytext);     return NUM;}
<<EOF>>                   {printf("*** End of file *** \n");          return eof;}
%%

int main(void)
{

    yyin = fopen("file.txt", "r");
    int inputLexeme=-1;
    do
    {
      inputLexeme=yylex();
    }while(inputLexeme!=eof);

    return 0;
}
