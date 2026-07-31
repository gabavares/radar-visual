# Dashboard: direção de arte e spec

Arquivo único e estático em `docs/index.html`. Sem build, sem framework.
CSS e JS embutidos. Regenerado a cada rodada.

Precisa aguentar 200 imagens e 10 blocos sem travar.

## A tese

A página é um **moodboard**, não um relatório. Parede de imagens que se olha
em pé, com o texto entrando só onde precisa defender um agrupamento.

Três camadas, nesta ordem:

**Abertura.** Nome grande em display e os números da rodada em mono. Abaixo,
uma faixa de miniaturas em cartão branco levemente giradas, deslizando devagar
e sem fim. É o cheiro da rodada antes de qualquer conteúdo.

**Blocos.** Cada um abre com uma **imagem hero** grande, da própria rodada, com
o nome do bloco em display por cima. Depois vêm as cinco linhas e as peças.

**A varredura inteira.** Fecha a página com **tudo que foi coletado, sem
filtrar nada para fora** — inclusive o que não virou bloco e o que foi
descartado na etapa 4. É o que permite conferir o recorte: quem duvidar de um
bloco rola até o fim e olha o material bruto de onde ele saiu.

Os blocos são leitura de curador; a varredura inteira é a prova.

## A regra de texto

**Nenhum parágrafo aparece na página em repouso.**

A defesa de cada bloco é cinco linhas rotuladas, uma frase cada, e a frase é
curta. O rótulo vai em mono minúsculo, a frase em corpo. Isso é para ser lido
em pé, de relance, no meio de uma reunião.

```
O QUE É      uma frase
DE ONDE VEM  uma frase
POR QUE AGORA uma frase
ONDE ENCAIXA uma frase
ONDE NÃO     uma frase
```

Abaixo delas, um único link discreto em mono escrito **contexto**. Clicar
expande o parágrafo pesquisado da etapa 6, ali mesmo, sem sair da página. Ele
começa recolhido e volta a recolher.

Assim a explicação do movimento existe inteira, e quem quiser mergulhar
mergulha, mas ninguém é obrigado a atravessar um paredão de texto para chegar
nas imagens.

Se uma das cinco linhas ficar com mais de uma frase, ela está errada. O
excedente pertence ao contexto.

## Paleta

```
--paper       #F5F2EB   fundo, papel quente
--card        #FFFFFF   cartão da peça
--ink         #17181D   texto principal
--muted       #79757F   rótulos, créditos, metadados
--line        #E3DED4   divisores e bordas
--accent      #D8402A   emergente, filtro ativo, link em hover
```

Fundo claro e quente, de papel, porque a página é parede de moodboard e não
projeção. A peça ganha um cartão branco com sombra, que a separa do fundo e
faz a parede parecer impressa em vez de renderizada.

O acento aparece pouco: bloco emergente, filtro ativo, link em hover, e a
segunda linha do nome na abertura.

## Tipografia

- **Display:** Bricolage Grotesque, variável. Só nomes de bloco. Grande e pouco.
- **Corpo:** IBM Plex Sans. As cinco frases e o contexto.
- **Dados:** IBM Plex Mono. Rótulos, autor, fonte, contagens, termos derivados.

Rótulo e metadado sempre em mono, e menores que o corpo. É o que faz as cinco
linhas parecerem uma ficha e não um texto.

## Estrutura

**Abertura.** Nome da ferramenta em display enorme, caixa alta, duas linhas,
a segunda no acento. Abaixo, em mono: recorte da rodada, data, coletadas, na
página, grupos. Cinco números soltos, sem cartão e sem ícone.

Depois, a **faixa**: miniaturas de 170px em cartão branco, giradas de um grau
para um lado e para o outro, deslizando na horizontal em laço contínuo. Pausa
no hover. Some com `prefers-reduced-motion`. É decoração honesta — são peças
da rodada, não stock.

**Imagem hero do bloco.** Uma peça do próprio bloco, grande, com véu escuro no
pé e o nome em display por cima em branco. Move um pouco mais devagar que a
página, no máximo 7%. É o único parallax da página e ele é sutil de propósito.

**Barra de blocos.** Fixa ao rolar. Lista horizontal de todos os blocos em
mono, emergentes primeiro e marcados com o acento. Clique salta. Se a lista
não couber, ela rola horizontalmente, sem quebrar em duas linhas.

