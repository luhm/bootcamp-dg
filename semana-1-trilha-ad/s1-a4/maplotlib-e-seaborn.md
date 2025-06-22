# Visualização de Dados com Matplotlib e Seaborn: Gráficos e dashboards em Python

- matplotlib é uma biblioteca de geração de graficos/imagens
- seaborn é mais voltada para estatistica e foi criada em cima da matplotlib

## Matplotlib

- `pip install matplotlib` e pra importar, usar `import matplotlib.pyplot as plt`
- precisamos primeiro definir os dados que vamos utilizar, dizendo o que estará no eixo X e o que estará no eixo Y
    - para definir esses dados:
    - podemos colocar como dados gerais o DF que estivermos usando
    - podemos colocar o nome das colunas que vão nos eixos x e y
- podemos usar [estilos já predefinidos](https://matplotlib.org/stable/gallery/style_sheets/style_sheets_reference.html) da propria ferramenta
    - `plo.style.use('nome_do_estiilo')`
- grafico plot (de linhas)
    - `plt.plot(eixo_x, eixo_y)` e depois `plt.show()`
    - para dar nome aos eixos, usamos `plt.xlabel("eixo x")`, trocando x por y pro outro eixo
    - para dar um titulo ao gráfico, usamos `plt.title("título")`
- podemos criar uma figura a partir do gráfico, criando uma varável pra essa figura (ex fig), onde dentro dela colocamos a formatação da nossa figura
    - `fig = plt.figure(figsize=(10, 5))`
    - `fig.set_facecolor('blue')`
- gráfico de barras
    - `plt.bar(x,y)`

### subgráficos (subplots)

- `plt.subplots (x,y)`
    - x = qnt de linhas
    - y = qnt de colunas
- gera um array de gráficos, sob o nome de `Axes`
    - onde um subplot(2,2) terá 4 axes e cada axes pode ser acessado pela posição dele
        - axes[0,0] depois axes[0,1] e por aí vai
- para não haver sopreposição entre os gráficos, é importante usarmos a condição constrained:
    - `fig, ax = plot.subplots(figsize=(10,5), layout='constrained')`

## Seaborn

- a convenção é importar ele como `sns`
- ele já puxa a média dos dados quando voce define os dados
- é mais voltado para análises estatísticas
- foca um pouco mais na parte visual
- scatterplot é o gráfico de dispersão



