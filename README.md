# Kit de implantação de IA com skills

Método para implantar IA numa empresa com skills de Claude Code, do diagnóstico ao relatório do primeiro mês. Inclui as skills que conduzem cada etapa, um modelo de pacote para distribuir skills ao time do cliente e um caso fictício completo.

## Para quem

Pequenas e médias empresas que sabem que a IA existe, mas não sabem por onde começar: qual processo, com quais dados, quem usa e como medir.

## O método

| # | Etapa | Saída | Skill |
|---|---|---|---|
| 1 | Diagnóstico | Mapa de processos, gargalos, skills recomendadas e linha de base | `diagnostico-empresa` |
| 2 | Proposta | Problema, skills, cronograma e investimento | `proposta-comercial` |
| 3 | Onboarding | Plano de 4 semanas com checklist | `onboarding-cliente` |
| 4 | Criação das skills | `CLAUDE.md` da empresa + uma skill por papel | modelo em `plugin/` |
| 5 | Instalação e treinamento | Skills nas máquinas do time, em uso no fluxo real | `plugin/` |
| 6 | Relatório comparativo | Relatório HTML antes x depois | `relatorio-comparativo` |

`briefing-criativo` apoia a criação de peças visuais.

A linha de base nasce no diagnóstico, e as skills do cliente gravam registros em CSV: o "depois" do relatório vem desses arquivos, não de estimativa.

## Caso de exemplo: Pão & Cia

Padaria fictícia com 12 pessoas; empresa, pessoas e números são inventados. Todos os artefatos estão em [`exemplo-padaria/`](exemplo-padaria/): diagnóstico, proposta, onboarding, [relatório do primeiro mês](exemplo-padaria/04-relatorio-comparativo.html) e o pacote com quatro skills, uma por papel.

## Instalação

Pré-requisito: Claude Code instalado.

```bash
claude plugin marketplace add dudabarbozat/kit-implantacao-ia-skills
claude plugin install kit-implantacao@kit-implantacao-ia-skills
claude plugin install pao-e-cia@kit-implantacao-ia-skills    # exemplo, opcional
```

Ou copie `skills/*` para `~/.claude/skills/`. Para o pacote de um cliente, ver [plugin/README.md](plugin/README.md).

## Decisões

- **Uma skill por papel**, não uma skill gigante: cada pessoa instala só o que usa.
- **Dados da empresa só no `CLAUDE.md`**: mudar um preço não exige mexer em skill.
- **A skill prepara, a pessoa decide**: nada fala com cliente final sem revisão.
- **Sem número sem origem**: todo número do relatório diz de onde veio.

## Licença

[MIT](LICENSE).
