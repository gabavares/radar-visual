# Radar Visual

Esteira de descoberta visual de Gab Tavares. Varre plataformas de design,
agrupa por tratamento visual e publica um arquivo em `docs/index.html`.

Antes de rodar qualquer fila, leia `INSTRUCOES.md`, `fontes.md` e `dashboard.md`.

## Regra dura: a varredura roda no Chrome do Gab

**Nunca varra pelo navegador interno.** Ele não tem as sessões do Gab, e sem
sessão o campo é outro: o Pinterest devolve muro de login ou resultado raso, e
o Behance passa a servir feed genérico depois de poucas requisições. Uma rodada
feita deslogada parece que funcionou e não funcionou — foi o erro mais caro
deste projeto, e o custo aparece só na etapa 5, quando os grupos não fecham.

As ferramentas são `mcp__claude-in-chrome__*` e vêm adiadas. Carregue-as antes
de tudo, numa chamada só:

```
ToolSearch: select:mcp__claude-in-chrome__list_connected_browsers,mcp__claude-in-chrome__select_browser,mcp__claude-in-chrome__tabs_context_mcp,mcp__claude-in-chrome__navigate,mcp__claude-in-chrome__javascript_tool,mcp__claude-in-chrome__browser_batch,mcp__claude-in-chrome__computer
```

## Etapa 0: conferir o acesso, sempre

Antes da primeira busca, nesta ordem:

1. `list_connected_browsers`. Se vier vazio, **pare** e peça ao Gab para abrir o
   Chrome e reconectar a extensão. Não caia para o navegador interno.
2. `select_browser` com o `deviceId` que voltou.
3. Abra `https://br.pinterest.com/` e confirme que está logado: sem muro de
   login e com avatar de perfil na página. Deslogado, o Pinterest não serve.
4. Abra uma busca no Behance e confirme duas coisas: que há avatar de conta
   Adobe e que o resultado casa com o termo buscado.

### Como saber se o Behance está logado

O sinal confiável é o avatar vindo da Adobe:

```js
!!document.querySelector('img[src*="pps.services.adobe.com/api/profile"]')
```

**Não use texto da barra para isto.** Dois enganos já cometidos e corrigidos:
`Acesse behance.net` é link de topo entre produtos Adobe e aparece logado ou
não; `Experimente grátis` é upsell do Behance Pro e aparece para conta gratuita
logada. Nenhum dos dois distingue coisa alguma.

O sinal de que a busca degradou é outro e vale checar durante a etapa 2: se os
resultados deixarem de casar com o termo e virarem sempre a mesma lista, o
Behance entrou em fallback. O título da página continua trocando certo, então só
o conteúdo denuncia.

Se qualquer passo falhar, **pare e diga**. Rodada deslogada não é rodada menor,
é rodada que mente sobre o campo que varreu.

## Armadilhas já pagas

- **Behance, filtro de tempo.** Nunca passe `&time=` na URL de busca. Com ele o
  Behance devolve o feed da galeria de design gráfico para qualquer termo, com o
  título da página trocando certo e o conteúdo não. Sem o parâmetro, funciona.
- **Behance, link do projeto.** `behance.net/gallery/<id>/` dá página não
  encontrada. Precisa de um segmento depois do id: `/gallery/<id>/<slug>`.
- **Pinterest, atribuição.** A maioria dos pins não tem autor nem link do
  original. Isso não desqualifica a peça — ver `fontes.md`.
- **PowerShell 5.1, JSON.** `ConvertFrom-Json` emite o array como objeto único.
  `@(...)` embrulha tudo num elemento; use `+=` para concatenar manifestos.
- **Scripts gerados.** O `docs/index.html` é gerado por script PowerShell. Salve
  o `.ps1` com BOM UTF-8, senão o 5.1 lê como ANSI e quebra nos acentos.

## Publicação

`docs/` é servido pelo GitHub Pages em https://gabavares.github.io/radar-visual/
O deploy leva alguns minutos e o CDN cacheia: confira com `Cache-Control:
no-cache` antes de concluir que não subiu.
