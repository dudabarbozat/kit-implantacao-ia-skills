---
name: relatorio-comparativo
description: >
  Gera relatório HTML visual que compara a evolução de um cliente entre dois períodos ou duas
  versões da implantação de skills — o que mudou, quais recomendações foram aplicadas, o progresso
  real e os próximos passos. Use para relatório de acompanhamento, apresentação de resultado,
  comparação v1 x v2 ou pedidos como "relatório", "mostrar evolução", "comparativo", "como estamos
  indo" ou "o que melhorou".
---

Você está gerando um relatório comparativo de implantação de skills.

## Para que serve

É a prova de que a implantação funciona. Mostra a história de como a empresa estava antes e como está agora — com dado quando houver, com relato quando não houver.

Para o cliente, responde: "valeu a pena?". Para a consultoria, é o momento de propor os próximos passos.

## O que você precisa antes de começar

Se ainda não tiver, peça:
- Nome do cliente e os dois períodos (ex.: março x abril, ou v1 x v2)
- A linha de base registrada no diagnóstico/onboarding
- Os dados do período atual (planilha, contagem, registro do time)
- As recomendações feitas no período anterior
- O que mudou nas skills desde a última versão

## Regra de ouro dos números

- Só use números que o cliente forneceu ou que estão nos registros. Nunca estime ganho.
- Cada número tem origem declarada (planilha, contagem manual, estimativa da equipe).
- Se o "antes" e o "depois" foram medidos de formas diferentes, diga isso no relatório.
- Sem dado, use relato: "a atendente conta que deixou de ...".

## Estrutura

1. **Cabeçalho** — empresa, período anterior → período atual, data.
2. **Resumo em 3 números** — os três indicadores que melhor contam a história.
3. **Antes** — skills instaladas, como eram usadas, problemas, recomendações feitas.
4. **Agora** — tabela `Item | Antes | Agora | Origem do dado`.
5. **Recomendações aplicadas** — checklist com o que foi feito e quando.
6. **Resultados do período** — impacto descrito com dado ou relato.
7. **O que ainda pode melhorar** — honesto, com plano.
8. **Próximos passos** — o que será criado ou ajustado, data do próximo relatório.

## Formato HTML

Use o modelo em `references/modelo-relatorio.html` como ponto de partida. Paleta padrão (troque pela identidade do cliente se ela estiver no CLAUDE.md dele):

```
fundo: #0d0f14     cartões: #12151c    texto: #dce0ea   texto-suave: #8a93a8
destaque: #3dffa0  laranja: #ff7c3a    azul: #38bfff    borda: rgba(255,255,255,0.07)
```

- Arquivo único, sem fontes, scripts ou imagens externas — precisa abrir offline e ser enviado por e-mail ou WhatsApp.
- Legível no celular (uma coluna abaixo de 640px).

## Saída

`relatorio-[cliente]-[periodo].html`
