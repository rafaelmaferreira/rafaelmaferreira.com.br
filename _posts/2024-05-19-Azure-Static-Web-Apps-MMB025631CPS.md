---
layout: post
title: "Simplificando a Utilização do Static Web Apps no Azure"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Azure, Static Web Apps]
tags: [Artigos, Azure, Static Web Apps]
---

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

Criando o Resource Group com nome rg-swa.

![rg-swa](/assets/img/artigos/swa/swa1.png)

## Passo 2: Criação da Virtual Network

Criando a Virtual Network com nome vnet-swa dentro do Resource Group rg-swa com as opções padrão.

![vnet-swa](/assets/img/artigos/swa/swa2.png)

## Passo 3: Criação da NSG (Network Security Group)
Seguindo, criação do NSG (nsg-swa) com as opções padrão dentro do Resource Group rg-swa. 

![nsg-swa](/assets/img/artigos/swa/swa3.png)

## Passo 4: Anexar o NSG a Subnet

Vamos anexar a nsg a Subnet default que está dentro da vnet-swa para liberações de portas de forma centralizada e facilitada:

![nsg-swa](/assets/img/artigos/swa/swa4.png)

## Passo 4: Criação da Virtual Machine Linux

Vamos criar a VM com nome lnx-swa dentro do rg-swa com o security type: Standard 

![lnx-swa](/assets/img/artigos/swa/swa5.png)

**Saiba Mais:** [Máquinas Virtuais do Azure com processadores baseados em Arm do Ampere Altra](https://azure.microsoft.com/pt-br/updates/generally-available-new-azure-virtual-machines-with-ampere-altra-armbased-processors/)

A imagem será uma Ubuntu Server 20.04 LTS ARM64 Gen2. VM architecture será Arm64 para maior eficiencia energética e de processamento, o size será uma Standard_D2ps_v5 compatível com a arquitetura, a Authentication type será com senha e de preferência de cada um rs.

![lnx-swa](/assets/img/artigos/swa/swa6.png)

Certifique-se que não seja criado um novo NSG e selecione a opção para apagar o IP público e a NIC junto com a VM.

![lnx-swa](/assets/img/artigos/swa/swa7.png)

Depois seguimos com a instalação Padrão.

Precisamos liberar a porta SSH 22 dentro do nsg-swa para seguir com os procedimentos:

![nsg-swa](/assets/img/artigos/swa/swa8.png)

Verifique qual IP público foi atribuido a VM lnx-swa, copie e utilize o comando para conexão ssh:

```bash
ssh usuario@IPX.XXX.XXX.XX
```

No meu caso: 

```bash
ssh rafael@172.203.234.14
```
![nsg-swa](/assets/img/artigos/swa/swa9.png)

De preferencia atualize os sempre os pacotes:


```bash
sudo apt-get update
```
![nsg-swa](/assets/img/artigos/swa/swa10.png)

## Passo 5: Configurar a API com Node.js e Express

#### Estrutura do Projeto

Vamos estruturar nosso projeto da seguinte forma:
/meu_projeto
    /docs
        /doxygen_docs
        /swagger_docs
    /src
        Doxyfile
        index.js

### Instalação do Node.js e Express

Se você ainda não tem o Node.js instalado, pode baixá-lo [aqui](https://nodejs.org/). Após a instalação, vamos criar um novo diretório para o nosso projeto e inicializar o projeto com o Express:

```bash
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# download and install Node.js
nvm install 22

# verifies the right Node.js version is in the environment
node -v # should print `v22.2.0`

# verifies the right NPM version is in the environment
npm -v # should print `10.7.0`
```
![](/assets/img/artigos/swa/swa11.png)

Finalizado instalação teste para ver se está tudo ok:

```bash
sudo apt install npm
```
![sudo apt install npm](/assets/img/artigos/swa/swa12.png)

Finalizado instalação teste para ver se está tudo ok:

```bash
npm -v
```
Vamos continuar instalando o express: 

```bash
mkdir myapi
cd myapi
npm init -y
npm install express
```

![install express](/assets/img/artigos/swa/swa13.png)

Dentro do diretório myapi, vamos criar a estrutura do projeto mencionada anteriormente. A estrutura do diretório será criada manualmente ou usando comandos para criar as pastas e arquivos necessários:

```bash
mkdir -p meu_projeto/docs/doxygen_docs
mkdir -p meu_projeto/docs/swagger_docs
mkdir meu_projeto/src
touch meu_projeto/src/Doxyfile
touch meu_projeto/src/index.js
```
![](/assets/img/artigos/swa/swa14.png)

# Criação da API
Edite o arquivo index.js com o seguinte conteúdo:

```bash
vim meu_projeto/src/index.js
```

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
![](/assets/img/artigos/swa/swa15.png)

OBS1: IMPORTANTE - Para sair do Vim Aperte a tecla ESC depois ":wq" para sair salvando (write + quit (eu acho que seja isso)) e tecla ENTER.

OBS2: Você que é da área de Infra/DevOps/Cloud, não se atente ao código, estamos usando um código fake para subirmos a infra.

## Passo 6: Adicionar Swagger para Documentação Interativa

#### Instalação do Swagger
Para adicionar Swagger ao nosso projeto, vamos instalar as bibliotecas swagger-jsdoc e swagger-ui-express:

```bash
npm install swagger-jsdoc swagger-ui-express
```
![npm install swagger-jsdoc swagger-ui-express](/assets/img/artigos/swa/swa16.png)

### Configuração do Swagger
Atualize o index.js para configurar Swagger:

```bash
rm meu_projeto/src/index.js
vim meu_projeto/src/index.js
```
**Apaguei o arquivo e criei novamente para ser mais rápido KKK, NUNCA faça isso em PRODUÇÃO.**
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
  apis: ['./src/index.js'], // Caminho para os arquivos de anotação Swagger
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
  console.log(`API rodando em http://172.203.234.14:${port}`);
});
```

![](/assets/img/artigos/swa/swa17.png)

**Não se esqueça de atualizar o ip para o seu próprio IP.**

Instale o OpenAPI Generator globalmente usando npm:

```bash
sudo npm install -g @openapitools/openapi-generator-cli
```

![](/assets/img/artigos/swa/swa47.png)

### Teste da API

```bash
cd meu_projeto/src/
node index.js
```

![](/assets/img/artigos/swa/swa18.png)

Inicie o servidor e acesse http://172.203.234.14:3000/api-docs no navegador para visualizar a documentação interativa gerada pelo Swagger. Porém a página não irá carregar, por que não liberamos a porta 3000 dentro do nsg-swa. Vamos lá!

![](/assets/img/artigos/swa/swa19.png)

E como mágica, teremos:

![](/assets/img/artigos/swa/swa20.png)

OBS: Pare o servidor node, com as teclas: CTLR + C para continuar com o procedimento.

O OpenAPI Generator requer Java para funcionar. Vamos instalar o Java:

```bash
sudo apt-get update
sudo apt-get install default-jdk -y
```


Use o OpenAPI Generator para gerar a documentação:

```bash
npx @openapitools/openapi-generator-cli generate -i http://172.203.234.14:3000/api-docs -g html -o ./docs/swagger_docs
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

