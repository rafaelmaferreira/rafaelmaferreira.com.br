---
layout: post
title: "Simplificando a Utilização do Static Web Apps no Azure"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Azure, Static Web Apps]
tags: [Artigos, Azure, Static Web Apps]
---

# Simplificando a Utilização do Static Web Apps no Azure

## Introdução

No desenvolvimento de software, a documentação desempenha um papel crucial para garantir que as APIs sejam compreensíveis e utilizáveis por outros desenvolvedores. Ferramentas como Swagger e Doxygen oferecem abordagens diferentes para documentar APIs, cada uma com suas vantagens. Neste artigo, vamos explorar como configurar uma API simples utilizando Swagger para documentação interativa e Doxygen para documentação técnica detalhada, além de hospedar ambas as documentações no Azure Static Web Apps.

O Azure Static Web Apps é um serviço que permite a hospedagem de aplicações web estáticas, oferecendo integração contínua com repositórios GitHub ou Azure DevOps para deploy automático. Ele é ideal para aplicações front-end modernas com back-ends serverless. Comparado ao Azure Web Apps, o Static Web Apps é mais econômico e oferece otimizações específicas para sites estáticos e SPAs (Single Page Applications).

## Objetivo

O objetivo deste artigo é fornecer um guia passo a passo para:

1. Criação simplificada do Static Web Apps.
2. Criar uma API simples com Node.js e Express.
3. Documentar a API utilizando Swagger.
4. Documentar o código-fonte utilizando Doxygen.
5. Hospedar ambas as documentações no Azure Static Web Apps.

## Pré-requisitos

Antes de começarmos, você precisará ter:
- Uma conta no Azure com permissões para criar recursos.
- Uma conta no GitHub.

## Passo 1: Criação do Resource Group

Criando o Resource Group com nome rg-swa

![rg-swa](/assets/img/artigos/swa1.png)

## Passo 2: Criação da Virtual Network

Criando a Virtual Network com nome vnet-swa
![vnet-swa](/assets/img/artigos/swa2.png)

## Passo 3: Criação da NSG (Network Security Group)
## Passo 4: Anexar o NSG a Vnet
## Passo 4: Criação da Virtual Machine Linux


## Passo 5: Configurar a API com Node.js e Express

### Instalação do Node.js e Express

## Estrutura do Projeto

Vamos estruturar nosso projeto da seguinte forma:
/meu_projeto
    /docs
        /doxygen_docs
        /swagger_docs
    /src
        Doxyfile
        index.js

Se você ainda não tem o Node.js instalado, pode baixá-lo [aqui](https://nodejs.org/). Após a instalação, vamos criar um novo diretório para o nosso projeto e inicializar o projeto com o Express:

```bash
mkdir myapi
cd myapi
npm init -y
npm install express
```

# Criação da API
Crie um arquivo index.js com o seguinte conteúdo:

```bash
const express = require('express');
const app = express();
const port = 3000;

/**
 * @swagger
 * /:
 *   get:
 *     description: Retorna uma mensagem de boas-vindas
 *     responses:
 *       200:
 *         description: Sucesso
 */
app.get('/', (req, res) => {
  res.send('Bem-vindo à API!');
});

/**
 * @swagger
 * /hello:
 *   get:
 *     description: Retorna uma saudação personalizada
 *     parameters:
 *       - name: name
 *         in: query
 *         required: false
 *         description: Nome da pessoa a ser saudada
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Sucesso
 */
app.get('/hello', (req, res) => {
  const name = req.query.name || 'Mundo';
  res.send(`Olá, ${name}!`);
});

app.listen(port, () => {
  console.log(`API rodando em http://localhost:${port}`);
});
```

## Passo 6: Adicionar Swagger para Documentação Interativa

#### Instalação do Swagger
Para adicionar Swagger ao nosso projeto, vamos instalar as bibliotecas swagger-jsdoc e swagger-ui-express:

```bash
npm install swagger-jsdoc swagger-ui-express
```

### Configuração do Swagger
Atualize o index.js para configurar Swagger:

```bash
const express = require('express');
const swaggerJsdoc = require('swagger-jsdoc');
const swaggerUi = require('swagger-ui-express');

const app = express();
const port = 3000;

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Minha API',
      version: '1.0.0',
    },
  },
  apis: ['./index.js'], // Caminho para os arquivos de anotação Swagger
};

const specs = swaggerJsdoc(options);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(specs));

