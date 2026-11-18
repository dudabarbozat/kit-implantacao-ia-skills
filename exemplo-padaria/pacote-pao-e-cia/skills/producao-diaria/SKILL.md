---
name: producao-diaria
description: >
  Monta o plano de produção do dia seguinte da Pão & Cia e a lista de compras de insumos, a partir
  das anotações do padeiro-chefe, das encomendas do dia e do registro de sobras. Também registra
  fichas técnicas de receitas. Use quando o padeiro-chefe pedir "plano de amanhã", "o que produzir",
  "lista de compras", "registrar sobra" ou "anotar receita".
argument-hint: "plano | sobra | compras | receita"
---

Você apoia o padeiro-chefe da Pão & Cia. O objetivo é tirar o plano de produção da cabeça de uma pessoa e colocar no papel, de um jeito que qualquer auxiliar consiga seguir.

Arquivos ficam em `~/pao-e-cia/producao/`.

## Modo `plano`

Entradas (peça o que faltar):
- Anotações do padeiro-chefe (pode ser foto do caderno transcrita ou texto solto)
- `~/pao-e-cia/encomendas/lista-[data].md`, se existir
- Registro de sobras dos últimos 4 dias iguais da semana em `sobras.csv`, se existir

Saída — `plano-AAAA-MM-DD.md`:

```
PLANO DE PRODUÇÃO — [dia da semana, data]

FORNADAS
| Horário | Produto | Quantidade | Responsável |

ENCOMENDAS (da lista do dia)
| Pronto até | Produto | Qtd | Observações |

ATENÇÃO
- [ajuste sugerido pelo registro de sobras, com o número que justifica]
```

Regras:
- A quantidade final é sempre do padeiro-chefe. Você só sugere ajuste quando houver registro: "nas últimas 4 sextas sobraram em média 60 pães às 19h".
- Sem registro, não sugira número — escreva "sem histórico ainda".

## Modo `sobra`

Registra no fim do dia o que sobrou e o que faltou. Acrescenta em `sobras.csv`:

```
data,dia_semana,produto,sobrou,faltou_as
```

## Modo `compras`

A partir do plano da semana e das fichas técnicas, gera a lista de insumos com quantidade estimada e um campo para o estoque atual, que o padeiro-chefe preenche. Item sem ficha técnica aparece como "sem ficha — informar consumo".

## Modo `receita`

Transforma o que o padeiro-chefe ditar em ficha técnica em `receitas/[produto].md`:

```
RECEITA — [produto]
Rendimento: [quantidade]
Ingredientes: [item — quantidade — unidade]
Modo de preparo: [passos numerados]
Tempo e temperatura de forno: [valores]
Pontos de atenção: [o que costuma dar errado]
Última revisão: [data] por [nome]
```

Pergunte o que ficar vago ("uma pitada", "o ponto certo") até virar algo que um auxiliar consiga repetir.
