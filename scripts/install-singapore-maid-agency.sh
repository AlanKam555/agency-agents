#!/usr/bin/env bash
#
# install-singapore-maid-agency.sh
# Install ONLY the Singapore Maid Agency Kit agents into your AI tool.
#
# For any licensed employment agency (EA) in Singapore. MIT licensed.
#
# Usage:
#   ./scripts/install-singapore-maid-agency.sh [--tool <name>] [--dest <dir>] [--help]
#
# Tools:
#   claude-code  Copy agents to ~/.claude/agents/ (default if detected)
#   copilot      Copy agents to ~/.github/agents/
#   cursor       Write .mdc rules to .cursor/rules/ in --dest (default: cwd)
#   folder       Copy raw .md agents to --dest (for Drive / Custom GPT uploads)
#   all          Install for every tool above that makes sense
#
# No AI tool? Open singapore-maid-agency/START-HERE.md Path A (CHAT-PROMPTS.md).
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC_DIR="$REPO_ROOT/singapore-maid-agency"

if [[ -t 1 ]]; then
  C_GREEN=$'\033[0;32m'; C_YELLOW=$'\033[1;33m'; C_RED=$'\033[0;31m'
  C_BOLD=$'\033[1m'; C_DIM=$'\033[2m'; C_RESET=$'\033[0m'
else
  C_GREEN=''; C_YELLOW=''; C_RED=''; C_BOLD=''; C_DIM=''; C_RESET=''
fi
ok()   { printf "${C_GREEN}[OK]${C_RESET}  %s\n" "$*"; }
warn() { printf "${C_YELLOW}[!!]${C_RESET}  %s\n" "$*"; }
err()  { printf "${C_RED}[ERR]${C_RESET} %s\n" "$*" >&2; }

usage() {
  sed -n '3,22p' "$0" | sed 's/^# \{0,1\}//'
  exit 0
}

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//'
}

get_field() {
  local field="$1" file="$2"
  awk -v f="$field" '
    /^---$/ { fm++; next }
    fm == 1 && $0 ~ "^" f ": " { sub("^" f ": ", ""); print; exit }
  ' "$file"
}

get_body() {
  awk 'BEGIN{n=0} /^---$/{n++; next} n>=2{print}' "$1"
}

list_agent_files() {
  local f
  while IFS= read -r -d '' f; do
    [[ "$(basename "$f")" == "README.md" ]] && continue
    [[ "$(basename "$f")" == START-HERE.md ]] && continue
    [[ "$(basename "$f")" == CHAT-PROMPTS.md ]] && continue
    [[ "$(basename "$f")" == playbook-*.md ]] && continue
    [[ "$(head -1 "$f")" == "---" ]] || continue
    printf '%s\0' "$f"
  done < <(find "$SRC_DIR" -maxdepth 1 -name "*.md" -type f -print0 | sort -z)
}

install_claude_code() {
  local dest="${HOME}/.claude/agents"
  local count=0 f
  mkdir -p "$dest"
  while IFS= read -r -d '' f; do
    cp "$f" "$dest/"
    (( count++ )) || true
  done < <(list_agent_files)
  ok "Claude Code: $count SG agents -> $dest"
}

install_copilot() {
  local dest="${HOME}/.github/agents"
  local count=0 f
  mkdir -p "$dest"
  while IFS= read -r -d '' f; do
    cp "$f" "$dest/"
    (( count++ )) || true
  done < <(list_agent_files)
  ok "Copilot: $count SG agents -> $dest"
}

install_cursor() {
  local dest="${1}/.cursor/rules"
  local count=0 f name description slug body
  mkdir -p "$dest"
  while IFS= read -r -d '' f; do
    name="$(get_field "name" "$f")"
    description="$(get_field "description" "$f")"
    [[ -n "$name" ]] || continue
    slug="$(slugify "$name")"
    body="$(get_body "$f")"
    cat > "$dest/${slug}.mdc" <<EOF
---
description: ${description}
globs: ""
alwaysApply: false
---
${body}
EOF
    (( count++ )) || true
  done < <(list_agent_files)
  ok "Cursor: $count SG rules -> $dest"
  warn "Cursor rules are project-scoped. Open that project in Cursor, then @-mention an agent."
}

install_folder() {
  local dest="$1"
  local count=0 f
  mkdir -p "$dest"
  while IFS= read -r -d '' f; do
    cp "$f" "$dest/"
    (( count++ )) || true
  done < <(list_agent_files)
  # Also copy adoption docs
  for doc in START-HERE.md CHAT-PROMPTS.md STAFF-CHEATSHEET.md FAQ.md README.md playbook-matching.md playbook-marketing.md; do
    cp "$SRC_DIR/$doc" "$dest/" 2>/dev/null || true
  done
  cp -R "$SRC_DIR/toolkit" "$dest/toolkit" 2>/dev/null || true
  ok "Folder pack: $count agents (+ START-HERE, prompts, cheatsheet, FAQ, toolkit) -> $dest"
  warn "Start staff on START-HERE.md (first-week plan). Upload agent .md files into Custom GPTs / Claude Projects if needed."
}

main() {
  local tool="auto"
  local dest="${PWD}"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --tool) tool="${2:?'--tool requires a value'}"; shift 2 ;;
      --dest) dest="${2:?'--dest requires a value'}"; shift 2 ;;
      --help|-h) usage ;;
      *) err "Unknown option: $1"; usage ;;
    esac
  done

  [[ -d "$SRC_DIR" ]] || { err "Missing $SRC_DIR"; exit 1; }

  printf "\n${C_BOLD}Singapore Maid Agency Kit — installer${C_RESET}\n"
  printf "  Repo: %s\n" "$REPO_ROOT"
  printf "  For:  any licensed EA in Singapore (MIT)\n"
  printf "  Docs: singapore-maid-agency/START-HERE.md\n\n"

  if [[ "$tool" == "auto" ]]; then
    local installed_any=false
    if [[ -d "${HOME}/.claude" ]] || command -v claude >/dev/null 2>&1; then
      install_claude_code; installed_any=true
    fi
    install_cursor "$dest"; installed_any=true
    if ! $installed_any; then
      warn "No tools detected. Writing a shareable folder pack instead."
      install_folder "${dest}/singapore-maid-agency-kit"
    fi
  else
    case "$tool" in
      claude-code) install_claude_code ;;
      copilot)     install_copilot ;;
      cursor)      install_cursor "$dest" ;;
      folder)      install_folder "${dest}/singapore-maid-agency-kit" ;;
      all)
        install_claude_code
        install_copilot
        install_cursor "$dest"
        install_folder "${dest}/singapore-maid-agency-kit"
        ;;
      *) err "Unknown tool '$tool'. Use: claude-code|copilot|cursor|folder|all"; exit 1 ;;
    esac
  fi

  printf "\n${C_DIM}No Cursor/Claude? Use Path A: singapore-maid-agency/CHAT-PROMPTS.md${C_RESET}\n"
  printf "${C_DIM}Forms/SOPs: singapore-maid-agency/toolkit/${C_RESET}\n\n"
}

main "$@"
