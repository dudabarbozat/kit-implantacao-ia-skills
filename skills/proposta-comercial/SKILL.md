---
name: proposta-comercial
description: >
  Gera a proposta comercial de implantação de skills de IA a partir do diagnóstico da empresa.
  Transforma o mapeamento de processos em um documento que explica o problema, a solução em
  skills, o processo de implantação, os entregáveis, o prazo e o investimento. Use quando um
  cliente estiver pronto para receber proposta — inclusive em pedidos como "monta a proposta",
  "preciso apresentar para o cliente" ou "como a gente fecha com eles".
---

Você está criando uma proposta comercial de implantação de skills de IA.

## Objetivo

Mostrar para uma empresa que skills customizadas resolvem problemas que ela já reconhece — e que o processo de implantação é claro, curto e acompanhado.

A proposta fala com pessoas que não são técnicas. Quem ler precisa pensar: "entenderam a minha empresa".

## O que você precisa antes de começar

Se ainda não tiver, peça:
- O diagnóstico final (`diagnostico-[empresa]-final.md`) ou um resumo do que foi levantado
- As skills priorizadas
- O plano escolhido (Plano A / Plano B / Plano C) e o valor — **nunca invente valor**; se não for informado, deixe `R$ [valor]`

## Estrutura

### 1. Cabeçalho
```
Proposta Comercial
[Nome da Empresa]
Preparada por: [nome] — [consultoria]
Data: [data]
Validade: [prazo]
```

### 2. Entendemos sua empresa
Descreva a empresa, o momento atual e o que apareceu no diagnóstico. O cliente precisa se reconhecer no texto.

### 3. O problema identificado
O que está travando a operação, com exemplos do diagnóstico e na linguagem da empresa. Números só se vieram do diagnóstico, com a origem.

> "No atendimento, a equipe estima que uma mensagem fora do pico leva de 3 a 4 horas para ser respondida."

### 4. A solução: skills customizadas

Explique o que é uma skill, sem exagero:

> "Uma skill é um conjunto de instruções que o Claude segue sempre que alguém do time pede aquela tarefa. Ela carrega o contexto da empresa — produtos, regras, jeito de falar — então ninguém precisa explicar tudo de novo a cada pedido. A pessoa continua no controle: revisa e decide o que sai."

Deixe claro o que a skill não faz (ex.: não responde clientes sozinha, não se conecta a sistemas sem integração).

### 5. O que será entregue

| Skill | Quem usa | O que faz | Problema que resolve |
|---|---|---|---|
| [nome] | [papel] | [descrição simples] | [gargalo do diagnóstico] |

Inclua também o que fica para uma fase seguinte, se houver.

### 6. Como vai funcionar — 4 semanas

**Semana 1 — Diagnóstico aprofundado:** entrevistas, validação das prioridades.
**Semana 2 — Criação:** skills escritas com o contexto da empresa, testadas internamente.
**Semana 3 — Instalação e testes com o time:** pacote instalado nas máquinas, uso real, ajustes.
**Semana 4 — Treinamento e consolidação:** treinamento, rotina de uso, relatório do primeiro mês.

### 7. O que precisamos de vocês
- Tempo das pessoas para entrevistas e testes
- Materiais (cardápio, tabela de preços, políticas, modelos já usados)
- Acesso às máquinas onde o Claude Code será instalado
- Uma pessoa de contato

### 8. Investimento
Plano, valor, forma de pagamento e o que está incluído. Use apenas os valores informados.

### 9. Próximos passos
Uma ação simples: confirmar interesse, agendar 30 minutos de alinhamento, iniciar o diagnóstico na semana seguinte.

## Tom

Acolhedor, direto, confiante. Sem promessa de resultado em percentual. Sem jargão.

## Saída

Markdown: `proposta-[empresa]-[data].md`. Se pedirem HTML, gere um arquivo único, sem dependências externas.

Depois do aceite, o próximo passo é a skill `onboarding-cliente`.
