%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    
    float var[26];

    int yylex();
    void yyerror (char *s){
    printf("%s\n", s);
}

%}
%union {
    float real;
    int inter;
}

%token <real>NUM
%token <inter>VAR
%token FIM
%token INI
%token PRINT
%token SCAN
%token RAIZ


%left '+' '-'
%left '*' '/'
%left '^'
%left ')'
%right '('

%type <real>exp
%type <real>valor

%%

prog: INI cod FIM 
    ;

cod: cod cmdos
    |
    ;

cmdos: PRINT '(' exp ')'{
        printf ("%.2f\n",$3);
    }
    |
    SCAN '(' VAR ')' {
        scanf("%f",&var[$3]);
    }
    |
    VAR '=' exp {
       var[$1] = $3;
    }
    ;

exp: exp '+' exp {
    $$ = $1 + $3;
    //printf ("%.2f + %.2f = %.2f\n",$1,$3,$$);
    }
    | exp '-' exp {
        $$ = $1 - $3;
        //printf ("%.2f - %.2f = %.2f\n",$1,$3,$$);
        }
    | exp '*' exp {
        $$ = $1 * $3;
        //printf ("%.2f * %.2f = %.2f\n",$1,$3,$$);
        }
    | RAIZ'('exp')' {
        float sqrt = $3 / 2;
        float temp = 0;

        while(sqrt != temp){
            temp = sqrt;

            sqrt = ($3 / temp + temp) / 2;
        }
        $$ = sqrt;
        //printf ("%.2f * %.2f = %.2f\n",$1,$3,$$);
        }        
    | exp '^' exp {
        //$$ = pow($1,$3);
        float res = 1;
        if($3 == 0){
            res = 1; 
        }
        for (int i=1; i<=$3; i++){
             res *= $1;
             //return res;
         }
        $$ = res;
        //printf ("%.2f * %.2f = %.2f\n",$1,$3,$$);
        }
    | exp '/' exp {
        if($3 == 0){
            printf("Impossível dividir um número por 0.\n");
            int a = pow(2,2);
            return 0;
        }
        $$ = $1 / $3;
        //printf ("%.2f * %.2f = %.2f\n",$1,$3,$$);
        }
    | '(' exp ')' {
        $$ = $2;
    }
    | valor {
        $$ = $1;
        }
    | VAR {
        $$ = var[$1];
    }
    ;

valor: NUM {
    $$ = $1;
    }
;
%%

#include "lex.yy.c"
int main(){
    yyin=fopen("exemplo.luan","r");
    yyparse();
    yylex();
    fclose(yyin);
return 0;
}