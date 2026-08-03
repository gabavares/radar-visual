# Gera docs/index.html a partir de gerador/pecas.json e gerador/blocos.json.
#
#   powershell -ExecutionPolicy Bypass -File gerador\build.ps1
#
# ATENCAO: este arquivo precisa estar salvo em UTF-8 COM BOM. Sem BOM o
# PowerShell 5.1 le como ANSI e quebra em todo acento.
#
# Para acrescentar uma rodada: acrescente as pecas em pecas.json e o bloco em
# blocos.json, baixe as imagens para docs/assets/{full,thumb} com o mesmo nome
# do campo file, e rode este script. Ele monta o arquivo inteiro, nunca so a
# rodada nova.

Add-Type -AssemblyName System.Drawing
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = Split-Path -Parent $here
$pecas  = Get-Content (Join-Path $here 'pecas.json')  -Raw -Encoding UTF8 | ConvertFrom-Json
$blocks = Get-Content (Join-Path $here 'blocos.json') -Raw -Encoding UTF8 | ConvertFrom-Json

function Slug($x){ $v=([string]$x).ToLower(); $v=$v -replace '[^a-z0-9]+','-'; $v=$v.Trim('-'); if(-not $v){$v='x'}; if($v.Length -gt 60){$v=$v.Substring(0,60).Trim('-')}; return $v }
function E($s) { if ($null -eq $s) { return "" }; return ([string]$s).Replace('&','&amp;').Replace('<','&lt;').Replace('>','&gt;').Replace('"','&quot;') }

# so entra peca que tem imagem em disco; a dimensao sai do arquivo
$pieces = @()
foreach ($p in $pecas) {
  $tp = "$root\docs\assets\thumb\$($p.file).jpg"
  $fp = "$root\docs\assets\full\$($p.file).jpg"
  if (-not (Test-Path $tp)) { Write-Warning "sem thumb, pulando: $($p.file)"; continue }
  $ti = [System.Drawing.Image]::FromFile($tp); $tw=$ti.Width; $th=$ti.Height; $ti.Dispose()
  $fi = [System.Drawing.Image]::FromFile($fp); $fw=$fi.Width; $fh=$fi.Height; $fi.Dispose()
  $pieces += [pscustomobject]@{ file=$p.file; g=$p.g; t=$p.t; fonte=$p.fonte; link=$p.link; rec=$p.rec; mes=$p.mes; tw=$tw; th=$th; fw=$fw; fh=$fh }
}
$total = $pieces.Count

# ordem curada dos blocos. Bloco novo que nao esteja aqui entra no fim,
# antes das avulsas, para nunca sumir da pagina por esquecimento.
$ordemCurada = @('ilha-em-close','marca-palavra','brasao-revival','colorway-vestido','aparelho-contra-a-lente','cartaz-de-interface','corpo-em-suspensao','vitrine-preta','cromo-liquido','tipo-atras-do-produto','mao-sem-corpo','oferta-gritada','mao-e-aparelho','maquete-flutuante','capa-de-relatorio','avulsas-trend','avulsas-mobile','avulsas-poster')
$todos = @($blocks | ForEach-Object { $_.g })
$avulsas = @($todos | Where-Object { $_ -like 'avulsas*' })
$ordem = @()
$ordem += @($ordemCurada | Where-Object { $todos -contains $_ -and $avulsas -notcontains $_ })
$ordem += @($todos | Where-Object { $ordem -notcontains $_ -and $avulsas -notcontains $_ })
$ordem += @($ordemCurada | Where-Object { $avulsas -contains $_ })
$ordem += @($avulsas | Where-Object { $ordem -notcontains $_ })

$recortes = @('mobile','trend') + @($pecas | ForEach-Object { $_.rec } | Sort-Object -Unique | Where-Object { $_ -notin @('mobile','trend') })
$meses = @($pecas | ForEach-Object { $_.mes } | Sort-Object -Unique -Descending)
$sb = New-Object System.Text.StringBuilder
function W($s) { [void]$sb.AppendLine($s) }

function Piece($p) {
  $alt = E("$($p.t) — peça da varredura de $($p.rec), via $($p.fonte)")
  $cap = E($p.t)
  $lk = $p.link; if ($lk -and $lk -match 'behance\.net/gallery/') { $lk = $lk.TrimEnd('/') + '/' + (Slug $p.t) }
  $orig = if ($lk) { ' <a href="' + $lk + '" target="_blank" rel="noopener noreferrer">original</a>' } else { '' }
  $h = '<figure class="pc rv" data-rec="' + $p.rec + '" data-mes="' + $p.mes + '" data-t="' + $cap + '">'
  $h += '<button type="button" data-full="assets/full/' + $p.file + '.jpg" data-w="' + $p.fw + '" data-h="' + $p.fh + '" data-cap="' + $cap + '" data-src="' + $p.fonte + '" data-link="' + $lk + '">'
  $h += '<img src="assets/thumb/' + $p.file + '.jpg" width="' + $p.tw + '" height="' + $p.th + '" alt="' + $alt + '" loading="lazy" decoding="async">'
  $h += '</button>'
  $h += '<figcaption>' + $cap + ' <span class="s">' + $p.fonte + '</span>' + $orig + '</figcaption>'
  $h += '</figure>'
  return $h
}

