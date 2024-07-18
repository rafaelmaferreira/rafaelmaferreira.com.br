---
layout: post
title: "Utilizando Azure Workbooks para Otimização de Custos com FinOps"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Azure, Azure Workbooks, FinOps]
tags: [Artigos, Azure, Azure Workbooks, FinOps]
---

## Introdução

A gestão eficaz dos custos na nuvem é uma prioridade para muitas organizações que adotaram a computação em nuvem. O FinOps, ou Operações Financeiras na Nuvem, é uma prática emergente que combina finanças e DevOps para otimizar a utilização e o custo dos recursos na nuvem. Uma das ferramentas poderosas que a Microsoft Azure oferece para ajudar nessa tarefa é o Azure Workbooks. Neste artigo, exploraremos como o Azure Workbooks pode ser utilizado para suportar práticas de FinOps e ajudar na otimização dos custos na nuvem.

## O que são Azure Workbooks?

Azure Workbooks é uma plataforma interativa de relatórios e visualizações no Azure Monitor. Eles permitem criar dashboards personalizados que podem incluir métricas, logs e dados de outras fontes do Azure, proporcionando uma visão consolidada e interativa do ambiente de nuvem.

## Principais Benefícios do Azure Workbooks

- **Visualizações Interativas:** Crie gráficos, tabelas e relatórios interativos que podem ser personalizados para atender às necessidades específicas de negócios e operações.
- **Integração com Dados do Azure:** Combine dados de várias fontes do Azure, incluindo logs de atividades, métricas de desempenho e informações de faturamento.
- **Compartilhamento e Colaboração:** Os Workbooks podem ser compartilhados com diferentes equipes, facilitando a colaboração entre finanças, operações e TI.
- **Automação e Atualização Contínua:** Configure atualizações automáticas para garantir que os dados exibidos estejam sempre atualizados.

## Como Azure Workbooks Apoia o FinOps

1. **Monitoramento de Custos em Tempo Real**
   - Utilize Azure Workbooks para criar dashboards que monitoram os custos em tempo real. Isso permite uma resposta rápida a quaisquer desvios ou aumentos inesperados de custo.

2. **Análise de Tendências de Consumo**
   - Análises históricas de consumo de recursos podem ser visualizadas através de gráficos de tendência. Isso ajuda a identificar padrões de uso que podem ser otimizados.

3. **Alocação de Custos**
   - Crie relatórios detalhados para alocação de custos entre diferentes departamentos ou projetos. Isso é essencial para entender quais áreas estão consumindo mais recursos e como otimizar a alocação.

4. **Identificação de Recursos Subutilizados**
   - Utilize relatórios de utilização de recursos para identificar instâncias e serviços subutilizados que podem ser redimensionados ou desligados para economizar custos.

5. **Planejamento e Orçamentação**
   - Utilize dados históricos e previsões para ajudar no planejamento de orçamentos futuros. Azure Workbooks pode integrar dados de várias fontes para fornecer uma visão abrangente para o planejamento financeiro.

## Exemplo Prático 1: Cost Optimization Workbook

### Configuração Inicial
   - Acesse o Azure Portal e navegue até o Azure Monitor.
   - Selecione "Workbooks" no menu e verifique se a sua assinatura está selecionada no filtro de assinaturas.
   - Selecione o "Cost Optimization Workbook".

### Visualização do Workbook
   - Acesse o workbook a partir do grupo de recursos selecionando o recurso de workbook e clicando em "Workbook" no menu.

### Principais Componentes do Workbook
- **Gráficos de Custo Total:** Exibem uma visão consolidada dos custos totais ao longo do tempo.
- **Custo por Serviço:** Detalham os custos por serviço do Azure.
- **Custo por Recurso:** Mostram os custos individuais por recurso.
- **Tendências de Utilização:** Fornecem gráficos de tendência de utilização de recursos.
- **Filtros Interativos:** Permitem a filtragem dos dados por assinatura, grupo de recursos ou outros parâmetros para análises mais detalhadas.

## Exemplo Prático 2: Azure Orphaned Resources Workbook

### Introdução

O Azure Orphaned Resources Workbook centraliza recursos órfãos em ambientes Azure, ajudando a melhorar a eficiência através da economia de dinheiro, prevenção de configurações incorretas e simplificação operacional.