app.get('/', (req, res) => {
  res.send('Bem-vindo à API!');
});

app.get('/hello', (req, res) => {
  const name = req.query.name || 'Mundo';
  res.send(`Olá, ${name}!`);
});

app.listen(port, () => {
  console.log(`API rodando em http://localhost:${port}`);
});

```

### Teste da API
Inicie o servidor e acesse http://localhost:3000/api-docs no navegador para visualizar a documentação interativa gerada pelo Swagger:

```bash
node index.js
```

## Passo 7: Adicionar Doxygen para Documentação do Código-Fonte

O Doxygen é uma ferramenta de documentação que gera documentação em vários formatos (como HTML, PDF, etc.) a partir de comentários anotados no código-fonte. Vamos entender como ele funciona e como você pode usá-lo:

### Passos Básicos para Usar o Doxygen
#### Instalação do Doxygen:

- Windows: Baixe o instalador do site oficial do Doxygen e siga as instruções de instalação.
- Linux/MacOS: Utilize um gerenciador de pacotes. Por exemplo, no Ubuntu, você pode usar:
``` bash 
sudo apt-get install doxygen
```

### Configuração do Doxygen

Vamos criar um arquivo Doxyfile no diretório do projeto:

```bash
doxygen -g
```

Atualize o Doxyfile com as seguintes configurações:

```bash
PROJECT_NAME           = "Minha API"
OUTPUT_DIRECTORY       = docs
INPUT                  = ./index.js
RECURSIVE              = NO
GENERATE_HTML          = YES
GENERATE_LATEX         = NO
```

## Geração da Documentação do Doxygen

Execute o comando para gerar a documentação:

```bash
doxygen Doxyfile
```

Isso gerará a documentação no diretório docs/html.

## Passo 8: Fazer o Deploy no Azure Static Web Apps

#### Adição de um Private Endpoint
No portal da Azure, vá até a seção de "Networking" do seu Static Web App. Adicione um Private Endpoint e associe-o à sua VNet. Configure o DNS para resolver o nome do Static Web App para o endereço IP privado do Private Endpoint.

### Preparação da Documentação
Organize as documentações geradas pelo Doxygen e Swagger em pastas separadas:

```bash
/docs
    /doxygen_docs
    /swagger_docs
```

#### Criação de um Repositório no GitHub
Crie um novo repositório no GitHub e faça o push dos arquivos do seu projeto para o repositório:

```bash
cd ~/myapi
git init
git remote add origin https://github.com/seu_usuario/seu_repositorio.git
git add .
git commit -m "Adicionar projeto com Doxygen e Swagger"
git push -u origin main
```

#### Configuração do Azure Static Web App

No portal da Azure, crie um novo Static Web App. Selecione o repositório GitHub que você acabou de criar e configure o caminho do conteúdo estático:

- **Para a documentação do Doxygen: docs/doxygen_docs**

- **Para a documentação do Swagger: docs/swagger_docs**

#### Configuração do Workflow do GitHub Actions

No seu repositório GitHub, vá até a aba "Actions" e configure um workflow para fazer o deploy das duas documentações. Crie um arquivo .github/workflows/deploy.yml com o seguinte conteúdo:

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

      - name: Build and deploy Doxygen docs
        run: |
          doxygen Doxyfile
      - name: Build and deploy Swagger docs
        run: |
          swagger-codegen generate -i http://localhost:3000/api-docs -l html -o ./docs/swagger_docs
      - name: Deploy Static Web App
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "/"
          output_location: "docs"
```

## Passo 8: Criação da Virtual Machine Windows 11

#### Verificação do Deploy
Teste do Acesso via Navegador Web
Acesse a URL do seu Static Web App:

- Documentação do Doxygen: https://<seu_static_web_app>.azurestaticapps.net/doxygen_docs
- Documentação do Swagger: https://<seu_static_web_app>.azurestaticapps.net/swagger_docs

Verificação das Regras de Segurança de Rede
Certifique-se de que as regras de segurança de rede permitem o tráfego necessário.

# Conclusão
Neste artigo, configuramos uma API simples utilizando Node.js e Express, documentamos a API utilizando Swagger e Doxygen, e hospedamos ambas as documentações no Azure Static Web Apps. Este guia fornece uma abordagem abrangente para garantir que sua API seja bem documentada e acessível. Se você tiver dúvidas ou precisar de mais assistência, estou à disposição para ajudar!


![](/assets/img/posts/Logo2.png)