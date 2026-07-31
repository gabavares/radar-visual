# Radar Visual

Esteira de descoberta visual para a criação da CMLO&CO.

Você roda a fila. Ela varre, captura, cataloga, cruza, agrupa, pesquisa,
nomeia e publica um dashboard denso do que está circulando.

Serve para destravar ideia e para achar o que está crescendo antes de ter nome.

## Dois princípios

**Volume antes de conclusão.** Uma rodada que devolve 400 peças e 15
agrupamentos vale mais que uma que devolve 3 tendências bem provadas. Julgar
é trabalho humano e rápido; varrer é trabalho de máquina e lento. Não
economize na varredura para poupar tempo do humano.

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

**Com recorte**, tipo "setor de mobile". Aí o recorte vira **filtro aplicado
dentro das plataformas, antes de qualquer análise**.

Derive de 15 a 25 termos do universo: categoria de produto, subcategorias,
público, momento de uso, ocasião, concorrentes, materiais, contextos culturais
adjacentes. Para mobile isso vira coisa como lançamento de smartphone,
acessório de celular, packaging de eletrônico, campanha de operadora,
fotografia de produto tech, setup de mesa, cultura gamer mobile, wearables.

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

Use o navegador que renderiza JS. Fetch de HTML puro devolve página vazia na
maioria dessas fontes.

**Meta: 300 a 500 peças coletadas.** Não filtre por assunto aqui. Nesta altura
você ainda não sabe o que procura, e é assim que tem que ser.

Rode em lotes salvando o progresso, para que uma falha no meio não perca a
varredura inteira.

### Etapa 3: capturar a imagem

Três caminhos, nesta ordem de preferência:

1. **Download direto** do arquivo, quando a fonte permite
2. **Screenshot** do elemento na página renderizada, quando o download é
   bloqueado. Resolve Pinterest e boa parte do que trava
3. **Embed** por URL, como último recurso, sabendo que pode quebrar depois

Sempre grave junto: autor, link do original e fonte de onde veio.

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

- Mínimo de 3 autores diferentes por grupo. Dois é coincidência.
- Você precisa descrever o traço compartilhado em **uma frase concreta e
  visual**. Se sair vago, tipo "estética moderna", o grupo é falso. Desfaça.
- Uma peça pode entrar em mais de um grupo.
- Registre em quantas **fontes diferentes** o grupo aparece. Um traço que
  aparece em três plataformas é mais forte que um que só aparece numa.

**Meta: 10 a 20 grupos.** Se fechou 4, agrupou grosso demais. Quebre os
grandes em recortes mais específicos.

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

## Estrutura de pastas

```
radar-visual/
  INSTRUCOES.md
  dashboard.md
  fontes.md
  nomeados.md
  rodadas/
    AAAA-MM-DD-<slug>/
      rodada.md
      refs/
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
