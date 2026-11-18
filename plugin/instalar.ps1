# Instalador de skills por copia para Windows (PowerShell).
#
# Uso:
#   powershell -ExecutionPolicy Bypass -File instalar.ps1 [-Pacote <pasta-do-pacote>]
#
# Mesmo comportamento do instalar.sh: escolhe as skills, copia para
# $HOME\.claude\skills e coloca o CLAUDE.md em $HOME\<nome-do-pacote>.

param([string]$Pacote = $PSScriptRoot)

$ErrorActionPreference = 'Stop'
$Pacote = (Resolve-Path $Pacote).Path
$ClaudeDir = Join-Path $HOME '.claude'
$SkillsDir = Join-Path $ClaudeDir 'skills'
$PluginJson = Join-Path $Pacote '.claude-plugin\plugin.json'

if (-not (Test-Path $ClaudeDir)) {
    Write-Host 'Pasta .claude nao encontrada. Instale o Claude Code e abra-o uma vez antes.' -ForegroundColor Red
    exit 1
}
if (-not (Test-Path $PluginJson) -or -not (Test-Path (Join-Path $Pacote 'skills'))) {
    Write-Host "Pacote invalido: $Pacote" -ForegroundColor Red
    exit 1
}

$Nome = (Get-Content $PluginJson -Raw -Encoding UTF8 | ConvertFrom-Json).name
$Trabalho = Join-Path $HOME $Nome

$Skills = @(Get-ChildItem (Join-Path $Pacote 'skills') -Directory |
    Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') } |
    Select-Object -ExpandProperty Name)

if ($Skills.Count -eq 0) {
    Write-Host 'Nenhuma skill encontrada no pacote.' -ForegroundColor Red
    exit 1
}

Write-Host ''
Write-Host "Pacote: $Nome"
for ($i = 0; $i -lt $Skills.Count; $i++) {
    Write-Host ('  {0,2}. {1}' -f ($i + 1), $Skills[$i])
}
Write-Host ''
$Entrada = Read-Host 'Numeros separados por virgula (ex.: 1,3) ou "todos"'

if ($Entrada.Trim().ToLower() -eq 'todos') {
    $Escolhidas = $Skills
} else {
    $Escolhidas = @()
    foreach ($n in $Entrada.Split(',')) {
        $n = $n.Trim()
        if ($n -match '^\d+$' -and [int]$n -ge 1 -and [int]$n -le $Skills.Count) {
            $Escolhidas += $Skills[[int]$n - 1]
        } elseif ($n) {
            Write-Host "Ignorado: '$n'" -ForegroundColor Yellow
        }
    }
}

if ($Escolhidas.Count -eq 0) {
    Write-Host 'Nenhuma skill escolhida.' -ForegroundColor Red
    exit 1
}

New-Item -ItemType Directory -Force -Path $SkillsDir, $Trabalho | Out-Null

foreach ($skill in $Escolhidas) {
    $destino = Join-Path $SkillsDir $skill
    if (Test-Path $destino) { Remove-Item -Recurse -Force $destino }
    Copy-Item -Recurse (Join-Path $Pacote "skills\$skill") $destino
    Write-Host "[ok] /$skill" -ForegroundColor Green
}

$Contexto = Join-Path $Pacote 'CLAUDE.md'
if (Test-Path $Contexto) {
    $Alvo = Join-Path $Trabalho 'CLAUDE.md'
    if ((Test-Path $Alvo) -and ((Get-FileHash $Alvo).Hash -ne (Get-FileHash $Contexto).Hash)) {
        Copy-Item $Alvo ("$Alvo.bak-" + (Get-Date -Format 'yyyyMMddHHmmss'))
        Write-Host "[!] Backup do CLAUDE.md anterior criado em $Trabalho" -ForegroundColor Yellow
    }
    Copy-Item $Contexto $Alvo -Force
    Write-Host "[ok] Contexto da empresa em $Alvo" -ForegroundColor Green
}

Write-Host ''
Write-Host "Pronto. Abra o Claude Code dentro de $Trabalho e digite / para ver as skills."
