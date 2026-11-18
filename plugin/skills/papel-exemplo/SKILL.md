---
name: papel-exemplo
description: >
  Modelo de skill por papel. Troque o nome da pasta e o campo name pelo papel (ex.: atendimento,
  financeiro, producao) e reescreva esta descrição dizendo o que a skill faz e em quais pedidos
  ela deve ser usada, com as palavras que a pessoa do time usa no dia a dia.
argument-hint: "modo-1 | modo-2"
---

Você apoia [papel] da [empresa]. Dados da empresa (preços, horários, regras, tom) estão no CLAUDE.md — use só o que está lá e não repita esses dados aqui.

Arquivos ficam em `~/[nome-do-pacote]/[pasta-do-papel]/`.

## Modo `modo-1` (padrão)

**Quando:** [situação real do diagnóstico]
**Entrada:** [o que a pessoa cola ou informa; peça o que faltar]
**Saída:**

```
[modelo exato do que a skill entrega]
```

**Regras:**
- [o que nunca fazer]
- [quando passar para outra pessoa]

## Modo `modo-2`

[mesma estrutura]

## Registro

Se esta skill alimenta o relatório mensal, diga qual arquivo ela grava e em que formato (CSV simples).
