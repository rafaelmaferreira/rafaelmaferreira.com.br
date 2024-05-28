---
layout: post
title: "A importância do Persistent Volume no Kubernetes AKS: garantindo dados seguros e acessíveis"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Aks, Volume]
tags: [Artigos, Aks, Volume]
---
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/2023-02-05-artigo-aks-volume1.png)

Olá, a todos!
Quando se trata de aplicações em containers, o uso de persistência de dados é fundamental para garantir a continuidade dos serviços. É por isso que o Persistent Volume (PV) e o Persistent Volume Claim (PVC) são recursos importantes do Kubernetes. E, no contexto do Azure Kubernetes Services (AKS), o uso de PV e PVC se torna ainda mais relevante.
No AKS, o Persistent Volume permite aos usuários armazenar dados de forma permanente, mesmo após a recriação de pods ou reinicialização de nós. Isto significa que, independentemente do status da aplicação, os dados serão preservados e disponíveis para uso quando necessário. Isso é extremamente importante para aplicações críticas, como banco de dados, que precisam garantir a disponibilidade e integridade dos dados em todos os momentos.
O Persistent Volume Claim, por sua vez, é um recurso que permite que os usuários solicitem espaço de armazenamento de forma simples e rápida. O PVC permite aos desenvolvedores especificar a quantidade de espaço de armazenamento necessária para suas aplicações, sem se preocupar com detalhes técnicos da infraestrutura. A partir daí, o Kubernetes se encarrega de alocar o espaço de armazenamento apropriado automaticamente.
Além do uso de Persistent Volumes no Kubernetes AKS, outro aspecto importante para garantir a disponibilidade de dados é o uso de Manifestos YAML. Manifestos YAML são arquivos que descrevem as configurações e recursos que um usuário deseja criar e gerenciar no cluster Kubernetes. Eles podem ser usados para declarar Persistent Volumes, Persistent Volume Claims, Deployments, Services e outros recursos importantes.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/2023-02-05-artigo-aks-volume2.png)

A vantagem do uso de Manifestos YAML é que ele permite a criação de recursos no cluster Kubernetes de forma programática e repetível, o que torna o processo de provisionamento muito mais eficiente e automatizado. Além disso, é possível versionar e controlar as mudanças realizadas nos Manifestos YAML, o que ajuda a manter o histórico e a rastreabilidade das configurações do cluster.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/2023-02-05-artigo-aks-volume3.png)

O AKS permite a integração de PV com serviços de armazenamento da Azure, como o Azure Disk e o Azure File. Isso significa que, além de garantir a persistência de dados, os usuários também podem desfrutar de alta disponibilidade e escalabilidade dos serviços de armazenamento da Azure.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/2023-02-05-artigo-aks-volume4.png)

Em resumo, o uso de Persistent Volumes e Manifestos YAML são duas práticas importantes no desenvolvimento de aplicações no Kubernetes AKS, que ajudam a garantir a disponibilidade e persistência de dados, além de permitir a automatização e gestão eficiente da infraestrutura.