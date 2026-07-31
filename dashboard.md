# Dashboard: direção de arte e spec

Arquivo único e estático em `docs/index.html`. Sem build, sem framework,
sem dependência externa além das fontes. CSS e JS embutidos.

Regenerado a cada ciclo lendo as fichas em `tendencias/`.

## A tese

A página não é um catálogo alfabético. É um **eixo de temperatura**.

Um designer abre o dashboard e a primeira coisa que ele entende, antes de ler
qualquer palavra, é o que está esquentando e o que já queimou. A posição de uma
tendência na página é o dado mais importante dela, então a estrutura da página
precisa ser o próprio ciclo de vida.

Isso é o oposto de um grid uniforme com badge de status. Badge você lê depois
de já ter olhado errado.

## Paleta

Fundo escuro porque é moodboard: as peças precisam brilhar e o fundo precisa
sumir. Mas o escuro é azul-tinta, não preto neutro.

```
--void        #0D0F1A   fundo da página
--surface     #161A2B   cards e painéis
--edge        #252A3D   bordas e divisores
--paper       #E8E6E1   texto principal, off-white quente
--muted       #8A90A6   texto secundário e créditos
```

A cor de destaque não é uma só. É uma **escala semântica de temperatura**, e
ela codifica o estágio do ciclo em todo lugar que aparece:

```
--nascendo    #3D9DF2   azul frio
--subindo     #46D6A4   verde-água
--auge        #F5C842   amarelo
--saturando   #E8734A   laranja queimado
--morto       #4A4E5C   cinza dessaturado
```

Nenhuma dessas cores é decoração. Se uma cor aparece na tela, ela está
dizendo em que ponto do ciclo aquilo está.

## Tipografia

- **Display:** Bricolage Grotesque, variável. Usar com peso e largura extremos
  nos nomes das tendências e nos títulos de faixa. É a face que carrega
  personalidade, então ela aparece grande e pouco.
- **Corpo:** IBM Plex Sans. Neutra, legível, sem competir com o display.
- **Dados e créditos:** IBM Plex Mono. Autor, data, contagem de evidências,
  slug. Tudo que é metadado vai em mono, o que separa visualmente fato de
  interpretação.

Escala de tipo definida e respeitada. Nada de tamanho arbitrário no meio do
documento.

## Estrutura da página

**Topo: a barra de temperatura.**

Uma faixa horizontal única, dividida em cinco segmentos proporcionais ao número
de tendências em cada estágio, pintada na escala acima. É o hero da página e
substitui qualquer cartão de estatística.

Clicar num segmento filtra a página inteira para aquele estágio. O segmento
ativo ganha peso, os outros recuam.

Ao lado, em mono, apenas a data do último ciclo e o total catalogado.

**Corpo: faixas por estágio.**

Cinco seções na ordem do ciclo, de nascendo a morto. Cada faixa abre com o nome
do estágio em display grande, na cor do estágio, e uma linha em corpo explicando
o que aquele estágio significa na prática para quem vai usar.

Dentro de cada faixa, grade masonry de cards. Alturas desiguais são desejáveis:
é moodboard, não planilha.

Faixa vazia não some, aparece com o vazio declarado. Um estágio sem nenhuma
tendência é informação.

**Card.**

Dominado pela imagem principal da tendência. Sem moldura, sem sombra, sem
cantos muito arredondados. A imagem encosta na borda do card.

Sobre a imagem, no rodapé do card: nome em display, e em mono a contagem de
evidências e o autor da peça em destaque. No hover, a imagem escurece de leve
e o crédito completo aparece.

Uma linha fina na cor do estágio corre no topo do card. É o único elemento
cromático fora da imagem.

**Painel de ficha.**

Clique no card abre painel lateral deslizante com a ficha completa: o que é,
como se faz, de onde veio, onde encaixa, onde não usar.

Dentro do painel, a galeria de refs em masonry. Cada imagem com autor, data e
link para o original, sempre visível, nunca só no hover. Crédito não é
microcópia opcional aqui.

O painel fecha no Esc e no clique fora.

## Filtros

Além da barra de temperatura, um conjunto discreto em mono no topo do corpo:

- Por cliente, lendo os recortes de `vocabulario.md`
- Por bloco do vocabulário, técnica, movimento, tipografia, cor, material,
  fotografia
- Busca por texto, que casa nome e apelidos

Filtros combinam. Estado sem resultado mostra o que foi filtrado e um caminho
de volta, não uma tela morta.

## Movimento

Contido, e a serviço da leitura.

- A barra de temperatura preenche da esquerda para a direita no load, uma vez
- Cards entram em fade curto conforme entram na viewport
- Hover no card é rápido, sem escala exagerada
- Painel desliza, não pisca

Nada pulsa, nada flutua em loop, nada tem parallax. `prefers-reduced-motion`
desliga tudo acima e mantém a página inteiramente funcional.

## Quality floor

- Responsivo até 360px, com as faixas virando scroll horizontal no mobile
- Foco de teclado visível em card, filtro e painel
- Contraste mínimo AA no texto sobre fundo escuro
- Toda imagem com alt descrevendo a peça, não o nome do arquivo
- Página abre e funciona sem JS para leitura básica do conteúdo

## O que não fazer

Sem gradiente de fundo animado. Sem glassmorphism no chrome da interface, que
seria usar uma das tendências catalogadas como decoração da ferramenta que
cataloga. Sem contadores animados. Sem badge colorida redundante com a linha
do card.

A boldness da página está inteira no eixo de temperatura. Todo o resto é
quieto para que ele funcione.
