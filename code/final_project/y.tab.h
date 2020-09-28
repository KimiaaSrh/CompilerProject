
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 258,
     NUM = 259,
     INT = 260,
     CHAR = 261,
     DOUBLE = 262,
     LONG = 263,
     FLOAT = 264,
     IF = 265,
     ELSE = 266,
     WHILE = 267,
     FOR = 268,
     SEMICOLON = 269,
     LT = 270,
     GT = 271,
     AS = 272,
     EQ = 273,
     NE = 274,
     GTE = 275,
     LTE = 276,
     ADDOP = 277,
     MINUSOP = 278,
     DEVIDEOP = 279,
     CROSSOP = 280,
     REMAIN = 281,
     OPNP = 282,
     CLSP = 283,
     OPNB = 284,
     CLSB = 285
   };
#endif
/* Tokens.  */
#define ID 258
#define NUM 259
#define INT 260
#define CHAR 261
#define DOUBLE 262
#define LONG 263
#define FLOAT 264
#define IF 265
#define ELSE 266
#define WHILE 267
#define FOR 268
#define SEMICOLON 269
#define LT 270
#define GT 271
#define AS 272
#define EQ 273
#define NE 274
#define GTE 275
#define LTE 276
#define ADDOP 277
#define MINUSOP 278
#define DEVIDEOP 279
#define CROSSOP 280
#define REMAIN 281
#define OPNP 282
#define CLSP 283
#define OPNB 284
#define CLSB 285




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 42 "fin.y"
char str [1000]; 


/* Line 1676 of yacc.c  */
#line 116 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