![](/assets/img/artigos/swa/swa21.png)

### Configuração do Doxygen

Como já haviamos criado o arquivo Doxyfile no diretório do projeto, vamos atualizar com as informações necessárias:

```bash
doxygen Doxyfile
```

![](/assets/img/artigos/swa/swa22.png)

Seguindo, atualize o Doxyfile com as seguintes configurações:

```bash
vim Doxyfile
```

```bash
PROJECT_NAME           = "Minha API"
OUTPUT_DIRECTORY       = ../docs/doxygen_docs
INPUT                  = ./index.js
RECURSIVE              = NO
GENERATE_HTML          = YES
GENERATE_LATEX         = NO
```

Para facilitar a edição, você pode procurar uma palavra especifica saindo do modo INSERT, apertando a tecla ESC e digitar: "/" seguido da palavra que procurar no documento. Por exemplo:

```bash
/INPUT
```

Assim você consegue encontrar determinadas palavras de forma facilitada no editor vim :D.

### Instalando o Graphviz

O Doxygen usa o Graphviz para gerar gráficos de dependência e diagramas de classes. Vou orientá-lo na instalação do Graphviz:

```bash
sudo apt-get install graphviz -y
```

### Geração da Documentação do Doxygen

Execute o comando para gerar a documentação:

```bash
doxygen Doxyfile
```

![](/assets/img/artigos/swa/swa23.png)

Isso gerará a documentação no diretório docs/html.

## Passo 8: Fazer o Deploy no Azure Static Web Apps

No portal da Azure, crie um Static Web App dentro do RG que estamos usando para o laboratório: rg-swa. O tipo de Plano será: Standard. Vamos simular um ambiente de produção, iremos criar um Static Web Apps com private endpoint. Deixe a opção Deployment details como outros, conforme imagem abaixo:

![](/assets/img/artigos/swa/swa23.png)

### Adição de um Private Endpoint
Vá até a seção de "Settings" do seu Static Web App. Selecione a opção Add, e Express:

![](/assets/img/artigos/swa/swa25.png)

Aparecerá uma nova janela, onde iremos nomear o Private Endpoint como: "pvt-swa" e associa-lo a subnet default da vnet-swa. Será criado automaticamente um DNS para resolver o nome do Static Web App para o endereço IP privado do Private Endpoint.

![](/assets/img/artigos/swa/swa26.png)

