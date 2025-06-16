# Introdução ao Pandas

- biblioteca típica para dados
- dataframe: as informações são em formato tabular, de linhas e colunas
    - séries: são uma coluna do dataframe
- permite importar e exportar arquivos de diversos tipos, como csv, excel, json, html, sql e parquet.
    - usando o código `read_csv` (trocar csv por outros arquivos)
    - ele vem dentro de uma variável (normalmente chamada df ou dados)
- o df sempre começa em 0
    - `df.head()` mostra sempre as 5 primeiras linhas
    - `df.tail()` mostra as ultimas 5 linhas


## como usar no vsCode

- para instalar e usar ela no vscode, eu tenho que criar um Virtual Enviroment (venv) do python usando `python3 -m venv .venv`
- depois disso, eu tenho que dizer para ele qual é a source, com o codigo `source ./.venv/bin/activate`
    - essa pasta que eu chamei de .venv e onde está rodando o ambiente virtual não pode subir pro github (criar um .gitignore)
    - todas as minha bibliotecas são instaladas nela
    - para eu mudar de projeto eu devo rodar `deactivate` para desativar e não misturar as bibliotecas dos projetos
- após isso, posso rodar o codigo `pip install` e dizer qual é a biblioteca

- dentro de um arquivo `.py` eu devo escrever `import pandas as pd`

## Seleção de dados

- `df.shape` mostra a quantidade de linhas e colunas
- `df.columns` mostra o nome das colunas
- `df.[nome_da_coluna]` vai mostrar uma das colunas com os dados completos
    - podemos criar uma nova variável usando `nova_variavel = df.[nome_da_coluna]` onde essa variável ja chama apenas a coluna
        - o tipo dessa nova_variavel será `Series`
    - se usarmos apenas `df.nome_da_coluna`
- se formos pegar mais de uma coluna, usamos `df.[['nome_da_coluna1', 'nome_da_coluna2']]`
- `type(nome_da_variável)` vai mostrar o tipo de variável (dataframe é um tipo de variável no pandas)

### iloc

- para visualizarmos apenas algumas linhas
    - `df.iloc[0:15]` (ela exclui a ultima linha digitada)
    - `iloc` só aceita numeros, então as colunas passam a ser numeradas na ordem que estão na db
    - `df.iloc[0:5, 0:2]` seleciona as linhas 0 a 4 e as colunas 0 e 1

### usando condições lógicas

- `df.[df.['nome_da_coluna'] > 2500]`
- onde:
    - 'nome_da_coluna' é a coluna que voce quer analisar
    - e 2500 é referente aos numeros que estão nela
    - só vale para colunas com dado tipo numericos

## resumo sobre os dados


