# LadyLuck
Pequeno projeto em Lua para a disciplina INF1629 - Princípios de Engenharia de Software. Simula jogadas de dados de até 20 faces, e plota o gráfico com histórico das jogadas, permitindo importação e exportação como CSV.

## Como rodar
É necessário Lua5.1 e Löve 0.10.1 instalados.

Basta ir uma pasta acima de /LadyLuck/ e digitar o comando: love LadyLuck.

## Estrutura
O modelo da arquitetura se encontra em modeloSimples.png.

O arquivo principal da aplicação é main.lua.

conf.lua é utilizado para configuração da janela de Löve.

Os arquivos no diretório Tests/ realizam testes sobre os que se encontram nos diretórios Dice/ e IO/, ou seja, sobre os arquivos dice.lua, reader.lua e writer.lua. O arquivo input.csv é utilizado nos testes.

O arquivo hist.lua é o utilizado para armazenar jogadas passadas de dados.

## Livro diário
O código foi desenvolvido com os princípios de identificação, rastro, verificação e validação em mente.

### Dia 2016/04/08
Neste dia defini o tema e esbocei a arquitetura, buscando respeitar à regra do 3-6 da modularidade.

### Dia 2016/04/09
Aqui, comecei a desenvolver os módulos Dice, Tests e TestsDice.

### Dia 2016/04/10
Neste dia foram iniciados os módulos Reader, Writer, TestsReader e TestsWriter. O módulo Tests foi adaptado para comportar os novos testes.

### Dia 2016/04/11
Neste dia foram desenvolvidos os módulos Main e Conf, com foco na parte gráfica.

### Dia 2016/04/12
Dia tirado para correção de bugs da parte gráfica.

### Dia 2016/04/13
Dia tirado para correção de bugs que existiam ao ler e escrever arquivos, ainda sem sucesso.

## Bugs ainda existentes
Os módulos Reader e Writer não estão funcionando corretamente, e param a aplicação.