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

**Modo claro**, que é o padrão:

```
--paper       #FAFAFA   fundo
--card        #F2F1EF   campo de input e botão
--ink         #17181D   texto principal
--muted       #6F6C75   rótulos, créditos, metadados
--line        #E4E2DE   divisores e bordas
--accent      #D8402A   emergente, filtro ativo, link em hover
```

**Modo escuro**, no atributo `data-theme="dark"` da raiz:

```
--paper       #16171A   cinza escuro quase preto
--card        #212327
--ink         #F2F1EE   quase branco
--muted       #9C99A3
--line        #2D2F35
--accent      #FF6A52   vermelhão aberto, para segurar contraste no escuro
```

Sem branco puro nem preto puro em nenhum dos dois: a página é galeria, a cor
tem que vir das peças, e extremo de luminância no fundo cansa a vista e falseia
a leitura de paleta. A peça entra direto sobre o fundo, sem cartão e sem sombra.

O acento **muda** entre os modos, e isso não é enfeite: `#D8402A` sobre escuro
cai para perto do mínimo, então o modo escuro abre para `#FF6A52`. Todos os
pares medidos passam de AA — texto 15,9:1, metadado 6,4:1, acento 6,4:1.

**Botão de tema** à direita da barra fixa, junto dos outros controles, escrito
em mono: diz *escuro* quando está claro e *claro* quando está escuro, ou seja,
nomeia o destino e não o estado. A escolha grava em `localStorage` e é relida
por um script inline no `<head>`, antes da primeira pintura, senão a página
pisca branca antes de escurecer.

Claro é o padrão. Não seguimos `prefers-color-scheme`: quem quiser escuro
clica, e a partir daí a preferência é dele.

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
a segunda no acento. Abaixo, em mono: quantos blocos, quantas peças, quais
recortes, quantos meses, e a assinatura. Números soltos, sem cartão e sem ícone.

Logo abaixo dessa linha, em mono menor e na cor de metadado, **última
atualização** com data e hora da geração da página. É o que diz se o arquivo
está fresco sem precisar abrir o repositório.

**Barra fixa.** Carrega o logo `RADAR VISUAL — Gab Tavares` à esquerda, na
mesma tipografia da abertura, reduzido. O logo é botão: clica e volta ao topo.
Depois dele vêm os blocos, a busca e o toggle.

Depois, o **mosaico**: três faixas horizontais empilhadas, encostadas umas nas
outras, **sem moldura, sem borda e sem vão**. Não é carrossel em linha — as
peças entram em ordem embaralhada e com larguras diferentes, para a parede ter
ritmo em vez de fileira.

As três faixas deslizam em laço contínuo, em velocidades diferentes, e a do
meio anda no sentido oposto. Pausa no hover, e cada miniatura abre no lightbox
— a imagem já está na página, então o clique não custa nada.

**O mosaico obedece aos filtros.** Com recorte `mobile` e mês `2026-07`
selecionados, ele mostra só peças daquele recorte e daquele mês. É a mesma
regra da varredura: o filtro vale para a página inteira, não só para os blocos.

Some com `prefers-reduced-motion`.

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

**Moodboard.** Colunas de CSS, gutter apertado. **Nada é girado.** A peça é a
imagem, alinhada à grade, sem moldura branca, sem sombra de papel e sem
inclinação. Legenda em mono abaixo, discreta.

Isso é deliberado e substitui a versão anterior: cartão torto com sombra lê
como scrapbook de 2005. Portfólio de design contemporâneo é grade rigorosa e
imagem grande — a personalidade vem do ritmo entre os tamanhos, não de
efeito de colagem.

No hover a imagem sobe 4px e ganha um contorno fino no acento. Nada mais.

**A varredura inteira.** Ocupa a **largura total da página**, sem a margem
máxima que segura os blocos. Colunas estreitas, muitas por vez, legenda menor.
Todas as peças coletadas, sem exceção.

A quebra de largura é proposital: sinaliza que ali acabou a leitura de curador
e começou o material bruto.

O bloco de avulsas fecha a página. No lugar das cinco linhas, uma só,
dizendo que são peças que não rimaram com nada e que é onde costuma aparecer
o que ainda não tem nome.

**Peça.** Em repouso, só a imagem. No hover, autor, fonte e ano em mono no
rodapé, com link para o original em nova aba. Clique abre lightbox com a
versão full, que fecha no Esc e no clique fora e navega com as setas.

Peça sem autor é normal e não é erro: mostre só a fonte, sem travessão solto,
sem "autor desconhecido" e sem espaço reservado. O crédito encolhe, a imagem
não muda de tamanho.

**Rodadas anteriores.** Ficam **nesta mesma página**, alcançadas pelo filtro de
mês e de recorte. Não se cria página por rodada: o valor do arquivo é poder
comparar dois meses sem trocar de endereço.

**Rodapé.** Só a assinatura, em display grande e em duas linhas, alinhada à
esquerda como a abertura:

```
FEITO COM AMORZIN.
GAB. =)              ← no acento
```

Fecha a página ecoando a abertura, que também é display em duas linhas com a
segunda no acento. Nada de método, nada de contagem, nada de explicação — isso
tudo vive nos arquivos `.md` do repositório, que é onde se lê método.

## Alinhamento

Abertura, filtros, assinatura e barra fixa **começam todos na mesma linha
vertical**, a 28px da borda (16px no mobile). Nenhum deles usa a largura máxima
que segura os blocos: são elementos de moldura, não de conteúdo, e moldura
centralizada dentro de uma página de imagem cheia lê como desalinho.

## Favicon

`RV` em duas cores: o R na cor do texto, o V no acento.

Três arquivos, porque nenhum formato cobre tudo: `favicon.svg` adapta as cores
ao modo do sistema por `prefers-color-scheme`, `favicon-32.png` cobre quem não
lê SVG — o Safari, entre outros — e `apple-touch-icon.png` cobre a tela de
início do iOS. Os PNG são fixos na paleta clara.

**Link do original.** Pinterest aceita `pinterest.com/pin/<id>/`. **Behance
exige um segmento depois do id**: `behance.net/gallery/<id>/` devolve página não
encontrada, e `behance.net/gallery/<id>/<slug>` abre. Qualquer slug serve, mas
gere um a partir do título — o link fica legível e nunca vem vazio.

## Filtros

A página é o arquivo inteiro, então o filtro é o que a torna navegável.

- **Recorte.** Lista de temas em mono: todos, mobile, trend, e o que mais
  existir. Um por vez.
- **Mês.** Lista dos meses que têm rodada, do mais novo para o mais velho.
  Um por vez, mais a opção de todos.
- **Busca** por texto que casa nome de bloco, as cinco linhas e o título da
  peça.
- **Toggle de emergentes.**

Os quatro se combinam. Recorte e mês em linha própria acima da barra de
blocos, porque são os dois eixos do arquivo e não filtros secundários.

Quando um filtro esvazia a página, diga em mono o que sobrou de fora. Nunca
deixe a tela em branco sem explicação.

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
- **Peça no hover:** sobe 4px e ganha contorno fino no acento. Sem girar,
  sem escalar.
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

Sem fita adesiva, sem alfinete, sem textura de cortiça, **sem imagem girada** e
sem moldura de polaroid. Tudo isso lê como scrapbook dos anos 2000 e envelhece
a ferramenta. Moodboard aqui quer dizer parede de imagem alinhada e densa, não
colagem.

A boldness está no display da abertura, na densidade da varredura inteira e nas
imagens hero. Todo o resto é quieto.
