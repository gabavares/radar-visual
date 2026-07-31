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

## Etapa 2: varredura

**Interrompida.** O acesso deslogado não sustenta a meta de 300 a 500 peças.
Log do que cada fonte devolveu, para a rodada seguinte não repetir o teste.

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
