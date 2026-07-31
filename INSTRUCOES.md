# Radar Visual

Sistema de catalogação de tendências de design e linguagem visual para a CMLO&CO.
Alimentado por pesquisa do Claude, sem APIs e sem conexões externas.

## O que este sistema é

Um catálogo vivo de estéticas, técnicas e movimentos visuais, com evidência real,
estágio de ciclo de vida e leitura de onde cada coisa encaixa na carteira de clientes.

Publicado como dashboard estático em GitHub Pages para consulta do time de criação.

## O que este sistema não é

Não é um detector em tempo real. A pesquisa encontra o que já foi publicado,
então o sistema chega depois de quem nomeou a tendência. Isso é uma limitação
conhecida e aceita, não um bug a ser corrigido com mais fontes.

Não é fonte de dado quantitativo. Não existe índice de volume aqui. A evidência
é qualitativa: quem está fazendo, desde quando, quantos.

## Estrutura de pastas

```
radar-visual/
  INSTRUCOES.md        este arquivo
  vocabulario.md       sementes de pesquisa e termos descobertos
  fontes.md            onde pesquisar, em ordem de confiança
  dashboard.md         direcao de arte e spec do HTML
  tendencias/
    <slug>/
      ficha.md
      refs/            imagens salvas, numeradas
  suspeitas.md         candidatas sem evidencia suficiente
  ciclos/
    AAAA-MM/
      briefing.md      o que mudou neste ciclo
  docs/
    index.html         dashboard publicado
    assets/            imagens otimizadas para o dashboard
```

A pasta `docs/` é o que o GitHub Pages serve. Nada fora dela vai para o ar.

## Regra de evidência

Esta é a regra mais importante do sistema. Ela existe porque busca aberta sobre
tendência de design devolve uma montanha de artigo de SEO escrito por agência
vendendo serviço, e esse conteúdo descreve tendências que ninguém pratica.

**Nada entra em `tendencias/` por artigo dizendo que a tendência existe.**

Para uma tendência ser catalogada, a pesquisa precisa encontrar:

- no mínimo 5 peças reais publicadas
- de no mínimo 4 autores ou estúdios diferentes, todos identificados por nome
- cada uma com data e link
- publicadas nos últimos 18 meses

A identificação não é formalidade de catalogação. Sem ela a regra acima é
impossível de verificar, e a reavaliação de estágio do ciclo seguinte teria que
refazer a pesquisa do zero.

**Exceção do Pinterest.** Peça encontrada no Pinterest e não rastreável até o
autor entra mesmo assim, rotulada como não atribuída, e conta para o mínimo de
5 peças. Ela não conta para o mínimo de 4 autores, porque não há como saber se
duas peças não atribuídas são do mesmo estúdio. Os 4 autores precisam ter nome.
A condição completa está em `fontes.md`.

Uma ficha inteira de peças não atribuídas nunca fecha evidência, e isso é
intencional: sem saber quem está fazendo, não dá para classificar estágio.

Artigo de tendência não conta como peça. Ele pode ser citado como contexto na
ficha, mas nunca como evidência.

Se a pesquisa não fechar o mínimo, a candidata vai para `suspeitas.md` com o que
foi encontrado até ali. Suspeitas são revisitadas a cada ciclo e promovidas quando
juntam evidência.

Na dúvida entre catalogar e mandar para suspeitas, manda para suspeitas.
Ficha errada com cara de autoridade é pior que ausência de ficha.

## Critérios de estágio do ciclo

O estágio é o campo mais útil da ficha e o mais fácil de chutar. Use estes
critérios, e escreva na ficha qual deles justificou a classificação.

**Nascendo.** Peças concentradas nos últimos 3 a 4 meses. Poucos autores, quase
sempre estúdios independentes ou artistas. Ainda não tem nome estável, ou tem
nomes concorrentes. Nenhuma publicação de design escreveu sobre.

**Subindo.** De 6 a 12 meses de peças. Número de autores crescendo mês a mês.
Começou a aparecer em publicação de design. O nome está se firmando.

**No auge.** Volume alto e constante. Marcas grandes e agências adotaram.
Já virou pauta de artigo de tendência. Ainda funciona, mas deixou de ser
diferencial de proposta.

