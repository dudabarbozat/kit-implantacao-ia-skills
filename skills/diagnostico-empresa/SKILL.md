---
name: diagnostico-empresa
description: >
  Conduz o diagnóstico de uma empresa antes da implantação de skills de IA. Gera roteiro de
  entrevistas por setor, mapeia os processos como realmente acontecem, identifica gargalos e
  prioriza oportunidades de skill. Use ao começar um cliente novo, mapear um setor novo ou revisar
  processos existentes — mesmo que ninguém diga "diagnóstico": vale para pedidos como entrevistar
  o time, mapear processos, conhecer a empresa ou descobrir onde a IA pode ajudar.
---

Você está conduzindo o diagnóstico de uma empresa que vai implantar skills de IA no Claude Code.

## Para que serve este diagnóstico

Antes de criar qualquer skill, é preciso entender como a empresa realmente funciona. Não como ela acha que funciona, nem como o manual diz que deveria ser — mas como as pessoas trabalham no dia a dia.

O diagnóstico é o alicerce de tudo. Skill criada sem diagnóstico é genérica. Skill criada com diagnóstico é parte da empresa.

## O que você precisa saber antes de começar

Pergunte (se ainda não souber):
1. Nome da empresa e setor de atuação
2. Tamanho do time (quantas pessoas, quantos setores)
3. Objetivo principal da implantação de IA
4. Prazo esperado para ver resultado

## Fase 1 — Roteiro de entrevistas por setor

Para cada setor, gere um roteiro adaptado. Entrevistas são individuais: cada pessoa conta a própria rotina.

**Rotina**
- "Me conta como é um dia normal seu, do momento que chega até sair."
- "Quais tarefas você faz todo dia, sem falta?"
- "O que você faz que conseguiria ensinar para alguém em 10 minutos?"

**Ferramentas**
- "Quais ferramentas você usa? (WhatsApp, planilha, caderno, sistema...)"
- "Tem alguma ferramenta que você acha que deveria existir e não existe?"

**Gargalos**
- "O que mais te trava no dia a dia? Onde você perde mais tempo?"
- "O que você faz várias vezes por dia que é sempre igual?"
- "O que mais gera retrabalho aqui?"

**Comunicação**
- "Como você passa informação para outros setores?"
- "De onde vem a informação de que você precisa para trabalhar?"

## Fase 2 — Mapa de processos por setor

```
## Setor: [nome]

**Pessoas:** [quantidade e papel]
**Tarefas diárias:** [lista]
**Ferramentas em uso:** [lista]
**Gargalos principais:** [lista]
**O que mais consome tempo:** [descrição, com a estimativa que a própria equipe deu]
**O que é feito de cabeça (não documentado):** [lista]
**Comunicação com outros setores:** [como funciona]
**Oportunidades de skill:** [lista com prioridade Alta/Média/Baixa]
```

## Fase 3 — Filtro de viabilidade

Antes de recomendar, confira se cada oportunidade é de fato uma skill. Uma skill de Claude Code é um conjunto de instruções e contexto que uma pessoa do time aciona para produzir um texto, um documento, uma análise ou um plano.

| Serve como skill | Não é skill (registrar como outra frente) |
|---|---|
| Redigir respostas padronizadas que a pessoa revisa e envia | Robô que responde clientes sozinho, 24h |
| Transformar anotações soltas em ficha, plano ou checklist | Integração automática entre sistemas |
| Gerar relatório a partir de planilha ou exportação | Coleta de dados em tempo real |
| Guardar conhecimento que hoje está na cabeça de uma pessoa | Previsão estatística sem histórico de dados |

O que não passar no filtro vai para a seção "Fora do escopo das skills" do documento final, com uma sugestão de caminho.

## Fase 4 — Documento final consolidado

```
# Diagnóstico — [Nome da Empresa]
Data: [data]
Conduzido por: [nome] — [consultoria]

## Visão geral
[Resumo da empresa e do momento atual]

## Setores mapeados
[Resumo de cada setor]

## Gargalos priorizados
[Tabela: prioridade | gargalo | setor | efeito no dia a dia]

## Skills recomendadas
[Nome, o que faz, quem usa, gargalo que resolve, prioridade]

## Fora do escopo das skills
[O que apareceu no diagnóstico mas pede outra solução]

## O que precisamos da empresa para começar
[Acessos, materiais, tempo das pessoas]
```

## Regras

- Números só entram se vierem da empresa (registro, planilha ou estimativa da própria equipe). Indique sempre a origem. Não projete ganho percentual.
- Use a linguagem da empresa, não jargão técnico. O documento é lido por donos e gestores.
- Sempre em português.

## Arquivos de saída

- `diagnostico-[empresa]-roteiro.md` — roteiros de entrevista
- `diagnostico-[empresa]-mapa.md` — mapa por setor
- `diagnostico-[empresa]-final.md` — documento consolidado

O documento final é a entrada da skill `proposta-comercial`.
