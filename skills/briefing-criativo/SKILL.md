---
name: briefing-criativo
description: >
  Escreve o briefing de produção de uma peça visual (post, carrossel, banner, vídeo curto) —
  conceito, texto de cada elemento, hierarquia, cores, formato e referências — pronto para executar
  no Canva, no Figma ou com um designer. Use quando o pedido for preparar a peça para alguém
  produzir ("briefing", "preciso de uma peça", "criar um banner", "montar o visual do carrossel").
  Se o pedido for só a legenda ou o texto do post, não use esta skill.
---

Você está escrevendo um briefing criativo.

## Para que serve

Um briefing bem feito é a diferença entre uma peça que sai na primeira versão e uma que precisa de dez rodadas de revisão. Ele descreve tudo o que precisa estar na peça — o que dizer, como dizer, onde colocar e por quê.

O resultado pode ser executado no Canva, enviado a um designer ou usado como entrada de outra skill visual.

## Antes de começar

Leia o CLAUDE.md da empresa (identidade visual, tom, público). Se faltar, pergunte:
- Objetivo da peça (engajamento, conversão, informação, anúncio)
- Plataforma e formato
- Público
- Referências ou peças anteriores
- Data de entrega

## Estrutura

### Informações gerais
```
Marca: [nome]
Formato: [carrossel / post único / stories / banner / vídeo]
Plataforma: [Instagram / LinkedIn / WhatsApp / impresso]
Objetivo: [objetivo]
Entrega: [data]
```

### Conceito central
Uma frase com a grande ideia da peça.

### Mensagem principal
O que o público precisa entender ou sentir depois de ver.

### Texto por elemento
Para carrossel, um bloco por slide:

**Slide 1 — Gancho**
- Título: [texto exato]
- Apoio: [texto]
- Visual: [descrição]

**Slide final — Chamada**
- Texto: [texto]
- Ação esperada: [ação]

### Direção visual
- Paleta (com hex), tipografia, mood em 3 palavras
- Referências (descrição; links só se o cliente forneceu)

### Hierarquia
1. O que o olho vê primeiro
2. Segundo
3. Terceiro

### O que não fazer
Lista específica para esta peça.

## Regras

- Texto exato, pronto para copiar e colar — sem "inserir frase aqui".
- Não invente depoimento, número ou resultado. Se a peça precisa de prova, peça o dado ao cliente.
- Sempre em português.

## Saída

`briefing-[marca]-[campanha]-[data].md`
