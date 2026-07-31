# Dashboard: direção de arte e spec

Arquivo único e estático em `docs/index.html`. Sem build, sem framework.
CSS e JS embutidos. Regenerado a cada rodada.

Precisa aguentar 200 imagens e 10 blocos sem travar.

## A tese

O valor da rodada é o agrupamento, e agrupamento só se defende mostrando as
peças juntas. Então a página abre com as peças, não com palavra.

O hero não é título nem estatística: é a **malha completa da varredura**.
Todas as peças aproveitadas, em miniatura, coladas umas nas outras, ocupando
a tela ao carregar. Antes de qualquer palavra, a pessoa vê o conjunto de onde
os blocos foram tirados.

Os blocos abaixo são recortes dessa malha. A malha existe para que o recorte
possa ser conferido: quem duvidar de um bloco rola para cima e olha o resto.

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
--void        #0D0F1A   fundo
--surface     #161A2B   painéis e barras
--edge        #252A3D   divisores
--paper       #E8E6E1   texto principal
--muted       #8A90A6   rótulos, créditos, metadados
--live        #46D6A4   estado ativo e destaque de emergente
```

Fundo escuro porque as peças precisam brilhar e o fundo precisa sumir. O
acento aparece pouco: bloco emergente, filtro ativo, link em hover.

## Tipografia

- **Display:** Bricolage Grotesque, variável. Só nomes de bloco. Grande e pouco.
- **Corpo:** IBM Plex Sans. As cinco frases e o contexto.
- **Dados:** IBM Plex Mono. Rótulos, autor, fonte, contagens, termos derivados.

Rótulo e metadado sempre em mono, e menores que o corpo. É o que faz as cinco
linhas parecerem uma ficha e não um texto.

## Estrutura

**Malha da varredura.** Ocupa a primeira dobra. Miniaturas de 120 a 160px,
gutter de 2px, sem legenda, sem moldura. Corta na dobra sugerindo continuação,
não termina redondo.

Sobreposto num canto, em mono pequeno: recorte da rodada, data, coletadas,
aproveitadas, grupos. Cinco números soltos, sem cartão e sem ícone.

**Barra de blocos.** Fixa ao rolar. Lista horizontal de todos os blocos em
mono, emergentes primeiro e marcados com o acento. Clique salta. Se a lista
não couber, ela rola horizontalmente, sem quebrar em duas linhas.

**Bloco.** Duas colunas assimétricas. À esquerda, um terço: nome em display,
tipo, se o nome é inventado, em quantas fontes apareceu, as cinco linhas e o
link de contexto. Fica fixa enquanto o bloco rola. À direita, as peças em
masonry denso, gutter pequeno, imagens encostando.

Bloco emergente ganha o nome maior e um fio do acento na borda esquerda.
Consolidado vem menor e sem fio. Sem badge colorida, sem etiqueta.

O bloco de avulsas fecha a página. No lugar das cinco linhas, uma só,
dizendo que são peças que não rimaram com nada e que é onde costuma aparecer
o que ainda não tem nome.

**Peça.** Em repouso, só a imagem. No hover, autor, fonte e ano em mono no
rodapé, com link para o original em nova aba. Clique abre lightbox com a
versão full, que fecha no Esc e no clique fora e navega com as setas.

**Rodadas anteriores.** Lista em mono no rodapé, por data e recorte. Cada
rodada é uma página própria em `docs/`, não tudo na mesma.

## Filtros

Busca por texto que casa nome de bloco, as cinco linhas e autor. Um toggle
para mostrar só emergentes. Nada além disso.

## Performance

Não negociável, porque o volume quebra a página se for ignorado.

- Thumbs de até 300px na malha e nos masonries; full só no lightbox
- `loading="lazy"` em tudo abaixo da primeira dobra
- `width` e `height` declarados em toda imagem, para não haver salto de layout
- Masonry em CSS columns ou grid, sem biblioteca de JS
- A malha renderiza progressivamente, não espera tudo carregar

## Movimento

Miniaturas entram em cascata rápida no load, uma vez. Hover acende sem escala.
Contexto expande deslizando. Lightbox abre em fade.

Nada pulsa, nada flutua, sem parallax. `prefers-reduced-motion` desliga tudo
e a página continua inteira.

## Quality floor

- Responsivo até 360px. No mobile a malha vira faixa de altura fixa com
  scroll horizontal e a coluna de defesa vai para cima do masonry
- Foco de teclado visível em peça, bloco, contexto e busca
- Contraste AA no texto
- Alt descrevendo a peça

## O que não fazer

Sem gradiente animado. Sem glassmorphism na interface, que seria usar uma
estética catalogada como decoração da ferramenta que cataloga. Sem contador
animado, sem cartão de estatística, sem parágrafo visível em repouso.

A boldness está na malha de abertura e na densidade. Todo o resto é quieto.
