---
layout: post
title: "Utilizando Azure Workbooks para Otimização de Custos com FinOps"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Azure, Azure Workbooks, FinOps]
tags: [Artigos, Azure, Azure Workbooks, FinOps]
---

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/Arte-Logo.png)

## Introdução

A gestão eficaz dos custos na nuvem é um algo real e impactante para muitas organizações que adotaram a computação em nuvem. O FinOps ([Caso queira saber mais sobre FinOps, visite o meu artigo anterior](https://rafaelmaferreira.com.br/posts/finops-foundation-cloud/)), ou Operações Financeiras, é um conjunto de práticas que combinam Finanças e DevOps para otimizar a utilização e o custo dos recursos na nuvem. Uma ferramenta poderosa que a Microsoft Azure oferece para ajudar nessa tarefa é o Azure Workbooks. Neste artigo, irei utilizar o Azure Workbooks. Mas o que são Azure Workbooks?

## O que são [Azure Workbooks](https://learn.microsoft.com/pt-br/azure/azure-monitor/visualize/workbooks-overview)?

Azure Workbook são dashboards interativos e modulares que são usados para criar relatórios e visualizações no Azure Monitor. Eles permitem criar visões personalizadas que podem incluir métricas, logs e dados de outras fontes do Azure, proporcionando uma visão consolidada e interativa do ambiente de nuvem.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/15.webp)

## Principais Benefícios do Azure Workbooks

- **Visualizações Interativas:** Crie gráficos, tabelas e relatórios interativos que podem ser personalizados para atender às necessidades específicas do negócios e operações.
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

6. **Gerenciamento de Recursos Órfãos**
   - Recursos órfãos são aqueles que não estão mais sendo utilizados ativamente, mas continuam a gerar custos. Identificar e gerenciar recursos órfãos ajuda a economizar dinheiro, prevenir configurações incorretas e simplificar a gestão operacional do ambiente Azure.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/12.webp)


## Exemplo Prático 1: Cost Optimization Workbook

### Configuração Inicial
   - [Deploy to Azure](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fquickstarts%2Fmicrosoft.costmanagement%2Foptimization-workbook%2Fazuredeploy.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fquickstarts%2Fmicrosoft.costmanagement%2Foptimization-workbook%2FcreateUiDefinition.json)
   - Acesse o Azure Portal e navegue até o Monitor.
   - Selecione "Workbooks" no menu e verifique se a sua assinatura está selecionada no filtro de assinaturas.
   - Selecione o "Cost Optimization Workbook".

![ Cost Optimization Workbook](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/1.png)


### Principais Componentes do Workbook

