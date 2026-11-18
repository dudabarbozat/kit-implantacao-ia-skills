#!/usr/bin/env bash
# Instalador de skills por cópia (alternativa ao plugin).
#
# Uso:
#   bash instalar.sh [pasta-do-pacote]
#
# A pasta do pacote precisa ter:
#   .claude-plugin/plugin.json   (o campo "name" vira o nome da pasta de trabalho)
#   CLAUDE.md                    (contexto da empresa; opcional)
#   skills/<nome>/SKILL.md
#
# O que faz:
#   1. Mostra as skills do pacote e pergunta quais instalar (números ou "todos").
#   2. Copia cada skill escolhida para ~/.claude/skills/<nome>.
#   3. Cria ~/<nome-do-pacote>/ e copia o CLAUDE.md para lá (com backup se já existir).
#      O time abre o Claude Code dentro dessa pasta para carregar o contexto.
#   Nunca sobrescreve ~/.claude/CLAUDE.md.

set -euo pipefail

PACOTE="${1:-$(cd "$(dirname "$0")" && pwd)}"
PACOTE="$(cd "$PACOTE" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"

VERDE='\033[0;32m'; AMARELO='\033[1;33m'; VERMELHO='\033[0;31m'; CINZA='\033[0;37m'; FIM='\033[0m'

nome_pacote() {
  sed -n 's/.*"name"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$PACOTE/.claude-plugin/plugin.json" | head -n 1
}

descricao_skill() {
  # Primeira linha de texto depois de "description:" no frontmatter.
  awk '
    /^description:/ { sub(/^description:[[:space:]]*>?[[:space:]]*/, ""); if (length($0)) { print; exit } ; pegar=1; next }
    pegar && NF { sub(/^[[:space:]]+/, ""); print; exit }
  ' "$1"
}

if [ ! -d "$CLAUDE_DIR" ]; then
  echo -e "${VERMELHO}Pasta ~/.claude não encontrada. Instale o Claude Code e abra-o uma vez antes.${FIM}"
  exit 1
fi

if [ ! -f "$PACOTE/.claude-plugin/plugin.json" ] || [ ! -d "$PACOTE/skills" ]; then
  echo -e "${VERMELHO}Pacote inválido: $PACOTE${FIM}"
  echo "Esperado: .claude-plugin/plugin.json e skills/"
  exit 1
fi

NOME="$(nome_pacote)"
TRABALHO="$HOME/$NOME"

NOMES=()
for arquivo in "$PACOTE"/skills/*/SKILL.md; do
  [ -f "$arquivo" ] || continue
  NOMES+=("$(basename "$(dirname "$arquivo")")")
done

if [ "${#NOMES[@]}" -eq 0 ]; then
  echo -e "${VERMELHO}Nenhuma skill encontrada em $PACOTE/skills${FIM}"
  exit 1
fi

echo ""
echo "Pacote: $NOME"
echo ""
for i in "${!NOMES[@]}"; do
  desc="$(descricao_skill "$PACOTE/skills/${NOMES[$i]}/SKILL.md")"
  printf "  %2d. %-22s %s\n" "$((i + 1))" "${NOMES[$i]}" "${desc:0:70}"
done
echo ""
echo "Digite os números separados por vírgula (ex.: 1,3) ou \"todos\"."
read -r -p "Escolha: " ENTRADA

ESCOLHIDAS=()
if [ "$(echo "$ENTRADA" | tr '[:upper:]' '[:lower:]' | tr -d ' ')" = "todos" ]; then
  ESCOLHIDAS=("${NOMES[@]}")
else
  IFS=',' read -ra NUMEROS <<< "$ENTRADA"
  for n in "${NUMEROS[@]}"; do
    n="$(echo "$n" | tr -d ' ')"
    if [[ "$n" =~ ^[0-9]+$ ]] && [ "$n" -ge 1 ] && [ "$n" -le "${#NOMES[@]}" ]; then
      ESCOLHIDAS+=("${NOMES[$((n - 1))]}")
    else
      echo -e "${AMARELO}Ignorado: '$n'${FIM}"
    fi
  done
fi

if [ "${#ESCOLHIDAS[@]}" -eq 0 ]; then
  echo -e "${VERMELHO}Nenhuma skill escolhida.${FIM}"
  exit 1
fi

mkdir -p "$SKILLS_DIR" "$TRABALHO"

for skill in "${ESCOLHIDAS[@]}"; do
  rm -rf "${SKILLS_DIR:?}/$skill"
  cp -R "$PACOTE/skills/$skill" "$SKILLS_DIR/$skill"
  echo -e "${VERDE}[ok] /$skill${FIM}"
done

if [ -f "$PACOTE/CLAUDE.md" ]; then
  if [ -f "$TRABALHO/CLAUDE.md" ] && ! cmp -s "$PACOTE/CLAUDE.md" "$TRABALHO/CLAUDE.md"; then
    cp "$TRABALHO/CLAUDE.md" "$TRABALHO/CLAUDE.md.bak-$(date +%Y%m%d%H%M%S)"
    echo -e "${AMARELO}[!] CLAUDE.md anterior guardado como backup em $TRABALHO${FIM}"
  fi
  cp "$PACOTE/CLAUDE.md" "$TRABALHO/CLAUDE.md"
  echo -e "${VERDE}[ok] Contexto da empresa em $TRABALHO/CLAUDE.md${FIM}"
fi

echo ""
echo "Pronto. Para usar:"
echo -e "${CINZA}  cd \"$TRABALHO\" && claude${FIM}"
echo "e digite / para ver as skills."
