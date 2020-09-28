%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define LT              256
#define LE              257
#define EQ              258
#define NE              259
#define GT              260
#define GE              261
#define RELOP           262
#define ID              263
#define NUM             264
#define IF              265
#define THEN            266
#define ELSE            267
#define FOR             268
#define BREAK           269
#define WHILE           270
#define CONTINUE        271
#define RETURN          272
#define INT             273
#define CHAR            274
#define FLOAT           275
#define DOUBLE          276
#define LONG            277
#define SIGNED          278
#define DO              279
#define STATIC          280
#define SHORT           281
#define CONST           282
#define NOTEQUAL        283
#define EQUAL           284
#define LBRACK          285
#define RBRACK          286
#define LPARAN          287
#define RPARAN          288
#define SEMICOLON       289
#define ADD             290
#define SUB             291
#define MUL             292
#define DIV             293
#define MOD             294
#define ASSIGN          295

static float yynval;

%}

delim	                    [ \t\n]
ws	                      {delim}+
letter	                  [A-Za-z]
digit	                    [0-9]
id	                      {letter}({letter}|{digit})*
number	                  {digit}+(\.{digit}+)?(E[+-]?{digit}+)?

%%
{ws}		                  {/* No Action*/}
double                    {return DOUBLE;}
int                       {return INT;}
break                     {return BREAK;}
else                      {return ELSE;}
long                      {return LONG;}
char                      {return CHAR;}
return                    {return RETURN;}
continue                  {return CONTINUE;}
for                       {return FOR;}
signed                    {return SIGNED;}
do                        {return DO;}
if                        {return IF;}
static                    {return STATIC;}
while                     {return WHILE;}
float                     {return FLOAT;}
short                     {return SHORT;}
"="                       {return ASSIGN;}
"!="                      {return NOTEQUAL;}
">"                       {return GT;}
"<"                       {return LT;}
">="                      {return GE;}
"<="                      {return LE;}
"=="                      {return EQUAL;}
"{"                       {return LBRACK;}
"}"                       {return RBRACK;}
"("                       {return RPARAN;}
")"                       {return LPARAN;}
";"                       {return SEMICOLON;}
"+"                       {return ADD;}
"/"                       {return DIV;}
"*"                       {return MUL;}
"%"                       {return MOD;}
"-"                       {return SUB;}
{id}		                  {return ID;}
{number}	                {;return NUM;}
%%

int main(void)
{
    int inputLexeme=-1;
    do
    {
        inputLexeme=yylex();

        printf("\n %d \n", inputLexeme);

    }while(inputLexeme!=8);
    printf(" ** FINISHED! ** ");
    return 0;
}
