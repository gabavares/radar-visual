# Mobile

**Recorte:** setor de mobile
**Termos derivados:** ver etapa 1, abaixo
**Fontes varridas:** a preencher na etapa 2
**Coletadas:** — | **Aproveitadas:** — | **Grupos:** —

---

## Etapa 1: o campo

Recorte fechado, então o campo não são as páginas de curadoria cruas: são as
plataformas com o recorte aplicado como busca e como filtro de categoria. As
páginas de curadoria continuam entrando, filtradas pelo recorte onde a
plataforma deixa.

### Termos derivados

Todos são termo de universo. Nenhum descreve efeito visual.

**Produto e subcategoria**

1. lançamento de smartphone
2. celular dobrável
3. capa e case de celular
4. fone sem fio
5. carregador e power bank
6. smartwatch e wearable
7. packaging de eletrônico

**Mercado, marca e varejo**

8. campanha de operadora de telefonia
9. plano pré-pago e recarga
10. loja de celular e varejo de telefonia
11. rebrand de marca de tecnologia
12. lançamento de aplicativo

**Público e momento de uso**

13. fotografia de produto tech
14. setup de mesa
15. unboxing de eletrônico
16. cultura gamer mobile
17. e-sports de celular
18. creator de conteúdo vertical
19. carteira digital e pagamento por aproximação

**Contexto cultural adjacente**

20. techwear e moda técnica
21. tech asiático de consumo
22. celular antigo e nostalgia de flip phone
23. música e streaming no celular

23 termos. A faixa pedida é 15 a 25.

### Onde cada termo é aplicado

| Fonte | Porta | Como o recorte entra |
|---|---|---|
| Behance | busca + galerias por disciplina | termos na busca, filtro de campo criativo em Graphic Design, Advertising, Packaging, Branding e Industrial Design, período recente |
| Pinterest | busca + relacionadas | termos na busca; a partir de cada peça que agrupar bem, puxar as relacionadas |
| Awwwards | busca + categoria | categorias de tecnologia e mobile, mais os termos na busca |
| Are.na | busca + canal | termos na busca e canais que já colecionam o universo |
| Siteinspire | filtro por tipo e estilo | tipo tecnologia, cruzado com os termos |
| Segunda linha | home e recentes | Brand New, Fonts In Use, It's Nice That, AIGA Eye on Design e Creative Review lidos com o recorte por cima, sem busca própria |

Fora do `fontes.md`, o recorte pede ir onde este universo vive: prêmios de
design de produto e de publicidade na categoria tecnologia, publicações
especializadas em telecom e eletrônico de consumo, e contas de marca do setor.
O que for efetivamente usado é registrado na etapa 2 e volta para o
`fontes.md`.

### Por que estes termos e não outros

O protocolo proíbe termo de técnica na entrada, e a razão está registrada no
`fontes.md`: quem escreve o nome da técnica no título é quem vende action e
pacote. "Setor de mobile" também não serve sozinho como busca — devolve
mockup de tela e template de app, que é exatamente o descarte da etapa 4.

Os 23 acima cobrem quatro eixos de propósito. Produto e subcategoria trazem a
peça de lançamento e a embalagem, que é onde tratamento novo aparece primeiro
porque o orçamento é alto. Mercado e varejo trazem a campanha de operadora, que
é o oposto: volume, pressa e estética de massa, e serve de contraprova. Público
e momento trazem o conteúdo que não é anúncio, que é onde a estética costuma
nascer antes de a marca adotar. Contexto cultural adjacente é a folga
deliberada: techwear e nostalgia de flip phone não são mobile, mas é de onde o
setor tem puxado repertório, e sem eles a varredura fica presa no que a
categoria já sabe fazer.

---

## Etapa 2: varredura — segunda tentativa, com sessão

Com a extensão do Chrome e a sessão do Gab, o acesso destravou. Números brutos:

| Fonte | Porta | Termos | Peças |
|---|---|---|---|
| Pinterest | busca, logado | 23 de 23 | **1090** |
| Behance | busca, `sort=recommended` | 6 | 672 |
| Behance | busca, `sort=published_date` | 5 | 600 |

**2362 peças brutas.** A meta de 300 a 500 foi superada com folga. O problema
da rodada não é volume: é o que tem dentro do volume.

### O parâmetro que quebrava a busca do Behance

Registrado para não custar de novo: `&time=year` ou `&time=month` na URL de
busca faz o Behance devolver o feed da galeria de design gráfico em vez do
resultado, com o título da página trocando corretamente e o conteúdo não. Sem o
parâmetro, a busca funciona. Não é bloqueio, é bug de fallback silencioso.

## Etapas 3 e 4: capturar e olhar

Oito folhas de contato montadas e examinadas, 30 imagens cada: 5 de Pinterest
(150 peças) e 3 de Behance (90 peças). O que as folhas mostraram derruba a
rodada, e é isto que precisa ficar registrado.

### Achado 1: termo de universo de produto devolve comércio, não peça aplicada