W '<!doctype html>'
W '<html lang="pt-BR">'
W '<head>'
W '<meta charset="utf-8">'
W '<meta name="viewport" content="width=device-width, initial-scale=1">'
W '<title>Radar Visual — Gab Tavares</title>'
W '<meta name="description" content="Arquivo do Radar Visual: agrupamentos visuais por recorte e por mês, com a varredura inteira de cada rodada.">'
W '<link rel="icon" href="favicon.svg" type="image/svg+xml">'
W '<link rel="icon" href="favicon-32.png" sizes="32x32" type="image/png">'
W '<link rel="apple-touch-icon" href="apple-touch-icon.png">'
W '<link rel="preconnect" href="https://fonts.googleapis.com">'
W '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>'
W '<link href="https://fonts.googleapis.com/css2?family=Bricolage+Grotesque:opsz,wght@12..96,500..800&family=IBM+Plex+Mono:wght@400;500&family=IBM+Plex+Sans:wght@400;450;500&display=swap" rel="stylesheet">'
W '<script>try{var _t=localStorage.getItem("rv-theme");if(_t==="dark"||(!_t&&window.matchMedia&&matchMedia("(prefers-color-scheme: dark)").matches))document.documentElement.setAttribute("data-theme","dark")}catch(e){}</script>'
W '<style>'
W ':root{--paper:#FAFAFA;--card:#F2F1EF;--ink:#17181D;--muted:#6F6C75;--line:#E4E2DE;--accent:#D8402A;--lbbg:rgba(250,250,250,.97);--shadow:rgba(23,24,29,.22);'
W '--display:"Bricolage Grotesque","Arial Narrow",system-ui,sans-serif;--body:"IBM Plex Sans",system-ui,sans-serif;'
W '--mono:"IBM Plex Mono",ui-monospace,Consolas,monospace;--bar:74px}'
W ':root[data-theme="dark"]{--paper:#16171A;--card:#212327;--ink:#F2F1EE;--muted:#9C99A3;--line:#2D2F35;--accent:#FF6A52;--lbbg:rgba(22,23,26,.97);--shadow:rgba(0,0,0,.55)}'
W '*{box-sizing:border-box}html{-webkit-text-size-adjust:100%;scroll-behavior:smooth}'
W 'body{margin:0;background:var(--paper);color:var(--ink);font-family:var(--body);font-size:16px;line-height:1.55;-webkit-font-smoothing:antialiased}'
W 'a{color:inherit}a:hover{color:var(--accent)}'
W ':focus-visible{outline:2px solid var(--accent);outline-offset:3px}'
W '.sr{position:absolute;width:1px;height:1px;overflow:hidden;clip:rect(0 0 0 0);white-space:nowrap}'
W '.wrap{max-width:1680px;margin:0 auto;padding:0 28px}'
W '/* abertura, filtros e assinatura acompanham a borda do menu fixo */'
W '.mast,.filters,.foot .wrap{max-width:none;margin:0;padding-left:28px;padding-right:28px}'
W '.js .rv{opacity:0;transform:translateY(24px)}'
W '.js .rv.in{opacity:1;transform:none;transition:opacity .6s cubic-bezier(.2,.7,.3,1),transform .6s cubic-bezier(.2,.7,.3,1)}'
W '.mast{padding:64px 28px 26px}'
W '.mast h1{font-family:var(--display);font-weight:800;font-size:clamp(50px,10.5vw,158px);line-height:.84;letter-spacing:-.035em;margin:0;text-transform:uppercase}'
W '.mast h1 em{font-style:normal;display:block;color:var(--accent)}'
W '.mast .sub{display:flex;flex-wrap:wrap;gap:9px 28px;margin:26px 0 0;font-family:var(--mono);font-size:11.5px;letter-spacing:.09em;text-transform:uppercase;color:var(--muted)}'
W '.mast .sub b{color:var(--ink);font-weight:500}'
W '.stamp{font-family:var(--mono);font-size:10px;letter-spacing:.1em;text-transform:uppercase;color:var(--muted);margin:9px 0 0}'
W '.stamp b{color:var(--ink);font-weight:500}'
W '.themebtn{display:inline-block;margin:16px 0 0;font-family:var(--mono);font-size:10px;letter-spacing:.1em;text-transform:uppercase;color:var(--muted);background:none;border:1px solid var(--line);padding:9px 13px;cursor:pointer;transition:color .2s,border-color .2s}'
W '.themebtn:hover{color:var(--accent);border-color:var(--accent)}'
W '.themebtn span[data-d]{display:none}'
W ':root[data-theme="dark"] .themebtn span[data-l]{display:none}'
W ':root[data-theme="dark"] .themebtn span[data-d]{display:inline}'
W '/* mosaico: tres faixas, sem moldura e sem vao, larguras naturais */'
W '.mosaic{overflow:hidden;padding:20px 0 0;display:grid;gap:2px;-webkit-mask-image:linear-gradient(to right,transparent,#000 3%,#000 97%,transparent);mask-image:linear-gradient(to right,transparent,#000 3%,#000 97%,transparent)}'
W '.mrow{display:flex;gap:2px;width:max-content;animation:drift var(--d,90s) linear infinite;will-change:transform}'
W '.mrow--rev{animation-direction:reverse}'
W '.mosaic:hover .mrow{animation-play-state:paused}'
W '@keyframes drift{from{transform:translateX(0)}to{transform:translateX(-50%)}}'
W '.mosaic button{flex:0 0 auto;display:block;padding:0;margin:0;border:0;background:none;cursor:zoom-in;line-height:0}'
W '.mosaic img{display:block;height:var(--mh,130px);width:auto;max-width:none;transition:opacity .3s}'
W '.mosaic button:hover img{opacity:.7}'
W '.mosaic button.off{display:none}'
W '/* filtros */'
W '.filters{border-top:1px solid var(--line);margin-top:22px}'
W '.frow{display:flex;flex-wrap:wrap;align-items:baseline;gap:6px 14px;padding:12px 0;border-bottom:1px solid var(--line)}'
W '.frow>span{font-family:var(--mono);font-size:9.5px;letter-spacing:.12em;text-transform:uppercase;color:var(--muted);min-width:64px}'
W '.chip{font-family:var(--mono);font-size:11px;letter-spacing:.07em;text-transform:uppercase;background:none;border:0;border-bottom:1px solid transparent;color:var(--muted);padding:3px 0;cursor:pointer;transition:color .2s,border-color .2s}'
W '.chip:hover{color:var(--ink)}'
W '.chip[aria-pressed=true]{color:var(--accent);border-bottom-color:var(--accent)}'
W '.bar{position:sticky;top:0;z-index:50;background:var(--paper);border-bottom:1px solid var(--line);display:flex;gap:20px;align-items:stretch;padding:0 28px;min-height:var(--bar)}'
W '.barscroll{flex:1 1 auto;min-width:0;overflow-x:auto;overflow-y:hidden;display:flex;flex-direction:column;justify-content:center;gap:5px;padding:9px 0}'
W '.barscroll .frow{border-bottom:0;padding:0;gap:4px 12px;flex-wrap:nowrap;white-space:nowrap;width:max-content}'
W '.barscroll .frow .sep{margin-left:14px}'
W '.barlogo{flex:0 0 auto;display:flex;flex-direction:column;justify-content:center;text-decoration:none;color:var(--ink);white-space:nowrap;padding:9px 0}'
W '.barlogo b{font-family:var(--display);font-weight:800;font-size:15px;letter-spacing:-.02em;text-transform:uppercase;line-height:1.05}'
W '.barlogo span{font-family:var(--mono);font-size:9px;letter-spacing:.11em;text-transform:uppercase;color:var(--accent);line-height:1.4;margin-top:2px}'
W '.barlogo:hover{color:var(--accent)}'
W '.bar ul{display:flex;gap:18px;list-style:none;margin:0;padding:0;white-space:nowrap;width:max-content}'
W '.bar ul a{font-family:var(--mono);font-size:11px;letter-spacing:.07em;text-transform:uppercase;text-decoration:none;color:var(--muted);padding:2px 0;display:block}'
W '.bar a:hover,.bar a:focus-visible{color:var(--ink)}'
W '.bar a.em{color:var(--accent)}'
W '.bar li.off{display:none}'
W '.tools{flex:0 0 auto;display:flex;align-items:center;gap:10px}'
W '.tools input[type=search]{font-family:var(--mono);font-size:11px;background:var(--card);color:var(--ink);border:1px solid var(--line);border-radius:0;padding:8px 11px;width:170px;min-width:104px}'
W '.tools input:focus{border-color:var(--accent);outline:none}'
W '.tg{font-family:var(--mono);font-size:10.5px;letter-spacing:.07em;text-transform:uppercase;color:var(--muted);background:var(--card);border:1px solid var(--line);padding:8px 11px;cursor:pointer;white-space:nowrap}'
W '.tg[aria-pressed=true]{color:var(--accent);border-color:var(--accent)}'
W '.theme[aria-pressed=true]{color:var(--muted);border-color:var(--line)}'
W '.theme span[data-d]{display:none}'
W ':root[data-theme="dark"] .theme span[data-l]{display:none}'
W ':root[data-theme="dark"] .theme span[data-d]{display:inline}'
W '/* bloco */'
W '.blk{padding:88px 0 0;border-top:1px solid var(--line);margin-top:56px}'
W '.blk:first-of-type{border-top:0;margin-top:10px}'
W '.hero{position:relative;overflow:hidden;height:min(62vh,600px);background:var(--card)}'
W '.hero img{width:100%;height:116%;object-fit:cover;display:block;will-change:transform}'
W '.hero .veil{position:absolute;inset:0;background:linear-gradient(to top,rgba(23,24,29,.66),rgba(23,24,29,.04) 58%)}'
W '.hero .tag{position:absolute;left:26px;bottom:24px;right:26px;color:#fff}'
W '.hero h2{font-family:var(--display);font-weight:800;font-size:clamp(32px,6vw,80px);line-height:.92;letter-spacing:-.03em;margin:0;text-transform:uppercase}'
W '.hero .kind{font-family:var(--mono);font-size:11px;letter-spacing:.1em;text-transform:uppercase;margin:0 0 12px;color:rgba(255,255,255,.84)}'
W '.blk--em .hero .kind{color:#FFB4A4}'
W '.body{display:grid;grid-template-columns:minmax(0,350px) minmax(0,1fr);gap:44px;padding:40px 0 0}'
W '.def{position:sticky;top:calc(var(--bar) + 24px);align-self:start}'
W '.lines div{display:grid;grid-template-columns:110px 1fr;gap:12px;margin-bottom:13px;align-items:baseline;padding-bottom:12px;border-bottom:1px solid var(--line)}'
W '.lines .lbl{font-family:var(--mono);font-size:9.5px;letter-spacing:.1em;text-transform:uppercase;color:var(--muted);line-height:1.8}'
W '.lines .tx{font-size:15.5px;line-height:1.5}'
W '.ctxbtn{font-family:var(--mono);font-size:10.5px;letter-spacing:.1em;text-transform:uppercase;color:var(--muted);background:none;border:0;padding:10px 0 0;cursor:pointer;display:inline-flex;gap:8px;align-items:center}'
W '.ctxbtn:hover{color:var(--accent)}'
W '.ctxbtn i{font-style:normal;transition:transform .3s ease}'
W '.ctxbtn[aria-expanded=true] i{transform:rotate(90deg)}'
W '.ctx{display:grid;grid-template-rows:0fr;transition:grid-template-rows .4s cubic-bezier(.2,.7,.3,1)}'
W '.ctx.on{grid-template-rows:1fr}.ctx>div{overflow:hidden}'
W '.ctx p{margin:14px 0 0;font-size:14px;line-height:1.62;color:var(--muted);max-width:54ch}'
W '/* grade alinhada: sem cartao, sem sombra, sem rotacao */'
W '.mood{column-count:3;column-gap:14px}'
W '@media(max-width:1250px){.mood{column-count:2}}'
W '.pc{break-inside:avoid;margin:0 0 14px;background:none;padding:0;transition:transform .3s cubic-bezier(.2,.7,.3,1)}'
W '.pc button{display:block;width:100%;padding:0;border:0;background:none;cursor:zoom-in;font:inherit;color:inherit;line-height:0;outline-offset:0}'
W '.pc img{display:block;width:100%;height:auto;border:1px solid transparent;transition:border-color .3s}'
W '.pc:hover,.pc:focus-within{transform:translateY(-4px)}'
W '.pc:hover img,.pc:focus-within img{border-color:var(--accent)}'
W '.pc figcaption{font-family:var(--mono);font-size:9.5px;letter-spacing:.05em;color:var(--muted);padding:8px 0 0;line-height:1.55}'
W '.pc figcaption .s{color:var(--ink)}'
W '.pc figcaption a{color:var(--muted);text-decoration:none;border-bottom:1px solid var(--line)}'
W '.pc figcaption a:hover{color:var(--accent);border-color:var(--accent)}'
W '.pc.off{display:none}'
W '.sweep{padding:96px 0 40px;border-top:1px solid var(--line);margin-top:64px}'
W '.sweep .wrap{max-width:none;padding:0 14px}'
W '.sweep-head{display:flex;flex-wrap:wrap;align-items:flex-end;justify-content:space-between;gap:16px;margin-bottom:30px}'
W '.sweep-head h2{font-family:var(--display);font-weight:800;font-size:clamp(30px,5.4vw,72px);line-height:.9;letter-spacing:-.03em;margin:0;text-transform:uppercase}'
W '.sweep-head p{font-family:var(--mono);font-size:11px;letter-spacing:.08em;text-transform:uppercase;color:var(--muted);margin:0;max-width:44ch;line-height:1.8}'
W '.mood--all{column-count:8;column-gap:8px}'
W '@media(max-width:1700px){.mood--all{column-count:7}}'
W '.mood--all .pc{margin-bottom:10px}'
W '.mood--all .pc figcaption{font-size:9px}'
W '@media(max-width:1400px){.mood--all{column-count:5}}'
W '@media(max-width:1100px){.mood--all{column-count:4}}'
W '@media(max-width:760px){.mood--all{column-count:3}}'
W '.lb{position:fixed;inset:0;z-index:90;display:none;background:var(--lbbg);padding:26px;align-items:center;justify-content:center;opacity:0}'
W '.lb.on{display:flex;opacity:1;transition:opacity .25s ease}'
W '.lb figure{margin:0;max-width:100%;max-height:100%;text-align:center;transform:scale(.985);transition:transform .3s cubic-bezier(.2,.7,.3,1)}'
W '.lb.on figure{transform:none}'
W '.lb img{max-width:100%;max-height:80vh;width:auto;height:auto;display:block;margin:0 auto;background:var(--card);box-shadow:0 24px 64px var(--shadow)}'
W '.lb figcaption{font-family:var(--mono);font-size:11px;letter-spacing:.06em;color:var(--muted);margin-top:16px}'
W '.lb figcaption a{color:var(--ink)}'
W '.lbx{position:absolute;top:16px;right:20px;background:none;border:0;color:var(--muted);font-family:var(--mono);font-size:12px;cursor:pointer;padding:8px}'
W '.lbx:hover{color:var(--accent)}'
W '.lbn{position:absolute;top:50%;transform:translateY(-50%);background:none;border:0;color:var(--muted);font-size:30px;cursor:pointer;padding:18px}'
W '.lbn:hover{color:var(--accent)}.lbp{left:8px}.lbf{right:8px}'
W '.foot{border-top:1px solid var(--line);margin-top:56px;padding:36px 0 72px;font-family:var(--mono);font-size:10.5px;letter-spacing:.06em;text-transform:uppercase;color:var(--muted)}'
W '.foot .sig{font-family:var(--body);font-weight:400;font-size:15px;line-height:1.5;letter-spacing:0;text-transform:none;color:var(--muted);margin:0;text-align:left}'
W '.foot .sig em{font-style:normal;display:block;color:var(--accent)}'
W '.foot p{margin:0 0 7px;max-width:92ch;line-height:1.8}'
W '.empty{display:none;font-family:var(--mono);font-size:12px;color:var(--muted);padding:56px 28px;line-height:1.9}'
W '.empty.on{display:block}'
W '@media(max-width:900px){.wrap{padding:0 16px}.bar{padding:0 16px}.mast,.filters,.foot .wrap{padding-left:16px;padding-right:16px}.body{grid-template-columns:1fr;gap:24px}.def{position:static}'
W '.mood{column-count:2;column-gap:10px}.mood .pc{margin-bottom:10px}.hero{height:44vh}.mast{padding:40px 16px 18px}}'
W '@media(max-width:430px){.mood{column-count:1}.mood--all{column-count:2}.tools input[type=search]{width:100px}}'
W '@media(prefers-reduced-motion:reduce){html{scroll-behavior:auto}*{animation:none !important;transition:none !important}'
W '.js .rv{opacity:1;transform:none}.pc{transform:none !important}.hero img{height:100%}}'
W '</style>'
W '</head>'
W '<body>'

