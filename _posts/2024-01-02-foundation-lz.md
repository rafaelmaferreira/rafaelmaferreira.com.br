---
layout: post
title: "Construindo uma Fundação Sólida para a Adoção da Nuvem: Integrando Landing Zones com Azure Cloud Foundation"
author: rafaferreira011
#date: 2024-10-27 18:30:00 -500
categories: [Artigos, Azure Cloud Foundation]
tags: [Azure, Cloud Foundation, Cloud Adoption Framework]
---

No mundo acelerado da tecnologia, a adoção da nuvem evoluiu de uma tendência para uma necessidade estratégica. Enquanto empresas buscam agilidade e inovação, emerge a complexidade de construir uma infraestrutura de nuvem robusta e escalável. Aqui, exploramos a integração das Landing Zones com a Foundation de Cloud, descobrindo como essas estratégias moldam o sucesso na nuvem.

## A Essência das Landing Zones

Imagine entrar em um território desconhecido sem um mapa ou um guia, é assim que se sente entrar em um ambiente de nuvem sem as Landing Zones. Landing Zones no Azure são como bases estratégicas, configuradas para acolher e gerenciar seus recursos de nuvem com eficiência. Elas são o ponto inicial onde a segurança, a conformidade e a governança se encontram, garantindo que cada componente da sua infraestrutura esteja alinhado com os melhores padrões e práticas.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/2024-01-02-foundation-lz04.png)

## Landing Zones: O Início de Uma Jornada Estruturada

As Landing Zones são mais do que simples espaços de trabalho, elas definem o contexto para o seu ambiente de nuvem. Uma Landing Zone bem projetada no Azure significa:

- **Estrutura:** Implementação de uma arquitetura modular e escalável.
- **Segurança e Conformidade:** Configurações de segurança desde o início, adaptando-se a padrões específicos da indústria.
- **Governança:** Estruturas de governança integradas para um controle eficiente.

## Entendo mais o Azure Cloud Foundation
Enquanto as Landing Zones são o ponto de partida, a Foundation Cloud no Azure é o alicerce sobre o qual seu ambiente digital é construído. É uma abordagem metodológica que engloba:

- **Estratégia e Planejamento:** Definindo metas claras para sua jornada na nuvem.
- **Operacionalização:** Implementação de práticas para garantir operações eficientes e contínuas.
- **Gerenciamento Otimizado:** Foco na eficiência operacional e na otimização de custos.

## Integrando Landing Zones com Azure Cloud Foundation
Quando Landing Zones e Azure Cloud Foundation trabalham em harmonia, elas criam uma sinergia poderosa. Esta combinação permite:
- **Agilidade e Escalabilidade:** Adaptando-se rapidamente às mudanças e crescendo com as demandas do negócio.
- **Inovação Sustentável:** Fornecendo uma plataforma para inovação contínua.
- **Resiliência e Confiabilidade:** Construindo uma infraestrutura confiável e resiliente.

## Áreas de Design de Ambiente
Seja qual for a opção de implantação, você deve considerar cuidadosamente cada área de design. Suas decisões afetam a base da plataforma da qual cada zona de destino depende. As áreas de design são indicadas com as letras "A" até "I" para ilustrar a hierarquia da organização de recursos na arquitetura conceitual.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/2024-01-02-foundation-lz02.png)

- **A - Cobrança do Azure e tenants do Active Directory:** Criação de tenants, registro e configuração de cobrança como etapas iniciais importantes.
- **B - Gerenciamento de identidade e acesso:** Fundamento para qualquer arquitetura segura e totalmente em conformidade na nuvem pública.
- **E - Topologia de rede e conectividade:** Aspectos fundamentais de qualquer arquitetura de nuvem.
- **C - Organização do recurso:** Considerações de design de assinatura e hierarquia de grupo de gerenciamento para governança, gerenciamento de operações e adoção.
- **F - Segurança:** Implementação de controles e processos para proteger ambientes de nuvem.
- **D, G, H - Gerenciamento:** Linha de base de gerenciamento para operações estáveis e contínuas.
- **C, D - Governança:** Automatização da auditoria e imposição de políticas de governança.
- **I - Automação de plataforma e DevOps:** Alinhamento das melhores ferramentas e modelos para implantação de zonas de aterrissagem e recursos de suporte.

