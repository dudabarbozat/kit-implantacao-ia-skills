# Diagnóstico — Pão & Cia

> Caso fictício. Empresa, pessoas e números foram inventados para demonstrar o método.

**Data:** 30 de março de 2026
**Conduzido por:** Duda Barboza
**Gerado com:** skill `diagnostico-empresa`
**Empresa:** Pão & Cia — padaria artesanal de bairro
**Porte:** 12 pessoas, 3 setores, aberta de segunda a sábado das 6h às 20h e domingo das 6h às 13h

---

## Visão geral

A Pão & Cia combina produção artesanal, balcão e entrega no bairro. A operação cresceu sem que os processos acompanhassem: quase tudo depende de caderno, memória e do celular de uma pessoa. O objetivo do dono é parar de perder encomendas e tirar a equipe do modo "apagar incêndio" em até 30 dias.

---

## Setores mapeados

### Produção — 4 pessoas (padeiro-chefe + 3 auxiliares)

- **Tarefas diárias:** fornadas de pão a cada hora, bolos, salgados, doces.
- **Ferramentas:** caderno de produção, quadro branco na cozinha.
- **Gargalos:** o plano do dia é passado de boca pelo padeiro-chefe; receitas e quantidades estão na cabeça dele; sobra produto na sexta e no sábado e falta na segunda; a compra de insumos é feita "pelo que costuma faltar".
- **O que mais consome tempo:** cerca de 40 minutos por dia passando anotações do caderno para o quadro (estimativa do padeiro-chefe).
- **Não documentado:** fichas técnicas, quantidades por dia da semana, fornecedores alternativos.

### Atendimento — 5 pessoas (caixa, balcão, WhatsApp)

- **Tarefas diárias:** balcão, caixa, pedidos por telefone e WhatsApp, vitrine.
- **Ferramentas:** WhatsApp no celular de uma atendente, bloco de papel para encomendas.
- **Gargalos:** a mesma atendente cuida do balcão e do WhatsApp; perguntas repetidas (horário, cardápio, preço, entrega); encomendas anotadas em papel sem confirmação para o cliente.
- **O que mais consome tempo:** responder WhatsApp. A equipe estima de 3 a 4 horas para responder uma mensagem fora do pico.
- **Problema relatado:** o gerente estima que cerca de 15% das encomendas têm algum problema (esquecida, data errada, sabor trocado). Não há registro para confirmar.

### Entrega — 3 pessoas

- **Tarefas diárias:** saída de pedidos, cobrança na entrega.
- **Ferramentas:** bilhete de papel vindo do balcão, WhatsApp.
- **Gargalos:** bilhetes ilegíveis ou incompletos; cliente liga para saber se o pedido saiu; acerto de pagamentos no papel ao fim do dia.

---

## Gargalos priorizados

| Prioridade | Gargalo | Setor | Efeito no dia a dia |
|---|---|---|---|
| Alta | Encomendas anotadas em papel, sem confirmação | Atendimento | Encomenda esquecida ou errada, cliente insatisfeito |
| Alta | WhatsApp concentrado em uma pessoa | Atendimento | Demora na resposta, balcão e celular disputando atenção |
| Alta | Conhecimento da produção na cabeça do padeiro-chefe | Produção | Se ele falta, a produção desacelera |
| Média | Sobra e falta de produto por dia da semana | Produção | Descarte no fim de semana, falta na segunda |
| Média | Bilhete de papel entre balcão e entrega | Entrega | Pedido incompleto, retrabalho de ligação |
| Baixa | Sem rotina de gestão da equipe | Todos | Problemas aparecem só quando estouram |

---

## Skills recomendadas

| Skill | Quem usa | O que faz | Gargalo | Prioridade |
|---|---|---|---|---|
| `atendimento-whatsapp` | Atendentes | Redige respostas no tom da padaria para a atendente revisar e enviar; mantém as respostas das perguntas frequentes sempre iguais | WhatsApp concentrado | Alta |
| `encomendas` | Atendentes | Transforma o pedido do cliente em ficha padronizada, gera a mensagem de confirmação e a lista de encomendas do dia | Encomendas em papel | Alta |
| `producao-diaria` | Padeiro-chefe | Monta o plano de produção e a lista de compras a partir do caderno e das encomendas; registra fichas técnicas | Conhecimento na cabeça de uma pessoa | Alta |
| `gestor` | Gerente | Rituais curtos de gestão (daily, quinzena, mês) e briefing de demandas | Sem rotina de gestão | Média |

A ficha de encomenda também resolve o bilhete de papel da entrega: a mesma ficha vai impressa ou por mensagem para quem sai com o pedido.

---

## Fora do escopo das skills

| Pedido que apareceu | Por que não é skill | Caminho sugerido |
|---|---|---|
| "Robô que responde o WhatsApp sozinho à noite" | Skill é acionada por uma pessoa; não fica conectada ao WhatsApp | Avaliar mensagem de ausência e catálogo do WhatsApp Business (gratuitos) |
| Previsão automática de demanda | Não há histórico de vendas registrado | Começar a registrar sobras e faltas por dia com a skill `producao-diaria`; reavaliar em 3 meses |
| Rota otimizada de entrega | Exige integração com mapa e sistema de pedidos | Fora desta fase |
| Programa de fidelidade | Exige cadastro de clientes, que não existe | Fase 2, depois que as encomendas estiverem registradas |

---

## O que precisamos da empresa para começar

- Cardápio com preços atuais (foto do quadro serve)
- Política de encomendas: antecedência, sinal, sabores, tamanhos
- Horários, área e taxa de entrega, pedido mínimo
- 30 minutos com cada pessoa-chave: padeiro-chefe, atendente do WhatsApp, gerente
- Um computador no balcão e um na gerência para instalar o Claude Code

## Linha de base para o relatório

| Indicador | Valor | Origem |
|---|---|---|
| Tempo de resposta no WhatsApp fora do pico | 3 a 4 h | Estimativa da atendente |
| Encomendas com problema | cerca de 15% | Estimativa do gerente, sem registro |
| Tempo diário com anotações de produção | cerca de 40 min | Estimativa do padeiro-chefe |
| Encomendas confirmadas por escrito ao cliente | nenhuma | Observação no diagnóstico |
