# Radar Visual

Esteira de descoberta visual de Gab Tavares.

Você roda a fila. Ela varre, captura, cataloga, cruza, agrupa, pesquisa,
nomeia e publica um dashboard denso do que está circulando.

Serve para destravar ideia e para achar o que está crescendo antes de ter nome.

## Dois princípios

**Agrupamento antes de volume.** O produto da rodada é o agrupamento: imagens
que compartilham tratamento, o estilo identificado e catalogado. Varrer é o
meio, não o fim. Uma varredura rasa e bem agrupada vale mais que uma funda e
mal olhada, porque o que trava a esteira nunca foi achar imagem — é reconhecer
o que se repete entre elas.

Isto substitui a regra anterior, que pedia 300 a 500 peças por rodada. O teste
de mobile mostrou por que: 2362 peças brutas não produziram um agrupamento a
mais que a primeira página teria produzido, e a maior parte do volume era
listagem de comércio. Volume alto não melhora o agrupamento, só aumenta o que
precisa ser descartado.

**Termo de universo, nunca termo de técnica.** Se a rodada tiver recorte,
derive os termos do território, do produto e do público. Nunca de efeito
visual. Buscar o nome de uma técnica devolve quem vende action e pacote,
porque é quem escreve o nome da técnica no título. Buscar o universo devolve
trabalho aplicado, e é da peça aplicada que se extrai a técnica.

## A esteira

### Etapa 1: definir o campo

A rodada vem de um jeito ou de outro, e isso muda **onde** você varre.

**Sem recorte.** O campo são as páginas de tendência, curadoria e destaque
das plataformas, listadas em `fontes.md`. Best of Behance, home do Pinterest,
site do dia do Awwwards, explore do Are.na. Nenhuma busca. O que essas
páginas mostram já é o resultado de uma curadoria, editorial ou algorítmica,
e é exatamente o sinal que interessa quando não há tema.

Toda rodada sem termo de busca e sem foco entra no recorte **`trend`**. É o
nome fixo dessa modalidade: quando o pedido for "roda sem termo" ou "vê o que
está acontecendo", o recorte é `trend`, sempre, para o arquivo poder comparar
uma leitura aberta com a seguinte.

O recorte `trend` também aceita rodada com termo, inclusive a palavra `trend`,
quando for isso que o Gab pedir. Nenhum termo é proibido nesta esteira: o que
existe é registro do que cada um costuma devolver, no `fontes.md`, para a
expectativa ficar calibrada antes de rodar.

**Com recorte**, tipo "setor de mobile". Aí o recorte vira **filtro aplicado
dentro das plataformas, antes de qualquer análise**.

Derive de 3 a 5 termos largos, que nomeiem o território de frente. Para mobile
isso é `mobile`, `mobile phone`, `smartphone launch`. Termo largo devolve o que
a plataforma considera melhor naquele território, que é o material de onde sai
agrupamento.

**Não desça para nome de categoria de produto.** `power bank packaging`,
`wireless earbuds campaign`, `phone case` e afins caem no índice de compras e
devolvem listagem de marketplace e foto de produto de e-commerce. É o irmão do
problema do termo de técnica: termo de técnica devolve quem vende action, termo
de categoria de produto devolve quem vende o produto. Os dois contaminam o
agrupamento com peça que não foi feita para comunicar.

Aplique esses termos como busca e como filtro de categoria nas plataformas.
As páginas de curadoria continuam entrando, mas filtradas pelo recorte quando
a plataforma permite. Só depois de o campo estar filtrado a análise começa.

Escreva os termos derivados no relatório da rodada. Eles são rastro de método
e é como se corrige o campo na rodada seguinte se ele vier torto.

Nunca peça termos ao usuário. Ele pede a fila, você deriva o campo.

### Etapa 2: varredura

Percorra o campo definido na etapa 1, página por página.

Você tem liberdade para usar fontes fora do `fontes.md` se elas servirem
melhor ao recorte. Registre quais usou.

### Etapa 0: conferir o acesso