## Processo da Área de Design
Avalie cada área de design para compreender as alterações que talvez você precise fazer nas opções de implementação da zona de destino do Azure. A avaliação em sequencia das áreas de design simplifica o design de ambientes complexos, ajudando na tomada de decisões críticas sobre o seu ambiente.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/2024-01-02-foundation-lz03.png)

## Cinco Princípios-Chave para Construir uma Landing Zone

### 1. Redes
   - **Objetivo:** Manter conectividade e flexibilidade.
   - **Soluções Destacadas:**
     - Azure ExpressRoute
     - Qualidade de Serviço em Conectividade
     - Firewalls e DMZ em Roteamento
     - Mapeamento de Endereços IP

### 2. Identidade
   - **Objetivo:** Assegurar acesso seguro através de gerenciamento de identidade robusto.
   - **Soluções Destacadas:**
     - Microsoft Entra ID
     - Autenticação Single Sign-on
     - Regras de Autenticação
     - Controle de Acesso Baseado em Funções (RBAC)

### 3. Governança
   - **Objetivo:** Implementar governança eficaz com políticas de conformidade.
   - **Soluções Destacadas:**
     - Azure Policy
     - Políticas Aplicáveis
     - Ambientes em Conformidade
     - Gerenciamento de Assinaturas

### 4. Segurança
   - **Objetivo:** Proteger dados com controles de segurança avançados.
   - **Soluções Destacadas:**
     - Azure Sentinel
     - Detecção de Ameaças
     - Proteção integrada
     - Proteção de Dados

### 5. Gerenciamento
   - **Objetivo:** Monitorar desempenho e garantir resiliência do ambiente.
   - **Soluções Destacadas:**
     - Azure Monitor
     - Monitoramento Contínuo
     - Automação 
     - Resiliência

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/2024-01-02-foundation-lz06.png)     

## Acelerador de Landing Zones