W '<header class="wrap mast" id="topo">'
W '<h1>Radar<em>Visual</em></h1>'
W ('<p class="sub"><span>ARQUIVO <b>' + $blocks.Count + ' BLOCOS</b></span><span>PEÇAS <b>' + $total + '</b></span><span>RECORTES <b>MOBILE, TREND</b></span><span>MESES <b>' + $meses.Count + '</b></span><span>GAB TAVARES</span></p>')
W ('<p class="stamp">Última atualização &nbsp;<b>' + (Get-Date).ToString('yyyy-MM-dd HH:mm') + '</b></p>')
W '<button class="themebtn" id="theme" type="button"><span data-l>Tema escuro</span><span data-d>Tema claro</span></button>'
W '</header>'

$rnd = New-Object System.Random(20260731)
$shuf = $pieces | Sort-Object { $rnd.Next() }
$linhas = @(
  @{ set = @($shuf | Select-Object -Index (0..([Math]::Min(23, $shuf.Count-1)))); d = '92s'; h = '132px'; rev = '' },
  @{ set = @($shuf | Select-Object -Skip 24 -First 24); d = '112s'; h = '110px'; rev = ' mrow--rev' },
  @{ set = @($shuf | Select-Object -Skip 48 -First 24); d = '134s'; h = '146px'; rev = '' }
)
W '<div class="mosaic" id="mosaico">'
foreach ($ln in $linhas) {
  W ('<div class="mrow' + $ln.rev + '" style="--d:' + $ln.d + ';--mh:' + $ln.h + '">')
  foreach ($rep in 1..2) {
    foreach ($p in $ln.set) {
      $lkm = $p.link; if ($lkm -and $lkm -match 'behance\.net/gallery/') { $lkm = $lkm.TrimEnd('/') + '/' + (Slug $p.t) }
      W ('<button type="button" class="mtile" data-rec="' + $p.rec + '" data-mes="' + $p.mes + '" data-full="assets/full/' + $p.file + '.jpg" data-w="' + $p.fw + '" data-h="' + $p.fh + '" data-cap="' + (E $p.t) + '" data-src="' + $p.fonte + '" data-link="' + $lkm + '" aria-label="' + (E $p.t) + '"><img src="assets/thumb/' + $p.file + '.jpg" width="' + $p.tw + '" height="' + $p.th + '" alt="' + (E $p.t) + '" loading="' + $(if ($rep -eq 1) { 'eager' } else { 'lazy' }) + '" decoding="async"></button>')
    }
  }
  W '</div>'
}
W '</div>'
W '<nav class="bar" aria-label="Filtros e blocos">'
W '<a class="barlogo" href="#topo"><b>Radar Visual</b><span>Gab Tavares</span></a>'
W '<div class="barscroll">'
W '<div class="frow"><span>Recorte</span><button class="chip" data-f="rec" data-v="" aria-pressed="true">todos</button>'
foreach ($r in $recortes) { W ('<button class="chip" data-f="rec" data-v="' + $r + '" aria-pressed="false">' + $r + '</button>') }
W '<span class="sep">Mês</span><button class="chip" data-f="mes" data-v="" aria-pressed="true">todos</button>'
foreach ($m in $meses) { W ('<button class="chip" data-f="mes" data-v="' + $m + '" aria-pressed="false">' + $m + '</button>') }
W '</div>'
W '<ul>'
foreach ($k in $ordem) {
  $b = $blocks | Where-Object { $_.g -eq $k }
  if (-not $b) { continue }
  $cls = if ($b.tipo -eq 'emergente') { ' class="em"' } else { '' }
  W ('<li data-for="' + $b.g + '"><a href="#' + $b.g + '"' + $cls + '>' + (E $b.nome) + '</a></li>')
}
W '<li data-for="varredura"><a href="#varredura">A varredura inteira</a></li>'
W '</ul>'
W '</div>'
W '<div class="tools"><button class="tg" id="tg" type="button" aria-pressed="false">só emergentes</button></div>'
W '</nav>'

