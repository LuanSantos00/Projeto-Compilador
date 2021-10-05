<h1><b>Calculadora (utilizando Lex/Flex/Yacc/Bison)</b></h1>


# Descrição
### Trabalho desenvolvido para a resolução de uma atividade(desenvolver uma calculadora contendo(Análise léxica e sintática com Lex/Flex/Yacc/Bison)) da disciplina de Compiladores.

# Pré Requisitos
* Certifique-se de ter um editor de código instalado. De preferência o Visual Studio Code.
* Certifique-se de ter instalado o flex/bison. <a href="https://drive.google.com/file/d/1npDjcReRgZMM4eczjHP2CguRnccqXBlL/view">Instalação para Windows</a> | <a href="https://howtoinstall.co/pt/bison">Instalação para Linux(ubuntu)</a>
* Certifique-se de ter instalado a extensão "Lex Flex Yacc Bison" no Visual Studio Code. 

# Rodar o Código
* Assegure-se de ter cumprido a etapa anterior;
* Clone o Repositório;
* Abra o projeto em um editor de código(vscode) e execute.
* No windows crie um arquivo <nome_arquivo>.bat com o seguinte código e execute no terminal:
```
        flex -i calc_luan.l
        bison calc_luan.y
        gcc calc_luan.tab.c -o compilador_luan -lfl

       .\compilador_luan
```

* No linux crie um arquivo makefile com o seguinte código e execute no terminal:
```
      all: 
          flex -i calc_luan.l
          bison calc_luan.y
          gcc calc_luan.tab.c -o compilador_luan -lfl
          
          ./compilador_luan
```

# Sintaxe

### Para sinalizar o início e fim do programa
```
inicio
  ... //codigo
fim
```

### Ler um valor
```
 leia(a)
```

### Imprimir um valor
```
 imprima(a)
```

### Atribuir um valor à variável
```
 a = 10
 b = 20
 c = a * b
```


### Operações Matemáticas

##### Adição
```
a = 3
b = 7
c = a + b
```

##### Subtração
```
a = 7
b = 3
c = a - b
```

##### Divisão
```
a = 10
b = 2
c = a / b
```
 
##### Multiplicação
```
a = 10
b = 5
c = a * b
```

##### Exponenciação
```
a = 5
b = 2
c = a ^ b
```

##### Radiciação
```
a = raiz(100)
```


