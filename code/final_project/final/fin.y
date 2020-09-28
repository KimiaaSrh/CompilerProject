%{
	void yyerror (const char  *s);
    #include <stdio.h>
    #include<stdlib.h>
    #include<string.h>
    #include<ctype.h>
    #include "fin.tab.h"
    int temporary = 0;
    int label = 0;

		extern FILE *yyin;
    int fornextlabel;
    int forcondlabel;
    int forstmtlabel;
    int foritrtlabel;

    int whileitrtlabel;
    int whilenxtlabel;

    int elslabel;
    int ifnxtlabel;



%}


%start Program


%token <str> ID NUM

%token <str> INT CHAR DOUBLE LONG FLOAT

%token IF ELSE  WHILE FOR SEMICOLON

%token <str> LT GT AS EQ NE GTE LTE ADDOP MINUSOP DEVIDEOP CROSSOP REMAIN

%token  OPNP CLSP OPNB CLSB

%union {char str [1000]; }





%type <str> expr
%type <str> rel
%type <str> add
%type <str> term
%type <str> factor
%type <str> relop
%type <str> addop
%type <str> termop
%type <str> decltype



%%

Program  : block
         ;

block : OPNB  stmts CLSB
      ;

stmts : stmts stmt {;}
      | {;}
      ;
stmt : expr SEMICOLON

     |{elslabel = label++; ifnxtlabel = label++;} IF OPNP expr {printf("if %s false go to label%d:\n",$4,elslabel); } CLSP stmt {printf("\ngo to lable%d\n label%d:\n",ifnxtlabel,elslabel);}ELSE  stmt  {printf("label%d:\n",ifnxtlabel);}



     | {forcondlabel = label++; foritrtlabel = label++; forstmtlabel = label++ ; fornextlabel = label++; } FOR OPNP expr SEMICOLON { printf("label%d : \n",forcondlabel);} expr { printf("if %s false go to label%d \nif %s true go to  label%d \nlabel%d : \n",$7,fornextlabel,$7,forstmtlabel,foritrtlabel);} SEMICOLON expr {printf("go to label%d : \n",forcondlabel);} CLSP {printf("label%d:\n",forstmtlabel);}stmt {printf("go to label%d : \nlabel%d : ",foritrtlabel,fornextlabel);}



     | {whileitrtlabel = label++; whilenxtlabel = label++;   printf("label%d : \n",whileitrtlabel);}  WHILE OPNP expr {printf("if %s go to label%d \n",$4,whilenxtlabel);} CLSP stmt   {printf("go to label%d \n label%d: \n",whileitrtlabel,whilenxtlabel);}



     | block



     |decls SEMICOLON
     ;

decls : decltype ID  {printf("%s %s ;\n",$1,$2);}
      ;

decltype: INT
        |CHAR
        |DOUBLE
        |LONG
        |FLOAT


expr : rel AS expr        {strcpy($$,$1); printf("%s = %s\n",$1,$3);}
     | rel
     ;

rel : rel relop add        {sprintf($$, "T%d", temporary++);printf("%s = %s %s %s\n",$$,$1,$2,$3);}
    | add
     ;

relop : LT
      | GT
      | EQ
      | NE
      | GTE
      | LTE
      ;
add : add addop term       {sprintf($$, "T%d", temporary++);printf("%s = %s %s %s\n",$$,$1,$2,$3);}
    | term
     ;
addop : ADDOP
      | MINUSOP
      ;
term : term termop factor {sprintf($$, "T%d", temporary++);printf("%s = %s %s %s\n",$$,$1,$2,$3);}
     |factor
     ;
termop :  DEVIDEOP
       |CROSSOP
       |REMAIN
       ;

factor : '(' expr ')'  {strcpy($$,$2);}
       | NUM
       | ID
       ;

%%



int main() {
  //FILE *yyout;


  //fprintf(yyout, "0 0 moveto\n");

  //if (argc == 1)
  //  yyparse();

  //if (argc == 2) {
    yyin = fopen("file.txt", "r");
		if (yyparse() != 0)
    	fprintf(stderr, "Abnormal exit\n");
  	return 0;
  //}


  return 0;
}
void yyerror(const char *s)
{ fprintf(stderr, "Error: %s\n", s); }


int yywrap(){
    return 1;
}
