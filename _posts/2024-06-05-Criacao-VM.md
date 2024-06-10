---
layout: post
title: "Guia de Criação de Maquinas Virtuais no Microsoft Azure"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Azure, Virtual Machine]
tags: [Artigos, Azure, Virtual Machine]

---

## Introdução

Este artigo será uma base introdutória essencial para os próximos conteúdos que virão, onde exploraremos mais a fundo a criação e gerenciamento de máquinas virtuais no Microsoft Azure. Aqui, abordaremos os passos iniciais para criar máquinas virtuais tanto para Linux quanto para Windows, fornecendo um fundamento para as futuras discussões e tutoriais.

Criar máquinas virtuais no Microsoft Azure pode parecer uma tarefa complicada, mas com este guia passo a passo, você verá que é mais simples do que parece. Vamos explorar a criação de máquinas virtuais tanto para Linux quanto para Windows. Vamos começar!

## Passo 1: Criação do Resource Group

Antes de criar qualquer recurso no Azure, precisamos de um Resource Group, que funciona como um contêiner lógico para todos os recursos relacionados. Vamos criar um Resource Group chamado `rg-example`.

1. Acesse o portal do Azure.
2. Vá para "Resource Groups" e clique em "Create".
3. Nomeie seu Resource Group como `rg-example`.
4. Selecione a região desejada.
5. Clique em "Review + Create" e, em seguida, "Create".

![rg-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example1.png)

## Passo 2: Criação da Virtual Network

A próxima etapa é criar uma Virtual Network (VNet), que permite a comunicação entre recursos do Azure.

1. Vá para "Virtual Networks" e clique em "Create".
2. Nomeie a VNet como `vnet-example`.
3. Selecione o Resource Group `rg-example`.
4. Configure o endereço IP e as sub-redes conforme necessário.
5. Clique em "Review + Create" e, em seguida, "Create".

![vnet-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example2.png)

## Passo 3: Criação da NSG (Network Security Group)

O Network Security Group (NSG) é responsável por controlar o tráfego de rede para as VMs. Vamos criar um NSG chamado `nsg-example`.

1. Vá para "Network Security Groups" e clique em "Create".
2. Nomeie o NSG como `nsg-example`.
3. Selecione o Resource Group `rg-example`.
4. Clique em "Review + Create" e, em seguida, "Create".

![nsg-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example3.png)

## Passo 4: Anexar o NSG à Subnet

Depois de criar o NSG, precisamos anexá-lo à Subnet `default` da nossa VNet `vnet-example`.

1. Acesse o NSG `nsg-example` e selecione a settings > Subnet.
2. Associate, selecione a subnet `default` e salve as alterações.

![nsg-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example19.png)

## Passo 5: Criação da Virtual Machine Linux

Vamos criar a VM com nome vm-example dentro do rg-example com o tipo de segurança: Standard.

![lnx-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example4.png)

1. Vá para "Virtual Machines" e clique em "Create".
2. Selecione o Resource Group `rg-example`.
3. Nomeie a VM como `vm-example`.
4. Altere o tipo de segurança para Standard.
5. Selecione "Ubuntu Server 20.04 LTS ARM64 Gen2" como a imagem.
6. Selecione "Arm64" como a arquitetura (para maior eficiência energética e de processamento).
7. Configure a VM com o tamanho `Standard_D2ps_v5`.
8. Escolha a autenticação por senha e defina uma senha.
9. Certifique-se de que a VM não tenha portas de entrada públicas configuradas.

![lnx-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example5.png)

**Saiba Mais:** [Máquinas Virtuais do Azure com processadores baseados em Arm do Ampere Altra](https://azure.microsoft.com/pt-br/updates/generally-available-new-azure-virtual-machines-with-ampere-altra-armbased-processors/)

10. Na seção "Networking", certifique-se de que a VM esteja na VNet `vnet-example` e na Subnet `default`.
11. Selecione "Review + Create" e, em seguida, "Create".

![lnx-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example6.png)

Após a criação, precisamos liberar a porta SSH 22 no NSG `nsg-example` para acessar a VM.

1. Acesse o NSG `nsg-example`.
2. Adicione uma regra de entrada para permitir o tráfego na porta 22.

![nsg-example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example7.png)

### Conectando-se à VM Linux

Após a VM estar em execução verifique qual IP público foi atribuído à VM , copie o IP público e conecte-se via SSH:

```bash
ssh usuario@IPX.XXX.XXX.XX
```
No meu caso: 

```bash
ssh raafel@172.210.28.194
```
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example8.png)

De preferência, atualize os pacotes do sistema:

```bash
sudo apt-get update
sudo apt-get upgrade -y
```

## Criação da Virtual Machine Windows 11

Vamos criar uma VM com Windows 11 dentro do nosso `rg-example`, com o nome `vm-example-win`, tipo de segurança `Standard` e imagem `Windows 11 Pro`.

1. Vá para "Virtual Machines" e clique em "Create".
2. Selecione o Resource Group `rg-example`.
3. Nomeie a VM como `vm-example-win`.
4. Altere o tipo de segurança para Standard.
5. Selecione "Windows 11 Pro" como a imagem.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example13.png)

6. Configure a VM com o tamanho `Standard_B4ms` para testes mais rápidos.
7. Escolha a autenticação por senha e defina uma senha de sua preferência (não se esqueça de anotar a senha).
8. Certifique-se de que a VM não tenha portas de entrada públicas configuradas. Confirme a licença.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example14.png)

9. Na seção "Networking", certifique-se de que a VM esteja na VNet `vnet-example` e na Subnet `default`, e que não seja atribuído um NSG à NIC.
10. Selecione "Review + Create" e, em seguida, "Create".

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example15.png)

Após a criação, precisamos liberar a porta RDP no NSG `nsg-example` para acessar a VM.

1. Acesse o NSG `nsg-example`.
2. Adicione uma regra de entrada para permitir o tráfego na porta RDP.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example16.png)

### Conectando-se à VM Windows

1. No seu computador com Windows, abra o aplicativo "Remote Desktop Connection" (procure por "Remote" no menu Iniciar).

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example22.png)

2. Copie o IP público atribuído à VM `vm-example-win`, digite no Remote Desktop Connection, clique no botão conectar, escolha "Use another account", e digite o usuário e senha que foram criados anteriormente. Clique em "OK".

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example17.png)

3. Confirme o certificado de segurança quando solicitado:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example18.png)

---

## Conclusão

Criar máquinas virtuais no Azure é um processo estruturado que envolve a criação de vários componentes, como Resource Groups, Virtual Networks e Network Security Groups. Seguindo este guia, você pode configurar rapidamente VMs Linux e Windows para atender às suas necessidades. Lembre-se de sempre garantir a segurança das suas VMs e otimizar suas configurações para o melhor desempenho.

A flexibilidade e o poder do Azure permitem que você adapte a infraestrutura de TI às demandas específicas do seu projeto, seja ele para desenvolvimento, teste ou produção. Utilize as práticas recomendadas para maximizar a eficiência e a segurança de suas VMs.

Se tiver dúvidas ou precisar de mais detalhes, não hesite em entrar em contato. Espero que este guia tenha sido útil para você!

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/Logo2.png)