**Saturando.** Chegou em template pronto, em banco de imagem e em marca sem
repertório visual. Aparece em listas de "tendências do ano". Usar agora
comunica atraso, não atualidade.

**Morto.** Só aparece em contexto irônico, nostálgico ou de revival explícito.

Um estágio nunca é permanente. Toda ficha é reavaliada no ciclo mensal.

## Formato da ficha

Cada `tendencias/<slug>/ficha.md` segue exatamente esta estrutura:

```markdown
# Nome da tendência

**Também chamada de:** apelidos alternativos, um por comunidade
**Estágio:** nascendo | subindo | auge | saturando | morto
**Classificado em:** AAAA-MM
**Justificativa do estágio:** uma frase citando o critério aplicado

## O que é
Uma frase, em linguagem de designer. Sem adjetivo de marketing.

## Como se faz
A técnica. Software, efeito, processo. O suficiente para o designer
executar, não só reconhecer.

## De onde veio
Origem e, se for revival, de qual período e por que está voltando agora.

## Evidências
- Autor ou estúdio, título da peça, data, link
- Não atribuída, link do pin, encontrada em AAAA-MM
- (mínimo 5 peças, das quais no mínimo 4 com autor identificado e distinto)

## Onde encaixa
Clientes da casa onde faz sentido, com o motivo.

## Onde não usar
Contextos onde vai soar errado ou datado.
```

Escreva o campo "Onde não usar" sempre. Ficha sem ele vira moodboard bonito
e o time usa a tendência no lugar errado.

## Imagens

Salve em `tendencias/<slug>/refs/`, numeradas em sequência, com o nome do autor
no arquivo: `01-nome-do-estudio.jpg`. Peça não atribuída usa `nao-atribuida` no
lugar do nome: `04-nao-atribuida.jpg`.

Redimensione para no máximo 1200px no lado maior antes de copiar para
`docs/assets/`. O repositório precisa continuar leve.

Data e link são obrigatórios em toda peça salva, e autor é obrigatório sempre
que for rastreável. A razão é funcional antes de ser qualquer outra coisa: a
regra de evidência exige 4 autores identificados, e a classificação de estágio
depende de saber quem está fazendo e desde quando.

Peça não atribuída carrega o rótulo, o link do pin e a data em que foi
encontrada. O rótulo é obrigatório: não saber quem fez é um fato sobre a peça,
e apagar esse fato é o que transforma o catálogo em moodboard.

O repositório é público. As peças são referência de repertório para o time,
e cada uma aparece no dashboard com autor e link para o original, de forma
discreta. Nada daqui vai para deck de cliente ou peça publicada.

## Fluxo de trabalho

### Bootstrap (uma vez)

Rode em blocos de no máximo 5 tendências por vez. A rodada completa consome
muito contexto e a qualidade cai se tentar fazer tudo de uma vez.

Para cada semente em `vocabulario.md`:
1. Pesquise o termo e seus apelidos alternativos
2. Colete peças reais, aplicando a regra de evidência
3. Salve as imagens
4. Classifique o estágio pelos critérios acima
5. Escreva a ficha
6. Se não fechou evidência, registre em `suspeitas.md` e siga

Ao terminar cada bloco, pare e reporte o que entrou e o que caiu para suspeitas.

### Ciclo mensal

1. Reavalie o estágio de cada ficha existente. Estética se move, e uma ficha
   parada há três meses provavelmente está errada.
2. Revisite `suspeitas.md` e promova o que juntou evidência.
3. Pesquise termos novos a partir da expansão: o que apareceu junto das
   tendências existentes e ainda não está no vocabulário.
4. Escreva `ciclos/AAAA-MM/briefing.md` com o que mudou: entrou, subiu de
   estágio, saturou, morreu. O briefing é curto, no máximo uma página.
5. Regenere o dashboard conforme `dashboard.md`.
6. Commit e push.

## Publicação

O dashboard vive em `docs/index.html` e é servido pelo GitHub Pages a partir
da branch `main`, pasta `/docs`.

Depois de regenerar:

```
git add .
git commit -m "ciclo AAAA-MM"
git push
```

A URL não muda nunca. O time salva uma vez e nunca mais precisa procurar link.
