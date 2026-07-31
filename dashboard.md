# Dashboard: direção de arte e spec

Arquivo único e estático em `docs/index.html`. Sem build, sem framework.
CSS e JS embutidos. Regenerado quando uma prancha nova entra.

## A tese

Isso é um moodboard, então a imagem manda. O texto existe para defender a
imagem, nunca para competir com ela.

A unidade da página é a **prancha**, não a tendência. Alguém abre para
destravar ideia, então a página precisa entregar volume visual rápido e a
leitura só quando a pessoa parar em algo.

O eixo de temperatura da versão anterior sai. Ele classificava estágio de
ciclo com um método que não se sustentou, e manter um elemento gráfico
forte apoiado em dado fraco é mentir com design.

## Paleta

```
--void        #0D0F1A   fundo
--surface     #161A2B   painéis
--edge        #252A3D   divisores
--paper       #E8E6E1   texto principal
--muted       #8A90A6   créditos e metadados
--live        #46D6A4   único acento, usado só em estado ativo
```

Fundo escuro porque as peças precisam brilhar e o fundo precisa sumir.
O acento aparece pouco: filtro ativo, link em hover. Nada mais.

## Tipografia

- **Display:** Bricolage Grotesque, variável. Títulos de prancha e de bloco.
  Grande e pouco.
- **Corpo:** IBM Plex Sans. As três linhas de defesa.
- **Dados:** IBM Plex Mono. Autor, data, contagem de peças.

Metadado sempre em mono. Separa visualmente o fato da interpretação.

## Estrutura

**Topo.** Nome do sistema em display, e em mono o total de pranchas e a data
da última. Sem hero, sem estatística grande. A primeira prancha começa
imediatamente abaixo, porque o conteúdo é o hero.

**Navegação.** Lista horizontal das pranchas por data e título, em mono,
fixa no topo ao rolar. Clique salta para a prancha. Só isso.

**Prancha.** Abre com o título em display e o pedido original em uma linha,
em mono. Depois, os blocos.

**Bloco.** Layout em duas colunas assimétricas. À esquerda, com um terço da
largura, o nome do bloco em display e as três linhas de defesa, fixos
enquanto o bloco rola. À direita, as peças em masonry denso, alturas
desiguais, gutter pequeno.

**Ordem e peso dos blocos.** Blocos emergentes vêm primeiro na prancha, sempre,
e recebem tratamento visual mais forte que os consolidados. Mais forte quer
dizer mais espaço e mais escala: título em corpo maior, coluna de defesa mais
larga, e uma coluna a menos no masonry, o que aumenta cada peça sem mudar o
gutter. O consolidado vem depois, menor e mais apertado.

A diferença é de hierarquia, nunca de rótulo. **Sem badge colorida, sem selo,
sem etiqueta de "novo".** O emergente é o que interessa, e um moodboard mostra
o que interessa dando tamanho a ele, não pendurando um adesivo em cima. Quem
abre a página deve parar no bloco emergente porque ele é maior, não porque
tem uma tarja avisando que é para parar ali.

Se a prancha só tiver consolidados, nada disso aparece e todos os blocos ficam
iguais. A ênfase é comparativa: sem emergente para contrastar, ela não existe.

As imagens encostam umas nas outras. Sem moldura, sem sombra, sem cantos
arredondados. É prancha, não catálogo de produto.

No mobile, a defesa vai para cima do masonry e para de ser fixa.

**Peça.** Em repouso, só a imagem. No hover, autor e ano em mono no rodapé,
com link para o original abrindo em nova aba. Clique amplia em lightbox,
que fecha no Esc e no clique fora.

## Filtros

Busca por texto que casa título de prancha, nome de bloco e texto de defesa.
Nada além disso. Filtro elaborado em moodboard é atrito.

## Movimento

Imagens entram em fade curto conforme aparecem na viewport. Hover rápido,
sem escala. Lightbox abre com fade.

Nada pulsa, nada flutua, sem parallax. `prefers-reduced-motion` desliga
tudo e a página continua inteira.

## Quality floor

- Responsivo até 360px
- Foco de teclado visível em peça, link e busca
- Contraste AA no texto
- Alt descrevendo a peça
- Lazy loading nas imagens, porque prancha tem muita imagem
- A página lê sem JS

## O que não fazer

Sem gradiente animado. Sem glassmorphism na interface, que seria usar uma
estética catalogada como decoração da ferramenta. Sem badge de estágio.
Sem contador animado.

A boldness está no masonry denso e na assimetria da coluna de defesa.
Todo o resto é quieto.
