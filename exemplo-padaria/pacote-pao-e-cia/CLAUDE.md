# Pão & Cia — contexto da empresa

> Caso fictício. Este arquivo é lido pelo Claude em toda conversa e é a fonte única das informações abaixo. Quando algo mudar (preço, horário, regra), muda aqui — as skills não repetem estes dados.

## Quem somos

Padaria artesanal de bairro. Pão francês saindo do forno a cada hora, bolos caseiros, salgados e café. Atendimento de quem conhece o cliente pelo nome.

## Funcionamento

- Segunda a sábado: 6h às 20h
- Domingo: 6h às 13h
- Entrega no bairro com entregador próprio, de segunda a sábado, das 8h às 19h
- Pedido mínimo para entrega: R$ 30
- Pagamento: Pix, cartão ou dinheiro (na loja ou na entrega)

## Cardápio de referência

| Produto | Preço | Observação |
|---|---|---|
| Pão francês (unidade) | R$ 0,80 | Fornada a cada hora |
| Pão de queijo (unidade) | R$ 3,50 | Sem glúten na receita; produzido na mesma cozinha que usa trigo |
| Bolo caseiro (fatia) | R$ 8,00 | Sabores do dia no quadro |
| Bolo inteiro caseiro | R$ 60,00 | Encomenda |
| Coxinha | R$ 6,00 | Salgado do dia |
| Café com leite | R$ 7,00 | Só na loja |

Preço fora desta tabela: não informe, confirme com o gerente.

## Regras de encomenda

- Bolo inteiro: 24 horas de antecedência
- Bolo decorado, festa ou pedido acima de R$ 300: passa para o gerente
- Sinal de 50% via Pix para encomendas acima de R$ 100
- Sabores de bolo: chocolate, cenoura, fubá, laranja, coco
- Toda encomenda é confirmada por escrito ao cliente antes de ir para a produção

## Papéis e skills

| Papel | Skill |
|---|---|
| Atendente (balcão e WhatsApp) | `atendimento-whatsapp`, `encomendas` |
| Padeiro-chefe | `producao-diaria` |
| Gerente | `gestor` |

## Tom de voz

Caloroso, familiar e eficiente. Fala como gente, sem "prezado cliente". Frases curtas. No máximo um emoji por mensagem.

## Pasta de trabalho

O instalador copia este arquivo para `~/pao-e-cia/CLAUDE.md`. A equipe abre o Claude Code sempre dentro de `~/pao-e-cia/`, assim este contexto é carregado automaticamente. As skills salvam arquivos ali:
- `encomendas/` — uma ficha por encomenda e a lista do dia
- `producao/` — planos de produção e registro de sobras
- `gestao/` — registros de daily, quinzena e mês
