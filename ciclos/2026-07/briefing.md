# Ciclo 2026-07 — bootstrap, bloco 1 (parcial)

Primeira rodada do sistema. Cinco sementes do bloco 1 de `vocabulario.md`:
pixel stretch, pixel sorting, halftone, dithering, chrome.

## O que mudou

**Entrou:** halftone (saturando), pixel stretch (saturando).

**Foi para suspeitas:** pixel sorting, dithering, chrome.

Nenhuma ficha existente para reavaliar, nenhuma promoção de suspeita, primeira
rodada.

## Leitura do bloco

As duas que fecharam evidência fecharam em "saturando", pelo mesmo critério:
template pronto em circulação. Isso não é coincidência do bloco, é do método de
busca. Procurar uma técnica pelo nome no Behance encontra primeiro quem a
nomeia — e quem nomeia uma técnica no título é quem vende pacote dela ou quem
está fazendo exercício de aprendizado. Estúdio aplicando a técnica em trabalho
de cliente raramente coloca o nome da técnica no título do projeto.

Consequência prática: **este método tem viés para detectar saturação e é cego
para "nascendo".** Uma técnica em estágio inicial, ainda sem nome estável, é
justamente a que a busca por nome não acha. O ciclo mensal precisa de uma
segunda via de descoberta que não dependa do termo, ou o radar só vai catalogar
o que já passou do ponto.

## Limitação de fonte deste ciclo

Das 11 fontes de Camada 1 em `fontes.md`, só o **Behance** foi utilizável:

| Fonte | Situação |
|---|---|
| Behance | funcionou, via navegador; busca é client-side |
| Dribbble | renderizado por JS, devolveu página vazia |
| Pinterest | busca devolveu tutorial e conteúdo de Camada 3, nenhuma peça atribuível |
| Are.na | busca sem resultado para os termos do bloco |
| Fonts In Use | busca ignorou o parâmetro; destaques são de 1995 a 2022 |
| The Brand Identity | domínio não resolveu (DNS) — verificar se mudou de endereço |
| Brand New | acessível e com data e estúdio, mas indexado por marca e não por técnica, e as imagens são de assinante |
| Awwwards, Siteinspire, Cargo, Readymag, Instagram | não testados neste ciclo |

Toda a evidência das duas fichas vem de uma fonte só. O Behance enviesa para
designer individual em vez de estúdio, o que provavelmente explica a ausência de
trabalho de cliente na amostra de pixel stretch. Isso está anotado nas duas
fichas.

## Método que funcionou, para reuso

1. Busca no Behance pelo navegador, não por fetch de HTML — o servidor ignora o
   parâmetro de busca e devolve o feed global do dia. Cair nisso teria catalogado
   projeto aleatório como evidência.
2. ID de projeto alto (acima de ~240 milhões) indica peça dentro da janela de
   18 meses. Serve como filtro barato antes de abrir cada projeto.
3. Data, autor e imagens saem do JSON embutido na página do projeto
   (`beconfig-store_state`).
4. **Verificação visual é obrigatória e derrubou muita coisa.** O primeiro módulo
   de um projeto no Behance costuma ser capa ou mockup, onde a técnica não é
   legível — é preciso abrir módulos internos. De 21 candidatas abertas, 10 foram
   descartadas por não mostrarem a técnica que o título prometia.

## Para o próximo ciclo

- Terminar o bloco 1: faltam 11 sementes.
- Resolver o endereço da The Brand Identity.
- Separar "chrome" de "glossy 3D" no vocabulário: hoje a busca mistura os dois e
  desperdiça verificação.
- Decidir se datamosh sai de baixo de pixel sorting e vira semente própria.
- Encontrar uma via de descoberta que não dependa do nome da técnica, para o
  radar deixar de ser cego para o estágio "nascendo".