O [Acelerador de Landing Zones](https://aka.ms/caf/ready/accelerator) da Plataforma é uma ferramenta pronta para uso, conhecida como Acelerador do Portal da Landing Zones do Azure. Essa ferramenta implanta uma arquitetura conceitual e aplica configurações padrão a componentes chave, incluindo grupos de gerenciamento e políticas. Ela é ideal para organizações cuja arquitetura conceitual se alinha com o modelo operacional planejado e a estrutura de recursos.

Caso você opte gerenciar o ambiente através do portal do Azure, o Acelerador do Portal da Landing Zones do Azure é a escolha certa. Para aqueles que preferem trabalhar com Bicep ou Terraform, existem opções específicas de implantação disponíveis para estas ferramentas.

## Implementação de Referência

Se sua empresa está buscando uma implementação inicial de zonas de destino que incorporem governança, segurança e um plano de controle de operações totalmente integrados desde o começo, existem várias abordagens para configurar seu ambiente Azure. Essas abordagens incluem o uso do portal do Azure ou a implementação via infraestrutura como código, oferecendo a possibilidade de transição entre esses métodos conforme sua organização evolui.

A tabela abaixo apresenta exemplos de implementações de referência alinhadas à arquitetura de escala empresarial recomendada.

- **Base de Escala Empresarial:** A fundação sugerida para adoção de escala empresarial. [Exemplo no GitHub](https://github.com/Azure/Enterprise-Scale/blob/main/docs/reference/wingtip/README.md) \| [Implantar no Azure](https://portal.azure.com/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2FeslzArm%2FeslzArm.json/uiFormDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2FeslzArm%2Feslz-portal.json)
- **Hub e Spoke de Escala Empresarial:** Adiciona um módulo de rede hub e spoke à base de escala empresarial. [Exemplo no GitHub](https://github.com/Azure/Enterprise-Scale/blob/main/docs/reference/adventureworks/README.md) \| [Implantar no Azure](https://portal.azure.com/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2FeslzArm%2FeslzArm.json/uiFormDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2FeslzArm%2Feslz-portal.json)
- **WAN Virtual de Escala Empresarial:** Incorpora um módulo de rede da WAN Virtual à base de escala empresarial. [Exemplo no GitHub](https://github.com/Azure/Enterprise-Scale/blob/main/docs/reference/contoso/Readme.md) \| [Implantar no Azure](https://portal.azure.com/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2FeslzArm%2FeslzArm.json/uiFormDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2FeslzArm%2Feslz-portal.json)
- **Escala Empresarial para Pequenas Empresas:** Oferece uma arquitetura de rede hub e spoke para pequenas organizações. [Exemplo no GitHub](https://github.com/Azure/Enterprise-Scale/blob/main/docs/reference/treyresearch/README.md) \| [Implantar no Azure](https://portal.azure.com/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2Fdocs%2Freference%2Ftreyresearch%2FarmTemplates%2Fes-lite.json/uiFormDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2Fdocs%2Freference%2Ftreyresearch%2FarmTemplates%2Fes-portal.json)
- **Escala Empresarial para o Azure Government:** Implementação de referência para o Azure Government, incluindo todas as opções em uma experiência unificada no portal. [Exemplo no GitHub](https://aka.ms/enterprisescale) \| [Implantar no Azure Government](https://portal.azure.us/#blade/Microsoft_Azure_CreateUIDef/CustomDeploymentBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2FeslzArm%2FeslzArm.json/uiFormDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FEnterprise-Scale%2Fmain%2FeslzArm%2Feslz-portal.json)

Cada implementação de referência provisiona recursos de plataforma no ambiente de destino escolhido. Detalhes adicionais sobre cada implementação e uma visão geral dos recursos implantados estão disponíveis através dos links do GitHub mencionados na tabela.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/2024-01-02-foundation-lz05.png)


### Ferramenta de revisão de avaliação

Examine a preparação da plataforma do Azure para que a adoção possa começar, avalie seu plano para criar uma zona de destino para hospedar cargas de trabalho que você planeja criar ou migrar para a nuvem. Esta avaliação foi desenvolvida para clientes com dois ou mais anos de experiência. Se você for novo no Azure, esta avaliação ajudará a identificar áreas de investimento para sua estratégia de adoção.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/2024-01-02-foundation-lz01.png)

Inicie sua avaliação com a [Revisão da Landing Zone](https://learn.microsoft.com/pt-br/assessments/56ec577c-acb6-4c7b-ad13-e224b0846153/)

Gostou do assunto? Quer saber mais com reviews e novidades técnicas sobre Landing Zones direto da fonte? Aqui vai um canal do Youtube da própria Microsoft: [Customer Architecture & Engineering](https://www.youtube.com/@MicrosoftCAE)

Tudo isso nos leva a entender que cada pilar e cada assunto abordado tem um potencial enorme para ser explorado em profundidade. Podemos destrinchar cada tema, trazendo mais informações e insights relevantes para o dia a dia. Vamos nos aprofundar nesses assuntos, explorando os detalhes que são essenciais no contexto da adoção da nuvem e da implementação de infraestruturas robustas. Nos próximos artigos, abordaremos cada um desses temas com maior detalhamento, oferecendo uma visão clara e prática de como eles se aplicam no mundo real.

Para mais informações sobre [O que é uma Landing Zone do Azure?](https://learn.microsoft.com/pt-br/azure/cloud-adoption-framework/ready/landing-zone/) segue documentação que foi base desse artigo.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/Logo2.png)