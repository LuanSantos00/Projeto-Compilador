%{
    //definições em C
    #include <stdio.h>
    #include <math.h>
%}
    //definições regulares
NUM [0-­9]+\.?[0-9]*
VAR [a-z]
PRINT "imprima"
SCAN "leia"
FIM "fim"
INI "inicio"
RAIZ "raiz"

%%
    //definições  dos tokens
[-+/*^=()] {
    return *yytext;
}

{FIM} {
    return FIM;
}

{INI} {
    return INI;
    }

{RAIZ} {
    return RAIZ;
    }

{PRINT} {
    return PRINT;
}

{SCAN} {
    return SCAN;
}

{VAR} {
    yylval.inter = *yytext - 'a';
    return VAR;
}

{NUM} {
    yylval.real = atof(yytext);
    return NUM;
    }



[\ \n\t]* {;}
%%

