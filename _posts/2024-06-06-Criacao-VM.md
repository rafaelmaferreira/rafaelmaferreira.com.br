---
layout: post
title: "Guia de Criação de Virtual Machine no Microsoft Azure"
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


## Passo 9: Criação de um Repositório no GitHub
Crie um novo repositório no GitHub, irei deixar público para quem tiver interesse em visitar e conhecer mais, selecionei a criação de um readme nomeei como: "static-web-app", não vamos adicionar README para seguir com os futuros comandos.

**Github:** [static-web-app](https://github.com/rafaelmaferreira/static-web-app)

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example27.png)

Precisamos adicionar a chave ssh da VM linux ao teu GitHub, clique na sua foto no canto superior direito, settings, SSH and GPG Keys:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example28.png)

Add SSH Key:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example29.png)

Agora, precisamos retornar à VM example e gerar uma nova chave SSH:

```bash
ssh-keygen
```

OBS: Para fins didáticos, estou gerando uma chave sem senha para facilitar nosso laboratório. Crianças, nunca façam isso em produção :D

```bash
cat /home/raafel/.ssh/id_rsa.pub
```
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example30.png)

Copie toda a informacao que e exibida apos o comando cat e retorne para o GitHub.

Na mesma tela que paramos, coloque o nome da VM, por exemplo: vm-example no titulo e copie o conteúdo da chave, conforme imagem abaixo:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example31.png)

Retorne a VM e faça a configurção mínima  para o git, lembre-se de alterar suas informações:

```bash
git config --global user.name "rafaelmaferreira"
git config --global user.email rafael.low1@gmail.com
```
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example32.png)

Vamos entrar no diretório XX para fazer o push para o GitHub:

```bash
cd docs/doxygen_docs/html/
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example20.png)

E então vamos fazer o push dos arquivos do seu projeto para o repositório, conforme dica do proprio GitHub, não se esqueça de mudar: "git add README.md" para "git add .":

```bash
echo "# example" >> README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:rafaelmaferreira/example.git
git push -u origin main
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example33.png)

Dando um Check no GitHub:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example34.png)

### Criação de Secret no GitHub

Pensando sempre em segurança com zero trust, vamos criar um segredo no repositório para armazenar o token de deployment.

No portal da Azure, no example - Static Web App, clique em Manage deployment token e copie o token.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example44.png)

De volta ao GitHub, clique em Settings, Secrets and variables, actions, new repository secret:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example45.png)

Digite o nome conforme exemplo:

```bash
AZURE_STATIC_WEB_APPS_API_TOKEN
```

e cole o Deployment token:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example46.png)

Adicionar

### Configuração do Workflow do GitHub Actions

No seu repositório GitHub, vá até a aba "Actions" e selecione a opcão: "Crie um workflow você mesmo":

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example23.png)

Crie um arquivo .github/workflows/deploy.yml com o seguinte conteúdo, não se esqueçam de apagar as aspas no: "${{ secretsAZURE_STATIC_WEB_APPS_API_TOKEN }}" e repo_token: "${{ secrets.GITHUB_TOKEN }}":

```bash
name: Deploy Static Web App

on:
  push:
    branches:
      - main

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository content
        uses: actions/checkout@v2

      - name: Deploy Static Web App
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: "${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}"
          repo_token: "${{ secrets.GITHUB_TOKEN }}"
          action: "upload"
          app_location: "/"
          output_location: "docs/doxygen_docs/html"
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example35.png)

Não se esqueça de clicar no botão: "commit changes":

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example47.png)

E voilá, pipeline executando:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example48.png)

## Passo 11: Criação da Virtual Machine Windows 11

Já que não colocamos o Static Web App na internet, ele está apenas acessível na nossa rede interna. Precisamos criar uma VM, por exemplo, com Windows 11 para visualizar o deploy do Static Web App no navegador.

Dentro do nosso rg-example, com o nome: win-example, com tipo de segurança Standard e imagem Windows 11 Pro.

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

## Finalizando: Verificação do Deploy
Vamos testar via navegador web. Acesse a URL do seu Static Web App, retorne ao portal da Azure e copie o endereço de domínio para colar na VM Windows 11:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example49.png)

- https://black-sand-0051c0f0f.5.azurestaticapps.net

**OBS: Esse é o nome padrão que vem. Podemos alterá-lo validando nosso domínio externo e configurando ainda mais nossa aplicação dentro do nosso recurso Azure Static Web App.**

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example50.png)

E se testarmos fora da nossa rede interna, por exemplo, utilizando a rede externa do nosso computador:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example51.png)

Acesso negado, conforme o esperado :D

Podemos ainda configurar senhas de visitantes. Por exemplo, se fosse uma API para consultar holerites, com dados sensíveis, dentro do portal da Azure na seção de configurações do Static Web App:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example52.png)

E então:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example53.png)

Digitando a senha conseguimos acessar a API:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example50.png)

## Desenho Arquitetura

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/example.png)

## Conclusão
Neste artigo, aprendemos como configurar uma Virtual Machine no Azure (Resource Group, Virtual Network, Network Security Group, Disco, Network Interface, Public IP address). Configuramos uma API simples utilizando Python e Flask, documentamos a API com Doxygen e hospedamos a documentação no Azure Static Web Apps (Private Endpoint + Private DNS). Utilizamos o GitHub para hospedar o código e implementamos pipelines com GitHub Actions para realizar o deploy automático no Azure Static Web Apps. Este guia fornece uma abordagem abrangente para garantir que sua API seja bem documentada e acessível, utilizando o provedor de nuvem Azure. Se você tiver dúvidas estou à disposição para ajudar.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/Logo2.png)