## Passo 9: Criação de um Repositório no GitHub
Crie um novo repositório no GitHub, irei deixar público para quem tiver interesse em visitar e conhecer mais, selecionei a criação de um readme nomiei como: "static-web-app".

**Github:** [static-web-app](https://github.com/rafaelmaferreira/static-web-app)

![](/assets/img/artigos/swa/swa27.png)

Precisamos adicionar a chave ssh da VM linux ao teu GitHub, clique na sua foto no canto superior direito, settings, SSH and GPG Keys:

![](/assets/img/artigos/swa/swa28.png)

Add SSH Key:

![](/assets/img/artigos/swa/swa29.png)

Agora precisamos retornar a VM lnx e gerar uma nova chave SSH:

```bash
ssh-keygen
```

OBS: Para fins didaticos, estou gerando uma chave sem senha para facilitar nosso laboratorio, criancas, nunca facam isso em producao :D

```bash
cat /home/rafael/.ssh/id_rsa.pub
```
![](/assets/img/artigos/swa/swa30.png)

Copie toda a informacao que e exibida apos o comando cat e retorne para o GitHub.

Na mesma tela que paramos, coloque o nome da VM, por exemplo: lnx-swa no titulo e na copie o conteudo da chave, conforme imagem abaixo:

![](/assets/img/artigos/swa/swa31.png)

Retorne a VM e faça a configuracao minima para o git, lembre-se de alterar suas informacoes:

```bash
git config --global user.name "rafaelmaferreira"
git config --global user.email rafael.low1@gmail.com
```
![](/assets/img/artigos/swa/swa32.png)

E entao o push dos arquivos do seu projeto para o repositório, conforme dica do proprio GitHub, nao se esqueca de mudar : "git add README.md" para "git add .":

```bash
echo "# static-web-app" >> README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:rafaelmaferreira/static-web-app.git
git push -u origin main
```

![](/assets/img/artigos/swa/swa33.png)

Dando um Check no GitHub:

![](/assets/img/artigos/swa/swa34.png)

### Criação de Secret no GitHub

Pensando sempre em segurança com zero trust, vamos criar um segredo no repositório para armazenar o token de deployment.

No portal da azure, no swa - Static Web App, clique em Manage deployment token e copie o token. 

![](/assets/img/artigos/swa/swa44.png)

De volta no GitHub, clique em Settings, Secrets and variables, actions, new repository secret:

![](/assets/img/artigos/swa/swa45.png)

Digite o nome conforme exemplo:

```bash
AZURE_STATIC_WEB_APPS_API_TOKEN
```

e cole o Deployment token:

![](/assets/img/artigos/swa/swa46.png)

Adicionar

### Configuração do Workflow do GitHub Actions

No seu repositório GitHub, vá até a aba "Actions" e selecione a opcão: "Crie um workflow você mesmo". Crie um arquivo .github/workflows/deploy.yml com o seguinte conteúdo:

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
          cd meu_projeto/src
          doxygen Doxyfile

      - name: Build and deploy Swagger docs
        run: |
          swagger-codegen generate -i http://172.203.234.14:3000/api-docs -l html -o ./docs/swagger_docs
      - name: Deploy Static Web App
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "/"
          output_location: "docs"
```
Lembre-se de alterar o IP para o IP do seu ambiente.
![](/assets/img/artigos/swa/swa35.png)

## Passo 11: Criação da Virtual Machine Windows 11

Já que não colocamos o Static Web App na internet, ele está apenas acessível na nossa rede interna, precisamos criar uma VM, por exemplo com Windows 11 para visualizar o deploy do Static Web App no navegador

Dentro do nosso rg-swa, com nome: win-swa, com tipo de segurança Standard e imagem Windows 11 Pro

![](/assets/img/artigos/swa/swa36.png)

Escolhi o tamanho Standard_B4ms para ser mais rápido os teste, criei um usuário e senha da sua preferencia (não se esqueça de anotar a senha rs)

![](/assets/img/artigos/swa/swa37.png)

Sem porta de entrada pública, iremos configurar depois manualmente, e confirme a licença

![](/assets/img/artigos/swa/swa38.png)

Certifique-se que esteja na Vnet Correta: vnet-swa, na subnet: default, e que não seja atribuido um NSG a NIC:

![](/assets/img/artigos/swa/swa39.png)

Depois opções default. Finalizando precisamos liberar a porta RDP no nsg-swa, settings, Inbound security rules, add, Services, RDP:

![](/assets/img/artigos/swa/swa40.png)

Estou usando Windows, portando, procure no iniciar remote e abra o Remote Desktop Connection:

![](/assets/img/artigos/swa/swa41.png)

Copie o IP Público, digite no Remote Desktop Connection, clique no botão conectar, escolhe uma conta diferente, digite o usuário e senha que foi criado anteriormente e clique ok:

![](/assets/img/artigos/swa/swa42.png)

Confie no certificado:

![](/assets/img/artigos/swa/swa43.png)

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