**A varredura roda no Chrome do Gab, pela extensão, sempre.** Não é preferência
nem otimização: é a diferença entre varrer o campo e varrer uma versão pobre
dele. O passo a passo da conferência está no `CLAUDE.md`.

Confira antes da primeira busca. Se não houver navegador conectado, ou se o
Pinterest aparecer deslogado, **pare e avise**. Nunca caia para o navegador
interno para "pelo menos entregar alguma coisa": rodada deslogada não é rodada
menor, é rodada que mente sobre o campo que varreu, e o custo só aparece na
etapa 5, quando os grupos não fecham.

Isto foi aprendido caro. A primeira tentativa desta esteira rodou deslogada,
travou na etapa 2 e o log está em `rodadas/2026-07/2026-07-31-mobile/rodada.md`.

Fetch de HTML puro não substitui: devolve página vazia na maioria dessas fontes,
e no Behance devolve js challenge e depois 403.

**Meta: a primeira página de cada fonte, e só.** Sem scroll infinito, sem
paginar. O que a plataforma põe na primeira página já é o resultado da
ordenação dela, e é esse o corte que interessa. Na prática dá algo entre 100 e
200 peças somando as fontes.

**Não persiga recência.** Pegue o que a fonte considera melhor, não o que subiu
ontem. Ordenação por data devolve kit de social media e peça gerada por IA;
ordenação por relevância devolve trabalho que sustentou atenção, mesmo que
tenha alguns anos. Estilo não vence por ser novo, vence por se repetir.

Não filtre por assunto aqui. Nesta altura você ainda não sabe o que procura, e
é assim que tem que ser.

### Etapa 3: capturar a imagem

Três caminhos, nesta ordem de preferência:

1. **Download direto** do arquivo, quando a fonte permite
2. **Screenshot** do elemento na página renderizada, quando o download é
   bloqueado. Resolve Pinterest e boa parte do que trava
3. **Embed** por URL, como último recurso, sabendo que pode quebrar depois

Grave o que a fonte der: autor **quando houver**, link do original e fonte de
onde veio. Peça sem crédito entra do mesmo jeito.

Não gaste tempo caçando autoria. Se o nome não veio na listagem, siga. A imagem
é o material da esteira; o crédito é metadado, e metadado ausente não invalida
o que a peça mostra. Vale abrir um projeto para pegar o nome só quando ele
estiver ali à mão, nunca como etapa obrigatória.

### Etapa 4: olhar e catalogar

Monte folhas de contato de 20 a 30 imagens e **examine cada folha**.

Descarte o que não comunica: capa, mockup vazio, foto de perfil, banner,
pacote de asset à venda. No teste anterior isso derrubou metade das
candidatas e estava certo em todas. Se uma peça parecer interessante mas a
capa não mostrar nada, abra um módulo interno antes de descartar.

Para cada peça que fica, registre o que você **vê**: tratamento de cor,
tipografia, textura, composição, tratamento de imagem, materialidade.
Descrição visual concreta, não adjetivo. É esse registro que torna o
agrupamento possível.

### Etapa 5: cruzar e agrupar

A etapa que define a qualidade da rodada inteira.

**Agrupe por tratamento visual, nunca por assunto ou categoria de peça.**
"Peças de embalagem" não é agrupamento. "Embalagem, cartaz e capa de disco
que compartilham tipografia condensada esmagada contra a margem" é.

Regras:

- Mínimo de 3 peças de origens distintas por grupo. Dois é coincidência, e
  três variações do mesmo projeto também. **Origem, não autoria:** o que não
  pode é o grupo inteiro sair de uma mesma campanha, série ou prancha. Peça sem
  crédito conta normalmente — o que sustenta o grupo é a repetição do
  tratamento, não a lista de nomes.
- Nunca descarte peça forte por falta de autor. Imagem interessante sem crédito
  vale mais para a esteira que imagem morna assinada.
- Você precisa descrever o traço compartilhado em **uma frase concreta e
  visual**. Se sair vago, tipo "estética moderna", o grupo é falso. Desfaça.
- Uma peça pode entrar em mais de um grupo.
- Registre em quantas **fontes diferentes** o grupo aparece. Um traço que
  aparece em três plataformas é mais forte que um que só aparece numa.