**Bloco.** Abaixo do hero, duas colunas assimétricas. À esquerda, coluna
estreita e fixa: as cinco linhas rotuladas, cada uma separada por um fio, e o
link de contexto. À direita, as peças em moodboard.

O tipo, a origem do nome, a contagem de fontes e de peças ficam no hero, em
mono, acima do nome. Bloco emergente marca o nome com um ponto no acento e
tinge essa linha de metadado. Sem badge colorida, sem etiqueta.

**Moodboard.** Colunas de CSS, gutter de 20px. Cada peça é um cartão branco
com respiro em volta, sombra baixa e uma rotação de menos de um grau que
alterna. No hover o cartão se endireita, sobe 7px, a sombra abre e a imagem
dá um zoom de 3%. É o gesto que faz a parede parecer manipulável.

**A varredura inteira.** Mesma linguagem de cartão, em colunas mais estreitas
e seis por vez. Todas as peças coletadas, sem exceção. Legenda menor.

O bloco de avulsas fecha a página. No lugar das cinco linhas, uma só,
dizendo que são peças que não rimaram com nada e que é onde costuma aparecer
o que ainda não tem nome.

**Peça.** Em repouso, só a imagem. No hover, autor, fonte e ano em mono no
rodapé, com link para o original em nova aba. Clique abre lightbox com a
versão full, que fecha no Esc e no clique fora e navega com as setas.

Peça sem autor é normal e não é erro: mostre só a fonte, sem travessão solto,
sem "autor desconhecido" e sem espaço reservado. O crédito encolhe, a imagem
não muda de tamanho.

**Rodadas anteriores.** Lista em mono no rodapé, por data e recorte. Cada
rodada é uma página própria em `docs/`, não tudo na mesma.

## Filtros

Busca por texto que casa nome de bloco, as cinco linhas e autor. Um toggle
para mostrar só emergentes. Nada além disso.

## Performance

Não negociável, porque o volume quebra a página se for ignorado.

- Thumbs de até 300px na faixa e nos moodboards; full só no hero e no lightbox
- `loading="lazy"` em tudo abaixo da primeira dobra
- `width` e `height` declarados em toda imagem, para não haver salto de layout
- Masonry em CSS columns ou grid, sem biblioteca de JS
- A página renderiza progressivamente, não espera tudo carregar
- O parallax passa por `requestAnimationFrame` e o listener de scroll é
  `passive`, senão o scroll trava com a varredura inteira carregada

## Movimento

O movimento é parte da direção de arte aqui, mas todo ele é lento e nenhum
chama atenção para si.

- **Entrada por scroll.** Cada elemento sobe 26px e aparece, em cascata de até
  320ms dentro do mesmo grupo. Uma vez só, sem repetir na volta.
- **Hero com parallax de 7%.** Sutil o bastante para dar profundidade sem dar
  enjoo.
- **Faixa de abertura em laço**, devagar, pausando no hover.
- **Cartão no hover:** endireita, sobe, sombra abre, imagem em 3%.
- **Contexto** expande deslizando, com a seta girando 90 graus.
- **Lightbox** abre em fade com a figura crescendo de 98,5% para 100%.

Nada pulsa e nada flutua sozinho na tela parada.

`prefers-reduced-motion` desliga tudo, inclusive o laço e o parallax, e a
página continua inteira.

**Regra dura:** o estado escondido do reveal só pode entrar no documento junto
com o script que sabe desfazê-lo. Se o JS não rodar, a página tem que aparecer
inteira. Já quebrou uma vez por causa disso: `opacity:0` no CSS deixou a
página em branco onde o observer não subiu.

## Quality floor

- Responsivo até 360px. No mobile a coluna de defesa vai para cima do
  moodboard, o hero encolhe para 46vh e a faixa segue rolando
- Foco de teclado visível em peça, bloco, contexto e busca
- Contraste AA no texto
- Alt descrevendo a peça

## O que não fazer

Sem gradiente animado. Sem glassmorphism na interface, que seria usar uma
estética catalogada como decoração da ferramenta que cataloga. Sem contador
animado, sem cartão de estatística, sem parágrafo visível em repouso.

Sem fita adesiva, sem alfinete, sem textura de cortiça. O moodboard se faz com
cartão branco, sombra e uma rotação de menos de um grau — passar disso vira
scrapbook e a ferramenta perde a cara de instrumento.

A boldness está no display da abertura, na densidade da varredura inteira e nas
imagens hero. Todo o resto é quieto.