- **Visão Geral:** Baseado no Microsoft Azure Well-Architected Framework (WAF) ([Caso queira saber mais sobre o WAF, visite o meu artigo anterior](https://rafaelmaferreira.com.br/posts/well-architect-foundation-cloud/)), fornece princípios para equilibrar objetivos de negócios com necessidades tecnológicas, reduzindo desperdícios e melhorando a eficiência operacional.
- **Recursos e Governança:** Indica funcionalidades implementadas que seguem os princípios de Otimização de Custos e Governança de Custos.
- **Pré-requisitos:** Requer funções mínimas de Reader e Workbook Contributor para importar e salvar o workbook, além de ações de "Quick Fix" documentadas com permissões específicas.

Na aba Usage optimization, temos a opção Top 10 services:

![Top 10 services](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/2.png)

## Exemplo Prático 2: Azure Orphaned Resources Workbook

O Azure Orphaned Resources Workbook centraliza recursos órfãos em ambientes Azure, ajudando a melhorar a eficiência através da economia de dinheiro, prevenção de configurações incorretas e simplificação operacional.

### Como Utilizar o [Azure Orphaned Resources Workbook](https://github.com/dolevshor/azure-orphan-resources)

1. **Importação do Workbook**
   - Acesse o Azure Portal e vá para 'Azure Workbooks'.
   - Clique em '+ Create' e depois em '+ New'.
   - Abra o Editor Avançado usando o botão '</>' na barra de ferramentas.
   - Selecione o 'Gallery Template'.
   - Substitua o código JSON pelo código fornecido para ['Azure Orphaned Resources v2.0'](https://github.com/dolevshor/azure-orphan-resources/tree/main/Workbook) **OBS: Deixei o link para você copiar o código e sempre utilizar a versão mais atual**
   - Clique em 'Apply' e depois em 'Save'.
   - Insira um título, assinatura, grupo de recursos e localização para o workbook.
   - Clique em 'Save'.

2. **Visualização do Workbook**
   - Navegue até 'Workbooks' e clique no workbook 'Orphaned Resources'.

![Orphaned App Service Plans](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/3.png)

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

### Abaixo seguem alguns exemplos:

Orphaned App Service Plans:
![Orphaned App Service Plans](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/4.png)
Orphaned Application Gateway:
![Orphaned Application Gateway](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/5.png)
Orphaned Managed Disks, podemos fazer o download do conteúdo conforme imagem: 
![Orphaned Managed Disks](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/6.png)

Esse é um exemplo da planilha que é exportada, podemos então apresentar aos times responsáveis para possível exclusão dos recursos.
![export_data](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/7.png)

## Exemplo Prático 3: Azure FinOps Workbook

O Azure FinOps Workbook fornece insights, documentos chaves e orientações sobre a implementação de FinOps e otimização de custos no Azure. Ele visualiza os dados do seu ambiente Azure junto com recomendações e guias relevantes, incentivando uma abordagem orientada por dados.

### Como Utilizar o [Azure FinOps Workbook](https://github.com/ms-sambell/azure-finops-workbook/tree/main?tab=readme-ov-file)

1. **Importação do Workbook**
   - Copie o [conteúdo](https://github.com/ms-sambell/azure-finops-workbook/blob/main/workbook.json) do arquivo `workbook.json`.
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

![FinOps Insights - Workbook](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/8.png)

Na sessão de Governance temos Tag:

![Tags](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/9.png)

![Tags](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/10.png)

E essa que considere uma das melhoras melhor: Cost Optimization

![Recursos órfãos](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/azure-workbooks/11.png)

## Reflexão
Mas você deve estar se perguntando, a mas vou utilizar somente um, por exemplo, o último do FinOps que possui todas as informações. Mas lembre-se sempre, nenhum remédio irá te curar de todas as dores, nada melhor que usar algo específico para a sua dor!

## GreenOps: Como Azure Workbooks é um Aliado na Gestão Sustentável

Azure Workbooks pode ser um aliado poderoso para práticas de GreenOps, fornecendo dashboards e insights que facilitam a gestão sustentável nas operações de TI. Para mais informações sobre GreenOps, visite meu artigo completo [aqui](https://rafaelmaferreira.com.br/posts/green-computing-foundation-cloud/). Aqui estão algumas formas de como Azure Workbooks pode ajudar:

1. **Identificação de Recursos Subutilizados**
   - Azure Workbooks ajuda a identificar recursos subutilizados, permitindo ajustes ou desativações para reduzir o consumo de energia e os custos operacionais.

2. **Análise de Padrões de Uso**
   - Fornece gráficos e análises que permitem observar padrões de uso, possibilitando ajustes operacionais para otimizar o uso de energia.

3. **Otimização de Custos e Recursos**
   - Facilita a identificação de áreas para redução de custos, alinhando a gestão de recursos com os objetivos de sustentabilidade.

4. **Implementação de Práticas Sustentáveis**
   - Com os insights obtidos, é possível implementar práticas que promovam a sustentabilidade, como a escolha de recursos energeticamente eficientes.

Ao integrar Azure Workbooks em suas práticas de GreenOps, você pode melhorar a sustentabilidade e a eficiência de suas operações de TI.

## Conclusão

Azure Workbooks é uma ferramenta poderosa que pode ser utilizada para apoiar práticas de FinOps, proporcionando uma melhor visibilidade e controle sobre os custos na nuvem. Ao integrar dados de diversas fontes e criar visualizações interativas, as organizações podem otimizar sua utilização de recursos, melhorar o planejamento financeiro e garantir uma operação de nuvem mais eficiente e econômica.

---

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/Logo2.png)