W '<main>'
foreach ($k in $ordem) {
  $b = $blocks | Where-Object { $_.g -eq $k }
  if (-not $b) { continue }
  $bp = @($pieces | Where-Object { $_.g -eq $k })
  if ($bp.Count -eq 0) { continue }
  $em = ($b.tipo -eq 'emergente')
  $cls = if ($em) { 'blk blk--em' } else { 'blk' }
  $hay = E("$($b.nome) $($b.oque) $($b.vem) $($b.agora) $($b.encaixa) $($b.nao) $($b.rec) " + (($bp | ForEach-Object { $_.t }) -join ' '))
  $hero = $bp[0]
  W ('<section class="' + $cls + '" id="' + $b.g + '" data-em="' + $em.ToString().ToLower() + '" data-rec="' + $b.rec + '" data-mes="' + $b.mes + '" data-hay="' + $hay + '">')
  W '<div class="wrap">'
  W '<div class="hero rv">'
  W ('<img src="assets/full/' + $hero.file + '.jpg" width="' + $hero.fw + '" height="' + $hero.fh + '" alt="' + (E "Abertura do bloco $($b.nome): $($hero.t)") + '" loading="lazy" decoding="async" data-px>')
  W '<div class="veil"></div><div class="tag">'
  $bits = @((E $b.tipo))
  if ($b.origem) { $bits += "nome " + (E $b.origem) }
  $bits += (E $b.rec)
  $bits += (E $b.mes)
  $bits += "$($bp.Count) peças"
  W ('<p class="kind">' + ($bits -join ' · ') + '</p>')
  W ('<h2>' + (E $b.nome) + '</h2>')
  W '</div></div>'
  W '<div class="body"><div class="def rv"><div class="lines">'
  W ('<div><span class="lbl">O QUE É</span><span class="tx">' + (E $b.oque) + '</span></div>')
  if ($b.tipo -ne 'avulsas') {
    W ('<div><span class="lbl">DE ONDE VEM</span><span class="tx">' + (E $b.vem) + '</span></div>')
    W ('<div><span class="lbl">POR QUE AGORA</span><span class="tx">' + (E $b.agora) + '</span></div>')
    W ('<div><span class="lbl">ONDE ENCAIXA</span><span class="tx">' + (E $b.encaixa) + '</span></div>')
    W ('<div><span class="lbl">ONDE NÃO</span><span class="tx">' + (E $b.nao) + '</span></div>')
  }
  W '</div>'
  W ('<button class="ctxbtn" type="button" aria-expanded="false" aria-controls="c-' + $b.g + '"><i>›</i>contexto</button>')
  W ('<div class="ctx" id="c-' + $b.g + '"><div><p>' + (E $b.ctx) + '</p></div></div>')
  W '</div><div class="mood">'
  foreach ($p in $bp) { W (Piece $p) }
  W '</div></div></div></section>'
}

