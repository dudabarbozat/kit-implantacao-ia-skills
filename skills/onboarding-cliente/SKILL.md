---
name: onboarding-cliente
description: >
  Cria o plano de onboarding de um cliente que acabou de fechar a implantação de skills —
  cronograma das 4 semanas com datas reais, checklist de entregáveis, rotina de acompanhamento e
  marcos. Use quando o contrato for fechado ou em pedidos como "cliente fechou", "vamos começar a
  implantação", "preciso organizar as primeiras semanas" ou "como eu inicio com esse cliente".
---

Você está criando o plano de onboarding de um cliente de implantação de skills.

## Para que serve

O onboarding transforma um contrato assinado em uma implantação que funciona. É o mapa das primeiras semanas: quem faz o quê, quando, e o que precisa estar pronto para a etapa seguinte.

Ele evita:
- Cliente sem saber o que esperar
- Consultoria sem saber o que priorizar
- Skill criada sem contexto suficiente
- Treinamento antes de o time estar pronto

## O que você precisa antes de começar

Se ainda não tiver, pergunte:
- Nome da empresa e plano contratado
- Skills previstas na proposta
- Data de início
- Ponto de contato do lado do cliente
- Setor prioritário

## Estrutura do plano

### Semana 1 — Descoberta
**Objetivo:** conhecer a empresa antes de criar qualquer coisa.
- [ ] Kick-off com o cliente (1h): processo, expectativas, contatos
- [ ] Entrevistas individuais com pessoas-chave de cada setor
- [ ] Coleta de materiais (preços, políticas, modelos, anotações)
- [ ] Validação das skills priorizadas com o cliente

Entregável: mapa de diagnóstico por setor validado.

### Semana 2 — Criação
**Objetivo:** escrever as skills com o contexto real.
- [ ] Criar as skills priorizadas e o arquivo de contexto da empresa (CLAUDE.md)
- [ ] Testar internamente com casos reais coletados na semana 1
- [ ] Apresentar a primeira skill ao ponto de contato e ajustar
- [ ] Escrever o guia de uso de cada skill

Entregável: skills funcionando + guia de uso.

### Semana 3 — Instalação e testes com o time
**Objetivo:** colocar as skills nas máquinas e no fluxo real.
- [ ] Instalar o Claude Code nas máquinas do time
- [ ] Instalar o pacote de skills (plugin ou script de instalação)
- [ ] Acompanhar o uso nos primeiros dias
- [ ] Coletar feedback e ajustar

Entregável: time usando as skills no dia a dia.

### Semana 4 — Treinamento e consolidação
**Objetivo:** fechar o que não funcionou e estabelecer a rotina.
- [ ] Sessão de treinamento (1–2h)
- [ ] Reunião de revisão com o cliente
- [ ] Publicar a versão revisada do pacote (atualizador)
- [ ] Definir cadência de relatório (semanal, quinzenal ou mensal)
- [ ] Planejar as próximas skills, se o escopo permitir

Entregável: relatório do primeiro mês (skill `relatorio-comparativo`) + plano de continuidade.

## Checklist geral

**Antes do kick-off**
- [ ] Contrato assinado
- [ ] Data de início definida
- [ ] Ponto de contato identificado
- [ ] Linha de base registrada (os números do diagnóstico que serão comparados no relatório)

**Durante**
- [ ] Diagnóstico registrado
- [ ] Skills aprovadas pelo cliente antes da instalação
- [ ] Time treinado e com acesso funcionando
- [ ] Primeira rodada de feedback coletada

**Ao final do mês**
- [ ] Relatório do primeiro mês entregue
- [ ] Cliente sabe onde pedir ajuda
- [ ] Próximas etapas definidas

## Comunicação durante o onboarding

- Check-in semanal por mensagem (curto, sem reunião)
- Reunião quinzenal de 30 minutos
- Relatório ao fim do mês

Tom claro, direto e encorajador. O cliente está aprendendo uma forma nova de trabalhar — o papel da consultoria é guiar, não cobrar.

## Saída

`onboarding-[empresa]-[data-inicio].md`, com as datas reais calculadas a partir da data de início (semanas de segunda a sexta).
