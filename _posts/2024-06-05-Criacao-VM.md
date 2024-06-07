---
layout: post
title: "Guia de Criação de Maquinas Virtuais no Microsoft Azure"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Azure, Virtual Machine]
tags: [Artigos, Azure, Virtual Machine]
---

## Passo 1: Criação do Resource Group

Criando o Resource Group com nome rg-example, Review + Criar.

![rg-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example1.png)

## Passo 2: Criação da Virtual Network

Criando a Virtual Network com nome vnet-example dentro do Resource Group rg-example com as opções padrão.

![vnet-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example2.png)

## Passo 3: Criação da NSG (Network Security Group)

Seguindo, criação do NSG (nsg-example) com as opções padrão dentro do Resource Group rg-example. 

![nsg-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example3.png)

## Passo 4: Anexar o NSG à Subnet

Após finalizar, acesse o recurso, e anexe o NSG à Subnet default que está dentro da vnet-example para liberações de portas de forma centralizada e facilitada:

![nsg-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example4.png)

## Passo 5: Criação da Virtual Machine Linux

Vamos criar a VM com nome vm-example dentro do rg-example com o tipo de segurança: Standard.

![lnx-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example5.png)

A imagem será uma Ubuntu Server 20.04 LTS ARM64 Gen2. A arquitetura da VM será Arm64 para maior eficiência energética e de processamento. O tamanho será uma Standard_D2ps_v5 compatível com a arquitetura. A autenticação será feita por senha, de acordo com a preferência de cada um e sem portas de entradas públicas.

![lnx-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example6.png)
**Saiba Mais:** [Máquinas Virtuais do Azure com processadores baseados em Arm do Ampere Altra](https://azure.microsoft.com/pt-br/updates/generally-available-new-azure-virtual-machines-with-ampere-altra-armbased-processors/)

Certifique-se de que não seja criado um novo NSG e selecione a opção para apagar o IP público e a NIC junto com a VM.

![lnx-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example7.png)

Depois seguimos com a instalação padrão.

Precisamos liberar a porta SSH 22 dentro do nsg-example para seguir com os procedimentos:

![nsg-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example8.png)

Verifique qual IP público foi atribuído à VM vm-example, copie e abra um terminal para conexão ssh:

```bash
ssh usuario@IPX.XXX.XXX.XX
```
No meu caso: 

```bash
ssh raafel@172.210.28.194
```
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example9.png)

De preferência, atualize os pacotes do sistema:

```bash
sudo apt-get update
sudo apt-get upgrade -y
```
![sudo apt-get upgrade -y](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example10.png)

## Passo 6: Criação da Virtual Machine Windows 11

Criar uma VM com Windows 11:

Dentro do nosso rg-example, com o nome: vm-example-win, com tipo de segurança Standard e imagem Windows 11 Pro.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example36.png)

Escolhi o tamanho Standard_B4ms para ser mais rápido nos testes. Criei um usuário e senha de sua preferência (não se esqueça de anotar a senha rs).

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example37.png)

Sem porta de entrada pública, iremos configurar depois manualmente. Confirme a licença.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example38.png)

Certifique-se de que esteja na Vnet correta: vnet-example, na subnet: default, e que não seja atribuído um NSG à NIC:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example39.png)

Depois opções default. Finalizando precisamos liberar a porta RDP no nsg-example, settings, Inbound security rules, add, Services, RDP:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example40.png)

Estou usando Windows, portanto, procure no Iniciar "Remote" e abra o Remote Desktop Connection:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example41.png)

Copie o IP público, digite no Remote Desktop Connection, clique no botão conectar, escolha uma conta diferente, digite o usuário e senha que foram criados anteriormente e clique em ok:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example42.png)

Confirme o certificado:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example43.png)

## Conclusão


![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/Logo2.png)