W '<section class="sweep" id="varredura" data-em="false" data-rec="mobile trend" data-mes="2026-07" data-hay="varredura inteira completa bruta sem filtro tudo que foi coletado">'
W '<div class="wrap"><div class="sweep-head rv">'
W '<h2>A varredura inteira</h2>'
W ('<p>Tudo que saiu das páginas visitadas, sem filtrar nada para fora — inclusive o que não virou bloco. ' + $total + ' peças. O filtro de recorte e de mês vale aqui também.</p>')
W '</div><div class="mood mood--all">'
foreach ($p in $pieces) { W (Piece $p) }
W '</div></div></section>'
W '</main>'
W '<p class="empty" id="empty">Nada casa com esse filtro. Tente limpar o recorte, o mês ou a busca.</p>'

W '<footer class="foot"><div class="wrap"><p class="sig">Feito com amorzin.<br><em>Gab. =)</em></p></div></footer>'
W '<div class="lb" id="lb" role="dialog" aria-modal="true" aria-label="Peça ampliada">'
W '<button class="lbx" id="lbx" type="button" aria-label="Fechar">ESC</button>'
W '<button class="lbn lbp" id="lbp" type="button" aria-label="Anterior">&#8249;</button>'
W '<button class="lbn lbf" id="lbf" type="button" aria-label="Próxima">&#8250;</button>'
W '<figure><img id="lbi" alt=""><figcaption id="lbc"></figcaption></figure>'
W '</div>'

