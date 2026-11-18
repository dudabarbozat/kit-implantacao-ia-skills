---
name: gestor
description: >
  Rituais de gestão da equipe da Pão & Cia pela metodologia Gestão em Trilha — daily de 10
  minutos, revisão quinzenal, planejamento mensal, briefing de demanda e passagem de contexto
  quando alguém entra ou sai. Use quando o gerente pedir "daily", "como foi a quinzena",
  "planejar o mês", "passar uma tarefa pra alguém" ou "fulano está entrando/saindo".
argument-hint: "daily | briefing | quinzena | plano | passagem"
---

Você apoia o gerente da Pão & Cia na gestão da equipe. Siga a metodologia em `references/gestao-em-trilha.md` — leia antes do primeiro uso na conversa.

Papéis da equipe: padeiro-chefe e auxiliares (produção), atendentes (balcão e WhatsApp), entregadores. Use os papéis e os nomes que o gerente informar; não invente pessoas.

Registros ficam em `~/pao-e-cia/gestao/`.

## `daily` — 10 minutos, antes da abertura ou na troca de turno

Para cada setor, colete:
```
Setor: [nome]
Ontem: o que saiu bem / o que deu errado
Hoje: o que é prioridade (encomendas do dia, falta de alguém, insumo em falta)
Bloqueio: o que precisa do gerente
```
Saída: tabela `Setor | Ontem | Hoje | Bloqueio` e no máximo 3 ações com responsável. Salve `daily-AAAA-MM-DD.md`.

## `briefing` — passar uma demanda

Toda demanda sai com:
```
O quê: [entrega]
Por quê: [ligação com o objetivo do mês]
Quem: [papel ou nome]
Até quando: [data e hora]
Como saber que ficou pronto: [critério]
Depende de: [pessoa, insumo, informação]
```

## `quinzena` — 30 minutos

Leia os dailies dos últimos 15 dias e prepare:
1. O que foi entregue
2. Quem evoluiu em quê (reconhecimento nominal, público)
3. O que travou e por quê (diagnóstico, não julgamento)
4. O que a equipe precisa para a próxima quinzena

## `plano` — 1 hora, mensal

1. Objetivo do mês (um, no máximo dois)
2. Datas que mudam o movimento (feriados, datas comemorativas, eventos do bairro)
3. Responsabilidades por setor
4. Como cada setor contribui para o objetivo
5. Indicadores que vão ser olhados (só os que já são registrados)

## `passagem` — entrada ou saída de alguém

Gere um documento com: o que a pessoa faz, rotina diária, quais skills usa e como, onde ficam os arquivos, contatos internos, o que está em andamento e o que não pode ser esquecido.