**Meta: 4 a 8 grupos.** Com varredura de primeira página é essa a faixa
honesta. Se fechou 2, agrupou grosso demais: quebre os grandes em recortes mais
específicos. Se passou de 10, provavelmente está separando por assunto sem
perceber — releia se o traço de cada um é mesmo visual.

**O que não agrupou não se joga fora.** Peça visualmente forte que não casou
com nada vira bloco de avulsas. É frequentemente onde mora o que está
nascendo, porque coisa nova ainda não tem com o que rimar.

### Etapa 6: pesquisar e nomear

Só agora a busca por termo de técnica entra, e só para os grupos já formados.

Para cada grupo, pesquise de verdade: existe nome consagrado para isso? De
onde veio? É revival, de qual período? Que estúdio ou peça puxou a fila?
Alguém já escreveu sobre? Por que está ressurgindo agora, em que contexto
cultural ou tecnológico?

Se não achar nome, **invente um** que descreva o tratamento e marque como
inventado. Estética nascendo não tem nome, e esperar o nome aparecer é como
se chega atrasado.

Classifique cada grupo:

- **Consolidado.** Tem nome, aparece em muita peça, já virou pauta.
- **Emergente.** Poucas peças, autores que não se conhecem, sem nome estável.
  **É isto que interessa.**

Na dúvida, é emergente.

Registre em `nomeados.md` o que já foi nomeado, para as rodadas seguintes
saberem o que é novo.

## Saída da rodada

`rodadas/AAAA-MM-DD-<slug>/rodada.md`:

```markdown
# Título da rodada
**Recorte:** aberta | setor X
**Termos derivados:** lista da etapa 1, se houve recorte
**Fontes varridas:** lista, incluindo as fora do fontes.md
**Coletadas:** N | **Aproveitadas:** N | **Grupos:** N

## Nome do bloco
**Tipo:** emergente | consolidado | avulsas
**Nome:** consagrado | inventado nesta rodada
**Fontes:** em quantas apareceu

**O que é:** o traço visual compartilhado, em uma frase concreta
**De onde vem:** origem e período, em uma frase
**Por que agora:** o gatilho, em uma frase
**Onde encaixa:** clientes ou categorias, em uma frase
**Onde não:** em uma frase

**Contexto:** um parágrafo de até 6 linhas com o que a pesquisa da etapa 6
levantou. Este é o único texto longo da ficha, e no dashboard ele fica
recolhido.

- refs/01-autor.jpg | Autor | fonte | link
```

As cinco linhas curtas são o que aparece no dashboard. Cada uma é **uma frase
só**, e frase curta. Se você precisar de duas, o resto vai para o contexto.

Escreva o "onde não" sempre. É o que separa prancha útil de mural bonito.

## O arquivo acumula

**Rodada nova nunca substitui rodada velha.** O `docs/index.html` é o arquivo
inteiro, não o relatório da última rodada. Cada rodada acrescenta blocos, e o
que já estava lá continua servido.

As rodadas são agrupadas por **mês**, e é por mês e por recorte que a página
filtra. Isso existe para dar leitura de série: o mesmo recorte em dois meses
diferentes mostra o que entrou e o que saiu de circulação, que é a única forma
de a esteira medir movimento em vez de fotografar um instante.

Ao regenerar a página, leia **todas** as rodadas em `rodadas/` e monte tudo.
Nunca gere só a rodada corrente, e nunca apague peça de rodada anterior.

## Estrutura de pastas

```
radar-visual/
  INSTRUCOES.md
  dashboard.md
  fontes.md
  nomeados.md
  rodadas/
    AAAA-MM/                    mês, é como o arquivo agrupa
      AAAA-MM-DD-<slug>/
        rodada.md
        refs/         imagem por peça, nomeada com o bloco

  docs/
    index.html
    assets/
      full/          até 1200px
      thumb/         até 300px
```

## Publicação

A malha e os masonries usam as thumbs. O lightbox usa a full. Sem essa
separação a página não aguenta o volume que a esteira produz.

```
git add . && git commit -m "rodada <slug>" && git push
```