W '<script>'
W '(function(){"use strict";'
W 'var reduce=window.matchMedia&&window.matchMedia("(prefers-reduced-motion: reduce)").matches;'
W 'var rv=[].slice.call(document.querySelectorAll(".rv"));'
W 'if(!reduce&&("IntersectionObserver" in window)){'
W 'document.documentElement.className+=" js";'
W 'var io=new IntersectionObserver(function(es){es.forEach(function(e,i){if(e.isIntersecting){var el=e.target;setTimeout(function(){el.classList.add("in")},Math.min(i*40,300));io.unobserve(el)}})},{rootMargin:"0px 0px -6% 0px"});'
W 'rv.forEach(function(e){io.observe(e)});'
W 'setTimeout(function(){rv.forEach(function(e){e.classList.add("in")})},4000);}'
W 'var px=[].slice.call(document.querySelectorAll("[data-px]")),tick=false;'
W 'function para(){tick=false;px.forEach(function(im){var r=im.parentElement.getBoundingClientRect();if(r.bottom<0||r.top>innerHeight)return;var p=(r.top+r.height/2-innerHeight/2)/innerHeight;im.style.transform="translateY("+(p*-6).toFixed(2)+"%)"});}'
W 'if(!reduce){addEventListener("scroll",function(){if(!tick){tick=true;requestAnimationFrame(para)}},{passive:true});para();}'
W 'var shots=[].slice.call(document.querySelectorAll(".pc button,.mtile")),cur=-1;'
W 'var lb=document.getElementById("lb"),lbi=document.getElementById("lbi"),lbc=document.getElementById("lbc"),lbx=document.getElementById("lbx"),last=null;'
W 'function vis(b){if(b.classList.contains("off"))return false;var f=b.closest(".pc");if(f&&f.classList.contains("off"))return false;var s=b.closest("section");if(s&&s.style.display==="none")return false;return true}'
W 'function show(n){var list=shots.filter(vis);if(!list.length)return;if(n<0)n=list.length-1;if(n>=list.length)n=0;cur=n;var b=list[n];'
W 'lbi.src=b.getAttribute("data-full");lbi.width=b.getAttribute("data-w");lbi.height=b.getAttribute("data-h");lbi.alt=b.querySelector("img").alt;'
W 'var lk=b.getAttribute("data-link");lbc.textContent=b.getAttribute("data-cap")+" \u2014 "+b.getAttribute("data-src");'
W 'if(lk){var a=document.createElement("a");a.href=lk;a.target="_blank";a.rel="noopener noreferrer";a.textContent="original";lbc.appendChild(document.createTextNode(" \u00b7 "));lbc.appendChild(a);}'
W 'lb.classList.add("on");lbx.focus();}'
W 'function close(){lb.classList.remove("on");lbi.removeAttribute("src");lbi.alt="";if(last){last.focus();last=null}}'
W 'document.addEventListener("click",function(e){'
W 'var b=e.target.closest(".pc button,.mtile");if(b){last=b;show(shots.filter(vis).indexOf(b));return}'
W 'if(e.target.closest("#lbx")||e.target===lb){close();return}'
W 'if(e.target.closest("#lbp")){show(cur-1);return}'
W 'if(e.target.closest("#lbf")){show(cur+1);return}'
W 'var c=e.target.closest(".ctxbtn");if(c){var p=document.getElementById(c.getAttribute("aria-controls"));var on=p.classList.toggle("on");c.setAttribute("aria-expanded",on?"true":"false");return}'
W 'var ch=e.target.closest(".chip");if(ch){var f=ch.getAttribute("data-f");'
W 'chips.forEach(function(o){if(o.getAttribute("data-f")===f)o.setAttribute("aria-pressed","false")});'
W 'ch.setAttribute("aria-pressed","true");state[f]=ch.getAttribute("data-v");filter();}'
W '});'
W 'document.addEventListener("keydown",function(e){if(!lb.classList.contains("on"))return;'
W 'if(e.key==="Escape")close();if(e.key==="ArrowLeft")show(cur-1);if(e.key==="ArrowRight")show(cur+1);});'
W 'var tg=document.getElementById("tg");var chips=[].slice.call(document.querySelectorAll(".chip"));'
W 'var secs=[].slice.call(document.querySelectorAll("section[data-hay]"));'
W 'var pcs=[].slice.call(document.querySelectorAll(".mood--all .pc"));'
W 'var tiles=[].slice.call(document.querySelectorAll(".mtile"));'
W 'var navs=[].slice.call(document.querySelectorAll(".bar li"));var navMap={};navs.forEach(function(l){navMap[l.getAttribute("data-for")]=l});'
W 'var empty=document.getElementById("empty");'
W 'var state={rec:"",mes:"",em:false};'



