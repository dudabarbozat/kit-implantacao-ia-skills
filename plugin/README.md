# Modelo de pacote de skills para um cliente

Esqueleto do repositório que cada cliente recebe. A raiz deste diretório é, ao mesmo tempo, um marketplace de Claude Code com um único plugin e um pacote que pode ser instalado por cópia.

```
plugin/
├── .claude-plugin/
│   ├── marketplace.json     marketplace com um plugin, source "./"
│   └── plugin.json          nome, versão e autor do pacote
├── CLAUDE.md.modelo         contexto da empresa (renomear para CLAUDE.md)
├── skills/
│   └── papel-exemplo/       modelo de skill por papel
├── instalar.sh              instalação por cópia (macOS, Linux, Git Bash)
├── atualizar.sh             atualização por cópia
└── instalar.ps1             instalação por cópia (Windows PowerShell)
```

O exemplo preenchido está em [`../exemplo-padaria/pacote-pao-e-cia/`](../exemplo-padaria/pacote-pao-e-cia/).

## Montar o pacote de um cliente

1. Copie este diretório para um repositório privado do cliente.
2. Troque `SEU-USUARIO`, `SUA-EMPRESA` e `skills-sua-empresa` nos dois JSON.
3. Renomeie `CLAUDE.md.modelo` para `CLAUDE.md` e preencha com o diagnóstico.
4. Crie uma pasta em `skills/` por papel do time, a partir de `papel-exemplo`.
5. A cada mudança, suba a `version` no `plugin.json` e no `marketplace.json`.

## Caminho 1 — plugin (recomendado quando o time usa git)

```bash
claude plugin marketplace add SEU-USUARIO/skills-sua-empresa
claude plugin install skills-sua-empresa@skills-sua-empresa
claude plugin list
```

Atualizar depois de uma nova versão:

```bash
claude plugin marketplace update skills-sua-empresa
claude plugin update skills-sua-empresa@skills-sua-empresa
```

Para testar local, sem publicar:

```bash
claude plugin marketplace add ./caminho/para/o/pacote
```

Plugin instala skills, não o `CLAUDE.md`. Copie o `CLAUDE.md` para a pasta de trabalho do time (`~/<nome-do-pacote>/`) uma vez, ou rode o `instalar.sh` só para essa parte.

## Caminho 2 — cópia (máquina sem git, time não técnico)

```bash
bash instalar.sh /caminho/do/pacote      # escolhe as skills por número
bash atualizar.sh /caminho/do/pacote     # atualiza as instaladas e oferece as novas
```

No Windows:

```powershell
powershell -ExecutionPolicy Bypass -File instalar.ps1 -Pacote C:\caminho\do\pacote
```

Sem argumento, os scripts usam a pasta onde estão.

Os scripts:
- copiam cada skill para `~/.claude/skills/<nome>`;
- criam `~/<nome-do-pacote>/` e colocam o `CLAUDE.md` ali, com backup se já existir uma versão diferente;
- nunca sobrescrevem `~/.claude/CLAUDE.md`, que é pessoal de cada máquina.

## Por que a pasta de trabalho

O `CLAUDE.md` de projeto é carregado quando o Claude Code é aberto naquela pasta. Manter o contexto da empresa em `~/<nome-do-pacote>/CLAUDE.md` separa o que é da empresa do que é pessoal de cada máquina, e dá às skills um lugar fixo para gravar registros (encomendas, planos, relatórios).

## Credenciais

Nenhuma skill deste modelo usa chave de API. Se uma skill do cliente precisar, use variável de ambiente documentada no README do cliente e mantenha o arquivo de credenciais fora do repositório (o `.gitignore` da raiz já ignora `.env`).
