# Exemplo: Pão & Cia

Caso fictício, de ponta a ponta. Empresa, pessoas e números foram inventados para mostrar o que cada etapa do método produz. Nenhum dado vem de cliente real.

A Pão & Cia é uma padaria de bairro com 12 pessoas em três setores (produção, atendimento, entrega). O problema de partida: encomendas em papel, WhatsApp concentrado em uma pessoa e produção dependente do padeiro-chefe.

## Artefatos, na ordem em que são produzidos

| Arquivo | Etapa | Skill que gera |
|---|---|---|
| [01-diagnostico.md](01-diagnostico.md) | Diagnóstico, gargalos, skills recomendadas, o que fica fora, linha de base | `diagnostico-empresa` |
| [02-proposta.md](02-proposta.md) | Proposta comercial com as 4 skills | `proposta-comercial` |
| [03-onboarding.md](03-onboarding.md) | Cronograma das 4 semanas com datas | `onboarding-cliente` |
| [pacote-pao-e-cia/](pacote-pao-e-cia/) | As skills criadas para o cliente, empacotadas como plugin | criação manual a partir do diagnóstico |
| [04-relatorio-comparativo.html](04-relatorio-comparativo.html) | Relatório do primeiro mês, antes x depois | `relatorio-comparativo` |
| [05-briefing-criativo.md](05-briefing-criativo.md) | Peça para divulgar a nova rotina de encomendas | `briefing-criativo` |

## O pacote do cliente

```
pacote-pao-e-cia/
├── .claude-plugin/plugin.json
├── CLAUDE.md                     contexto único: horários, cardápio, regras, tom
└── skills/
    ├── atendimento-whatsapp/     atendente — prepara respostas para revisar e enviar
    ├── encomendas/               atendente — ficha, confirmação, lista do dia, registro
    ├── producao-diaria/          padeiro-chefe — plano, sobras, compras, receitas
    └── gestor/                   gerente — rituais da Gestão em Trilha
        └── references/gestao-em-trilha.md
```

Decisões de desenho:

- **Uma skill por papel.** Cada pessoa reconhece a sua ferramenta e cada máquina instala só o que usa.
- **Dados da empresa num só lugar.** Preço, horário e regra moram no `CLAUDE.md`. As skills dizem como trabalhar, não repetem os dados — mudar o preço do bolo é editar uma linha.
- **A skill prepara, a pessoa decide.** Nenhuma skill fala com cliente diretamente. O que exigiria isso foi para "Fora do escopo" no diagnóstico.
- **As skills geram o próprio histórico.** `encomendas` e `producao-diaria` gravam CSVs simples que viram a fonte dos números do relatório seguinte.

## Coerência entre os artefatos

- Os gargalos do diagnóstico são os mesmos da proposta, com os mesmos números e a mesma origem (estimativa da equipe).
- As 4 skills da proposta são as 4 do pacote.
- A linha de base do diagnóstico é o "antes" do relatório; o "agora" vem dos arquivos que as skills gravam.
- As regras de encomenda citadas no briefing são as do `CLAUDE.md`.