W 'function okRec(v){return !state.rec||(v||"").indexOf(state.rec)>-1}'
W 'function okMes(v){return !state.mes||(v||"").indexOf(state.mes)>-1}'
W 'function filter(){var any=false;'
W 'secs.forEach(function(s){'
W 'var hit=okRec(s.getAttribute("data-rec"))&&okMes(s.getAttribute("data-mes"))&&(!state.em||s.getAttribute("data-em")==="true");'
W 'if(s.id==="varredura"&&state.em)hit=false;'
W 's.style.display=hit?"":"none";if(hit)any=true;'
W 'var li=navMap[s.id];if(li)li.className=hit?"":"off";});'
W 'pcs.forEach(function(p){var hit=okRec(p.getAttribute("data-rec"))&&okMes(p.getAttribute("data-mes"));p.classList.toggle("off",!hit);});'
W 'tiles.forEach(function(m){m.classList.toggle("off",!(okRec(m.getAttribute("data-rec"))&&okMes(m.getAttribute("data-mes"))));});'
W 'empty.classList.toggle("on",!any);}'
W 'var th=document.getElementById("theme");'
W 'function syncTheme(){var d=document.documentElement.getAttribute("data-theme")==="dark";th.setAttribute("aria-pressed",d?"true":"false");}'
W 'syncTheme();'
W 'th.addEventListener("click",function(){var d=document.documentElement.getAttribute("data-theme")==="dark";'
W 'if(d){document.documentElement.removeAttribute("data-theme")}else{document.documentElement.setAttribute("data-theme","dark")}'
W 'try{localStorage.setItem("rv-theme",d?"light":"dark")}catch(e){}syncTheme();});'
W 'try{var mq=matchMedia("(prefers-color-scheme: dark)");var onMq=function(e){if(!localStorage.getItem("rv-theme")){if(e.matches){document.documentElement.setAttribute("data-theme","dark")}else{document.documentElement.removeAttribute("data-theme")}syncTheme();}};if(mq.addEventListener)mq.addEventListener("change",onMq);}catch(e){}'
W 'tg.addEventListener("click",function(){state.em=!state.em;tg.setAttribute("aria-pressed",state.em?"true":"false");filter()});'
W '})();'
W '</script>'
W '</body></html>'

$enc = New-Object System.Text.UTF8Encoding($false)
$outPath = Join-Path $root "docs\index.html"
[System.IO.File]::WriteAllText($outPath, $sb.ToString(), $enc)
"OK :: $total pecas :: $($blocks.Count) blocos :: $((Get-Item $outPath).Length) bytes"
