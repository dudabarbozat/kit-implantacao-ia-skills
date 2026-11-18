#!/usr/bin/env bash
# Atualizador de skills por cópia.
#
# Uso:
#   bash atualizar.sh [pasta-do-pacote]
#
# O que faz:
#   1. Atualiza as skills do pacote que já estão em ~/.claude/skills.
#   2. Lista as skills novas do pacote e pergunta se quer instalar.
#   3. Atualiza ~/<nome-do-pacote>/CLAUDE.md (com backup se houver mudança local).
#   Skills que não são do pacote não são tocadas.

set -euo pipefail

PACOTE="${1:-$(cd "$(dirname "$0")" && pwd)}"
PACOTE="$(cd "$PACOTE" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"

VERDE='\033[0;32m'; AMARELO='\033[1;33m'; VERMELHO='\033[0;31m'; FIM='\033[0m'

if [ ! -f "$PACOTE/.claude-plugin/plugin.json" ] || [ ! -d "$PACOTE/skills" ]; then
  echo -e "${VERMELHO}Pacote inválido: $PACOTE${FIM}"
  exit 1
fi

NOME="$(sed -n 's/.*"name"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$PACOTE/.claude-plugin/plugin.json" | head -n 1)"
TRABALHO="$HOME/$NOME"

INSTALADAS=(); NOVAS=()
for arquivo in "$PACOTE"/skills/*/SKILL.md; do
  [ -f "$arquivo" ] || continue
  nome="$(basename "$(dirname "$arquivo")")"
  if [ -d "$SKILLS_DIR/$nome" ]; then INSTALADAS+=("$nome"); else NOVAS+=("$nome"); fi
done

if [ "${#INSTALADAS[@]}" -eq 0 ]; then
  echo -e "${AMARELO}Nenhuma skill deste pacote instalada. Use instalar.sh.${FIM}"
  exit 0
fi

for nome in "${INSTALADAS[@]}"; do
  rm -rf "${SKILLS_DIR:?}/$nome"
  cp -R "$PACOTE/skills/$nome" "$SKILLS_DIR/$nome"
  echo -e "${VERDE}[ok] /$nome atualizada${FIM}"
done

if [ "${#NOVAS[@]}" -gt 0 ]; then
  echo ""
  echo "Skills novas nesta versão:"
  for i in "${!NOVAS[@]}"; do printf "  %2d. %s\n" "$((i + 1))" "${NOVAS[$i]}"; done
  read -r -p "Números para instalar (Enter para pular): " ESCOLHA
  if [ -n "$ESCOLHA" ]; then
    IFS=',' read -ra NUMEROS <<< "$ESCOLHA"
    for n in "${NUMEROS[@]}"; do
      n="$(echo "$n" | tr -d ' ')"
      if [[ "$n" =~ ^[0-9]+$ ]] && [ "$n" -ge 1 ] && [ "$n" -le "${#NOVAS[@]}" ]; then
        cp -R "$PACOTE/skills/${NOVAS[$((n - 1))]}" "$SKILLS_DIR/${NOVAS[$((n - 1))]}"
        echo -e "${VERDE}[ok] /${NOVAS[$((n - 1))]} instalada${FIM}"
      fi
    done
  fi
fi

if [ -f "$PACOTE/CLAUDE.md" ]; then
  mkdir -p "$TRABALHO"
  if [ -f "$TRABALHO/CLAUDE.md" ] && ! cmp -s "$PACOTE/CLAUDE.md" "$TRABALHO/CLAUDE.md"; then
    cp "$TRABALHO/CLAUDE.md" "$TRABALHO/CLAUDE.md.bak-$(date +%Y%m%d%H%M%S)"
    echo -e "${AMARELO}[!] Backup do CLAUDE.md anterior criado em $TRABALHO${FIM}"
  fi
  cp "$PACOTE/CLAUDE.md" "$TRABALHO/CLAUDE.md"
  echo -e "${VERDE}[ok] CLAUDE.md atualizado${FIM}"
fi

echo ""
echo "Atualizado. Feche e abra o Claude Code de novo para carregar as mudanças."