### Como Utilizar o Azure Orphaned Resources Workbook

1. **Importação do Workbook**
   - Acesse o Azure Portal e vá para 'Azure Workbooks'.
   - Clique em '+ Create' e depois em '+ New'.
   - Abra o Editor Avançado usando o botão '</>' na barra de ferramentas.
   - Selecione o 'Gallery Template'.
   - Substitua o código JSON pelo código fornecido para 'Azure Orphaned Resources v2.0'.
   - Clique em 'Apply' e depois em 'Save'.
   - Insira um título, assinatura, grupo de recursos e localização para o workbook.
   - Clique em 'Save'.

2. **Visualização do Workbook**
   - Navegue até 'Workbooks' e clique no workbook 'Orphaned Resources'.

### Principais Componentes do Workbook

- **Tipos de Recursos Incluídos:**
  - Compute
  - App Service Plans
  - Storage
  - Managed Disks
  - Public IPs
  - Load Balancers
  - Application Gateways
  - Virtual Networks
  - Private Endpoints
  - Virtual Network Gateways
  - Outros (Resource Groups, API Connections, Certificates)

### Benefícios do Workbook

- **Economia de Dinheiro:** Identifica recursos órfãos que ainda geram custos desnecessários.
- **Prevenção de Misconfiguração:** Ajuda a evitar configurações incorretas mantendo a infraestrutura organizada.
- **Simplificação Operacional:** Centraliza a visualização de recursos órfãos, facilitando a gestão e manutenção do ambiente Azure.

## Exemplo Prático 3: Azure FinOps Workbook

### Introdução

O Azure FinOps Workbook fornece insights, documentos-chave e orientações sobre a implementação de FinOps e otimização de custos no Azure. Ele visualiza os dados do seu ambiente Azure junto com recomendações e guias relevantes, incentivando uma abordagem orientada por dados.

### Como Utilizar o Azure FinOps Workbook

1. **Importação do Workbook**
   - Copie o conteúdo do arquivo `workbook.json`.
   - Acesse a página de Azure Workbooks e clique em "New".
   - Clique no botão de código `</>`.
   - Cole o conteúdo copiado na página e clique em "Apply".
   - Salve o workbook (se tiver permissões) e clique em "Done Editing".

### Principais Componentes do Workbook

- **Inclusões:**
  - Auditoria de Licença Híbrida
  - Auditoria de Tagging
  - Exemplos práticos de FinOps / Automação
  - Insights de otimização de custos para Storage Accounts, AKS, Log Analytics, recursos órfãos, Recovery Services, App Services e VMs.

### Requisitos para Utilização

- **Permissões:** Acesso de leitura aos recursos que você está investigando no Azure. Para salvar o workbook, você precisa de permissões para criar um Azure Workbook.
- **AKS:** Informações de AKS requerem o uso do Container Insights.
- **Recomendação:** Acesso de leitura sobre toda a assinatura/grupos de gerenciamento para ativar todos os painéis do workbook.

### Benefícios do Workbook

- **Economia de Dinheiro:** Identifica oportunidades de redução de custos através da análise de dados e recomendações práticas.
- **Automatização:** Exemplos práticos de automação ajudam a implementar ações de FinOps de maneira eficiente.
- **Visibilidade:** Fornece uma visão consolidada e detalhada dos custos e da utilização dos recursos no ambiente Azure.

## Conclusão

Azure Workbooks é uma ferramenta versátil e poderosa que pode ser utilizada para suportar práticas de FinOps, proporcionando uma melhor visibilidade e controle sobre os custos na nuvem. Ao integrar dados de diversas fontes e criar visualizações interativas, as organizações podem otimizar sua utilização de recursos, melhorar o planejamento financeiro e garantir uma operação de nuvem mais eficiente e econômica.

## Recursos Adicionais

- [Documentação do Azure Workbooks](https://learn.microsoft.com/en-us/azure/azure-monitor/platform/workbooks-overview)
- [FinOps Toolkit no GitHub](https://github.com/finops-toolkit)
- [Relatório PowerBI de Visualização de Custos](https://powerbi.microsoft.com/)
