# kit-implantacao-ia-skills

Método para implantar IA numa empresa usando skills de Claude Code: do diagnóstico ao relatório do primeiro mês. Inclui as skills que conduzem cada etapa, um modelo de pacote para distribuir skills ao time do cliente e um caso fictício completo (uma padaria) com todos os artefatos gerados.

## O problema

A maioria das empresas pequenas e médias já sabe que a IA existe. O que falta é saber por onde começar: qual processo, com quais dados, quem usa, como medir. O resultado comum é uma assinatura de chat que cada pessoa usa do seu jeito, sem contexto da empresa, e que some da rotina em poucas semanas.

O método parte do contrário: primeiro entender como a empresa trabalha de verdade, depois escrever skills pequenas, uma por papel, com o contexto da empresa embutido, e medir contra uma linha de base registrada antes de começar.

## O método

| # | Etapa | Entrada | Saída | Skill |
|---|---|---|---|---|
| 1 | Diagnóstico | Entrevistas individuais por setor | Mapa de processos, gargalos, skills recomendadas, linha de base | `diagnostico-empresa` |
| 2 | Proposta | Diagnóstico | Proposta com problema, skills, cronograma e investimento | `proposta-comercial` |
| 3 | Onboarding | Proposta aceita | Plano de 4 semanas com datas e checklist | `onboarding-cliente` |
| 4 | Criação das skills | Diagnóstico + materiais do cliente | `CLAUDE.md` da empresa + uma skill por papel | modelo em `plugin/skills/papel-exemplo` |
| 5 | Instalação | Pacote de skills | Skills nas máquinas do time (plugin ou cópia) | `plugin/` |
| 6 | Treinamento | Time com as skills instaladas | Uso no fluxo real, ajustes, versão revisada | — |
| 7 | Relatório comparativo | Linha de base + registros gerados pelas skills | Relatório HTML antes x depois | `relatorio-comparativo` |

`briefing-criativo` é uma skill de apoio: prepara peças visuais (por exemplo, para divulgar uma mudança de processo aos clientes da empresa).

## Como as skills se encadeiam

```
entrevistas
    │
    ▼
diagnostico-empresa ──► diagnostico-<empresa>-final.md
    │                       ├─ gargalos priorizados
    │                       ├─ skills recomendadas ─────────────┐
    │                       └─ linha de base ───────────────┐   │
    ▼                                                       │   │
proposta-comercial ──► proposta-<empresa>.md                │   │
    │ (aceite)                                              │   │
    ▼                                                       │   │
onboarding-cliente ──► onboarding-<empresa>.md              │   │
    │                                                       │   │
    ▼                                                       │   ▼
criação ──► pacote do cliente: CLAUDE.md + skills/<papel>/  │
    │            │                                          │
    ▼            └─ as skills gravam registros (CSV) ───┐   │
instalação + treinamento                                │   │
    │                                                   ▼   ▼
    └──────────────────────────────► relatorio-comparativo ──► relatorio-<empresa>.html
                                                         │
                                                         └─► próximas skills (volta ao diagnóstico)
```

Dois pontos sustentam o encadeamento:

- **A linha de base nasce no diagnóstico.** O relatório só compara com o que foi registrado antes de começar, com a origem de cada número declarada.
- **As skills do cliente geram o próprio histórico.** Cada skill que alimenta o relatório grava um CSV simples na pasta de trabalho. O "depois" vem desses arquivos, não de estimativa.

## Caso de exemplo: Pão & Cia

Padaria fictícia com 12 pessoas em produção, atendimento e entrega. Empresa, pessoas e números são inventados.

| Artefato | Arquivo |
|---|---|
| Diagnóstico | [exemplo-padaria/01-diagnostico.md](exemplo-padaria/01-diagnostico.md) |
| Proposta | [exemplo-padaria/02-proposta.md](exemplo-padaria/02-proposta.md) |
| Onboarding | [exemplo-padaria/03-onboarding.md](exemplo-padaria/03-onboarding.md) |
| Pacote de skills do cliente | [exemplo-padaria/pacote-pao-e-cia/](exemplo-padaria/pacote-pao-e-cia/) |
| Relatório do primeiro mês | [exemplo-padaria/04-relatorio-comparativo.html](exemplo-padaria/04-relatorio-comparativo.html) |
| Briefing de peça | [exemplo-padaria/05-briefing-criativo.md](exemplo-padaria/05-briefing-criativo.md) |

