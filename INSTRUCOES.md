# Radar Visual

Esteira de descoberta visual para a criação da CMLO&CO.

Varre as páginas de descoberta das fontes, baixa o que está circulando,
olha tudo, agrupa por repetição visual e devolve uma prancha com defesa.

Serve para destravar ideia e para achar o que está crescendo antes de ter nome.

## A inversão que define o sistema

**Você não fornece termos. A esteira devolve os termos.**

Buscar por nome de técnica só acha o que já foi nomeado, e uma coisa só ganha
nome depois de estourar. Por isso o método antigo classificava tudo como
saturado: ele era estruturalmente incapaz de ver o que está nascendo.

A esteira faz o caminho contrário. Coleta primeiro, olha depois, agrupa por
tratamento visual, e só no fim vai atrás de saber se aquele agrupamento tem
nome. Se não tiver, batiza.

Nome é saída, nunca entrada.

## O que é e o que não é

É ponto de partida de criação. Uma prancha boa faz alguém ter uma ideia que
não teria sozinho.

Não é inteligência de mercado. Não prova tendência nem mede volume. Não
existe regra de quórum, janela de tempo ou mínimo de peças para nada.

## A esteira

Cinco etapas. Rode nesta ordem, sem pular.

### 1. Varredura

Abra as páginas de descoberta listadas em `fontes.md`. São páginas de
tendência, destaque, curadoria e home, não campos de busca.

Colete de 120 a 200 peças recentes, com autor, link e imagem. Não filtre por
assunto, não filtre por categoria, não filtre por nada. Nesta etapa você não
sabe o que procura, e é assim que tem que ser.

Use o navegador que renderiza JS. Fetch de HTML puro devolve página vazia
na maioria dessas fontes.

### 2. Baixa e olha

Baixe todas. Monte folhas de contato de 20 a 30 imagens cada e **examine
cada folha**.

Descarte o que não comunica: capa, mockup vazio, foto de perfil, pacote de
asset à venda. No bootstrap isso derrubou metade das candidatas e estava
certo em todas.

Quando uma peça parecer interessante mas a imagem de capa não mostrar nada,
abra um módulo interno do projeto antes de descartar.

### 3. Agrupa

Esta é a etapa que define a qualidade da prancha inteira.

**Agrupe por tratamento visual, nunca por assunto ou categoria de peça.**
"Peças de embalagem" não é um agrupamento. "Embalagem, cartaz e capa de disco
que compartilham tipografia condensada esmagada contra a margem" é.

Regras do agrupamento:

- Mínimo de 3 autores diferentes. Dois é coincidência.
- Você precisa conseguir descrever o traço compartilhado em **uma frase
  concreta e visual**. Se a descrição sair vaga, tipo "estética moderna" ou
  "vibe minimalista", o agrupamento é falso. Desfaça.
- Uma peça pode entrar em mais de um grupo.
- O que não agrupar, descarte sem dó.

Depois de formar os grupos, classifique cada um em:

- **Consolidado:** você reconhece, tem nome, aparece em muita peça. O Gab
  provavelmente já sabe. Entra na prancha, mas discreto.
- **Emergente:** aparece em poucas peças, de autores que não se conhecem, e
  não tem nome estável. **É isto que interessa.** Entra em destaque.

Na dúvida entre os dois, é emergente. O custo de mostrar algo que ele já
conhecia é baixo. O custo de esconder o que está nascendo é o projeto inteiro.

### 4. Nomeia e pesquisa

Só agora a busca por termo entra, e só para os grupos já formados.

Para cada grupo: existe nome consagrado para isso? De onde veio? É revival?
Alguém já escreveu sobre?

Se não achar nome, **invente um** que descreva o tratamento. Estética
nascendo não tem nome, e esperar o nome aparecer é como se chega atrasado.
Marque o nome inventado como tal.

Registre em `nomeados.md` o que a esteira já nomeou, para as rodadas
seguintes saberem o que é novo e o que já passou por aqui.

### 5. Monta a prancha

De 3 a 6 blocos, emergentes primeiro.

`pranchas/AAAA-MM-DD-<slug>/prancha.md`:

```markdown
# Título da prancha
**Rodada:** varredura aberta | tema: X | brief: cliente Y
**Data:** AAAA-MM-DD

## Nome do bloco
**Tipo:** emergente | consolidado
**Nome:** consagrado | inventado nesta rodada

O traço visual compartilhado, em uma frase concreta.
Por que funciona agora.
Onde encaixa, e onde não.

- refs/01-autor.jpg | Autor | link
- refs/02-autor.jpg | Autor | link
```

Escreva o "onde não" sempre. É o que separa prancha útil de mural bonito.

## Modos de rodada

**Varredura aberta.** O padrão. Sem tema nenhum, a esteira roda inteira e
devolve o que estiver circulando.

**Com tema.** A varredura acontece igual, mas nas páginas de descoberta da
categoria correspondente. O agrupamento continua sem termo.

**Com briefing.** Varredura aberta, e no bloco de defesa a leitura de encaixe
é escrita contra o brief do cliente.

Em nenhum modo o usuário fornece termos de busca.

## Estrutura de pastas

```
radar-visual/
  INSTRUCOES.md
  dashboard.md
  fontes.md           páginas de descoberta, com URL
  nomeados.md         o que a esteira já nomeou
  pranchas/
    AAAA-MM-DD-<slug>/
      prancha.md
      refs/
  docs/
    index.html
    assets/
```

## Publicação

Imagens em no máximo 1200px no lado maior antes de ir para `docs/assets/`.

```
git add . && git commit -m "prancha <slug>" && git push
```