Nas folhas de `power bank packaging`, `wireless earbuds campaign`, `phone case
packaging design` e `smartwatch campaign design`, a esmagadora maioria é
listagem de marketplace e foto de produto de e-commerce: caixa de power bank
genérica, fone em fundo cinza, capa de celular em blister. É exatamente o que o
`fontes.md` manda descartar sem ler.

O `INSTRUCOES.md` proíbe termo de técnica porque ele devolve quem vende action.
Esta rodada descobre o irmão do problema: **termo de universo de produto
devolve quem vende o produto**. Categoria de produto no Pinterest cai no índice
de compras, não no de design. Os termos que devolveram peça aplicada foram os
de linguagem de design e de cultura — `tech brand identity`, `mobile esports
branding`, `techwear graphic design`, `music streaming campaign design`,
`flip phone y2k aesthetic`.

Correção para a próxima rodada com recorte: derivar os termos do universo, como
manda a etapa 1, mas **qualificar cada um com o registro da peça** — identidade,
cartaz, campanha, embalagem, capa — em vez de deixar o nome do produto sozinho.

### Achado 2: nenhum dos dois sorts do Behance serve a radar

`sort=recommended` sem filtro de tempo ordena por acumulado histórico e devolve
acervo de 2014 a 2016: OnePlus 2, Xolo, Coolpad, capa de iPhone 5, embalagem
Belkin. `sort=published_date` devolve o que subiu ontem, que é sobretudo kit de
social media, peça gerada por IA e material de curso. Um tem qualidade sem
recência, o outro recência sem qualidade, e o filtro de tempo que resolveria
está quebrado (achado acima).

### Achado 3: o que trava a etapa 5 de verdade — autoria

Dos 1090 pins do Pinterest, **106 têm qualquer link de saída. 10%.** E os
domínios mais frequentes entre esses 106 são `s.shopee.com.br` e sites de
reserva de hotel — comércio, não criador.

Isso significa que cerca de 90% do volume da rodada não tem autor nem link do
original, e a etapa 3 manda gravar os dois sempre. Pior: a etapa 5 exige
**mínimo de 3 autores diferentes por grupo**, com a justificativa de que dois é
coincidência. Sem autor não há como verificar essa regra. Um grupo montado com
peças sem atribuição não é um agrupamento fraco — é um agrupamento que não pode
ser auditado, e a regra dos 3 autores existe exatamente para impedir isso.

O `fontes.md` admite Pinterest como fonte inclusive sem atribuição, e isso
segue valendo para uma peça isolada que entra num grupo sustentado por outras
com autoria. Não vale para um grupo inteiro.

## Etapa 5: não executada

Interrompida antes de agrupar, por decisão de método e não por falta de
material. Agrupar 240 peças examinadas em que 90% não tem autor produziria
blocos que a própria regra dos 3 autores rejeita, e o dashboard os exibiria com
a mesma cara de bloco verificado. Ver a conversa com o Gab para a decisão.

---

## Log da primeira tentativa, deslogada

Mantido como registro. O acesso deslogado não sustentava a rodada.

| Fonte | Porta testada | Resultado |
|---|---|---|
| Behance | busca por termo | funcionou na 1ª consulta (24 peças reais de lançamento de smartphone). A partir da ~12ª requisição passou a devolver o feed da galeria de design gráfico para **qualquer** termo, com o título da página trocando e o conteúdo não. Bloqueio brando, persistiu depois de espera |
| Behance | galerias de curadoria | continuam renderizando normalmente. É a busca que está gated, não o site |
| Behance | HTTP fora do navegador | js challenge e depois 403. Sem caminho |
| Are.na | busca por termo, deslogado | o parâmetro da URL não é aplicado em carga direta: devolve `10k results for "*"` e lista canais, não blocos. Baixo rendimento sem sessão |
| Siteinspire | explore | renderiza, ~70 peças por carga. Mas o filtro de categoria na URL não é honrado e o acervo é screenshot de site — um registro visual só |
| Awwwards | busca e indicados | renderiza. Volume modesto e também só web |
| Pinterest | busca com recorte | **não tentado.** Exige sessão logada, que o navegador interno não tem |

### Por que isto trava a rodada e não é contornável afrouxando

O recorte da etapa 1 tem que entrar como **busca e filtro dentro das
plataformas**, antes de qualquer análise. No Behance, que é o volume da esteira,
o mecanismo do recorte é exatamente a busca — e é exatamente a busca que caiu.
As páginas de curadoria dele seguem de pé, mas curadoria sem filtro é rodada
aberta, não rodada de mobile.

O que sobra deslogado — Siteinspire e Awwwards — é web design. Agrupar em cima
disso devolveria blocos de tratamento de site, que é uma fatia do setor e não o
setor. E o `fontes.md` registra o Pinterest como a fonte mais produtiva da
esteira justamente pela mecânica de relacionadas, que é o que faz a rima
aparecer na etapa 5. Sem ele o cruzamento perde a perna principal.

Rodar assim mesmo entregaria talvez 80 a 120 peças de um registro visual só. O
protocolo abre dizendo que uma rodada de 400 peças e 15 agrupamentos vale mais
que uma de 3 tendências bem provadas. O inverso disto não é uma rodada menor: é
uma rodada que mente sobre o campo que varreu.