O pacote da padaria tem quatro skills, uma por papel: `atendimento-whatsapp` e `encomendas` (atendentes), `producao-diaria` (padeiro-chefe) e `gestor` (gerente, com a metodologia Gestão em Trilha de rituais diário, quinzenal e mensal). Detalhes e decisões de desenho em [exemplo-padaria/README.md](exemplo-padaria/README.md).

## Instalação

Pré-requisito: Claude Code instalado e aberto ao menos uma vez (cria `~/.claude`).

### Cópia direta

```bash
git clone <url-do-repositorio> kit-implantacao-ia-skills
cp -R kit-implantacao-ia-skills/skills/* ~/.claude/skills/
```

No Windows (PowerShell):

```powershell
Copy-Item -Recurse kit-implantacao-ia-skills\skills\* $HOME\.claude\skills\
```

Abra o Claude Code e digite `/` para ver as skills.

### Como plugin

A raiz do repositório é um marketplace com dois plugins: `kit-implantacao` (as skills do método) e `pao-e-cia` (o pacote de exemplo).

```bash
claude plugin marketplace add SEU-USUARIO/kit-implantacao-ia-skills
claude plugin install kit-implantacao@kit-implantacao-ia-skills
claude plugin install pao-e-cia@kit-implantacao-ia-skills    # opcional
```

Para testar sem publicar, use o caminho local no lugar de `SEU-USUARIO/...`.

### Pacote do cliente (exemplo da padaria)

```bash
bash plugin/instalar.sh exemplo-padaria/pacote-pao-e-cia
cd ~/pao-e-cia && claude
```

O instalador pergunta quais skills instalar, copia para `~/.claude/skills` e coloca o `CLAUDE.md` da empresa em `~/pao-e-cia/`. Ver [plugin/README.md](plugin/README.md).

## Estrutura

```
kit-implantacao-ia-skills/
├── .claude-plugin/
│   ├── marketplace.json            marketplace com os dois plugins
│   └── plugin.json                 plugin kit-implantacao (skills/ da raiz)
├── skills/                         skills do método
│   ├── diagnostico-empresa/
│   ├── proposta-comercial/
│   ├── onboarding-cliente/
│   ├── relatorio-comparativo/
│   │   └── references/modelo-relatorio.html
│   └── briefing-criativo/
├── exemplo-padaria/                caso fictício de ponta a ponta
│   ├── 01-diagnostico.md
│   ├── 02-proposta.md
│   ├── 03-onboarding.md
│   ├── 04-relatorio-comparativo.html
│   ├── 05-briefing-criativo.md
│   └── pacote-pao-e-cia/           pacote do cliente (plugin)
│       ├── .claude-plugin/plugin.json
│       ├── CLAUDE.md
│       └── skills/
│           ├── atendimento-whatsapp/
│           ├── encomendas/
│           ├── producao-diaria/
│           └── gestor/references/gestao-em-trilha.md
├── plugin/                         modelo de pacote para um cliente novo
│   ├── .claude-plugin/{marketplace,plugin}.json
│   ├── CLAUDE.md.modelo
│   ├── skills/papel-exemplo/
│   ├── instalar.sh
│   ├── atualizar.sh
│   └── instalar.ps1
├── .gitignore
├── LICENSE
└── README.md
```

## Decisões

- **Uma skill por papel, não uma skill gigante.** Descrições curtas disparam melhor, cada pessoa reconhece a sua ferramenta e cada máquina instala só o necessário.
- **Dados da empresa só no `CLAUDE.md`.** Skills descrevem como trabalhar; preço, horário e regra ficam num arquivo. Mudança de preço não exige mexer em skill.
- **A skill prepara, a pessoa decide.** Nada fala com cliente final sem revisão. O que exigiria automação ou integração vai para "fora do escopo" já no diagnóstico.
- **Sem número sem origem.** As skills do método recusam estimar ganho; todo número do relatório diz de onde veio.
- **Instalação que não quebra a máquina.** Os scripts nunca sobrescrevem `~/.claude/CLAUDE.md` e fazem backup do contexto da empresa antes de atualizar.

## Licença

MIT. Ver [LICENSE](LICENSE).
