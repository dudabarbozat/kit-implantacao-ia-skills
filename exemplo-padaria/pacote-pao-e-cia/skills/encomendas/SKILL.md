---
name: encomendas
description: >
  Registra encomendas da Pão & Cia em ficha padronizada, gera a mensagem de confirmação para o
  cliente e monta a lista de encomendas do dia para produção e entrega. Use quando chegar um pedido
  com data futura ("quero encomendar", "bolo pra sábado", "anota essa encomenda") ou quando pedirem
  "encomendas de amanhã", "lista do dia", "o que tem pra sexta".
argument-hint: "nova | lista [data] | alterar"
---

Você registra e organiza as encomendas da Pão & Cia. As regras (antecedência, sinal, sabores, limite para o gerente) estão no CLAUDE.md da empresa.

Arquivos ficam em `~/pao-e-cia/encomendas/`.

## Modo `nova` (padrão)

1. Leia o pedido (mensagem colada ou anotação da atendente).
2. Preencha a ficha. Campo que não veio no pedido fica `FALTA` — não suponha.
3. Verifique as regras: antecedência, sinal, sabor disponível, limite de valor.
4. Salve `AAAA-MM-DD-[nome-cliente]-[produto].md` com a ficha.
5. Entregue a mensagem de confirmação pronta para enviar ao cliente.

### Ficha

```
ENCOMENDA — [data de entrega] [horário]
Cliente: [nome]            Contato: [como falar com o cliente]
Produto: [item, tamanho, sabor, quantidade]
Observações: [escrita no bolo, restrição, etc.]
Retirada ou entrega: [retirada / entrega — endereço]
Quem retira: [nome, se for outra pessoa]
Valor: [pelo cardápio]     Sinal: [valor e se foi pago]
Pagamento do restante: [forma]
Registrada por: [atendente]  em [data e hora]
Status: AGUARDANDO CONFIRMAÇÃO
```

### Confirmação para o cliente

Mensagem curta, no tom da padaria, que repete **todos** os itens da ficha e pede um "ok". Só depois do "ok" o status vira `CONFIRMADA`.

### Bloqueios

- Menos de 24h para bolo inteiro: avise a atendente e sugira a data mais próxima possível.
- Sabor fora da lista, bolo decorado ou valor acima de R$ 300: ficha com status `PARA O GERENTE`.

## Modo `lista [data]`

Leia as fichas da data (padrão: amanhã) e gere:

```
ENCOMENDAS — [dia da semana, data]

PRODUÇÃO (ordenado por horário)
| Horário | Produto | Qtd | Observações |

ENTREGA
| Horário | Cliente | Endereço | A receber |

PENDÊNCIAS
- [fichas com FALTA, sem confirmação ou PARA O GERENTE]
```

Salve como `lista-AAAA-MM-DD.md`. Essa lista vai para o padeiro-chefe (entrada da skill `producao-diaria`) e para o entregador.

## Modo `alterar`

Localize a ficha, aplique a mudança, registre embaixo `Alterado em [data] por [atendente]: [o quê]` e gere nova confirmação para o cliente.

## Registro para o relatório mensal

No fim de cada `lista`, acrescente uma linha em `~/pao-e-cia/encomendas/registro.csv`:

```
data,total_encomendas,confirmadas,pendentes,com_problema_relatado
```

`com_problema_relatado` é preenchido pela atendente no dia seguinte. Esse arquivo é a origem dos números do relatório comparativo.
