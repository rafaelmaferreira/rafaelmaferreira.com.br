---
layout: post
title: "Simplificando a Utilização do Static Web Apps no Azure"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Azure, Static Web Apps]
tags: [Artigos, Azure, Static Web Apps]
---

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa000.png)

## Introdução

Os [Azure Static Web Apps](https://learn.microsoft.com/pt-br/azure/static-web-apps/) são um serviço que cria e implanta automaticamente aplicativos Web full stack no Azure a partir de um repositório de códigos. Este serviço é personalizado para o fluxo de trabalho diário de um desenvolvedor, criando e implantando aplicativos baseados em alterações de código feitas em repositórios GitHub ou Azure DevOps.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa00.png)

Ao criar um recurso dos [Azure Static Web Apps](https://learn.microsoft.com/pt-br/azure/static-web-apps/overview), o Azure monitora um branch de sua escolha e, Sempre que você faz push de commits ou aceita pull requests, um build é executado automaticamente e seu aplicativo juntamente com sua API é implantado no Azure.

Este serviço é ideal para aplicativos Web que utilizam bibliotecas e frameworks como Angular, React, Svelte, Vue ou Blazor, onde a renderização do lado do servidor não é necessária. Os arquivos estáticos (HTML, CSS, JavaScript, imagens) são distribuídos globalmente, proporcionando um fornecimento de arquivos rápido e eficiente, enquanto os pontos de extremidade da API são hospedados usando uma arquitetura serverless.

### Principais Recursos:

- **Hospedagem para conteúdo estático**: HTML, CSS, JavaScript e imagens.
- **Suporte integrado à API**: Usando Azure Functions gerenciado, com opções de integração com aplicações de funções existentes, aplicativos Web, contêineres ou instâncias do Gerenciamento de API.
- **Integração com GitHub e Azure DevOps**: Alterações no repositório disparam compilações e implantações.
- **Distribuição global**: Conteúdo estático colocado mais perto dos usuários (edge computing).
- **Certificados SSL gratuitos**: Renovados automaticamente.
- **Domínios personalizados**: Para personalizações da marca no aplicativo.
- **Modelo de segurança contínua**: Proxy reverso ao chamar APIs, sem necessidade de configuração de CORS.
- **Integrações do provedor de autenticação**: Com Microsoft Entra ID e GitHub.
- **Regras de roteamento de back-end**: Controle total sobre conteúdo e rotas.
- **Versões de preparo**: Alimentadas por pull requests para pré-visualização antes da publicação.
- **Suporte da CLI**: Via CLI do Azure para criar recursos de nuvem e CLI de Azure Static Web Apps para desenvolvimento local.

## Documentação de API

No desenvolvimento de software, a documentação desempenha um papel crucial para garantir que as APIs sejam compreensíveis e utilizáveis por outros desenvolvedores. Ferramentas como Doxygen oferecem abordagens diferentes para documentar APIs, cada uma com suas vantagens. Neste artigo, vamos explorar como configurar uma API simples utilizando Doxygen para documentação técnica detalhada, e hospedar a documentação no Azure Static Web Apps.

![rg-swa](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa01.png)

## Objetivo

O objetivo deste artigo é fornecer um guia passo a passo para:

1. Criar uma API simples com Python e Flask.
2. Documentar o código utilizando Doxygen.
3. Criação simplificada do Static Web Apps.

## Pré-requisitos

Antes de começarmos, você precisará ter:
- Uma conta no Azure com permissões para criar recursos.
- Uma conta no GitHub.

## Passo 1: Criação do Resource Group

Criando o Resource Group com nome `rg-swa`, Review + Criar.

![rg-swa](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa1.png)

## Passo 2: Criação da Virtual Network

Criando a Virtual Network com nome `vnet-swa` dentro do Resource Group `rg-swa` com as opções padrão.

![vnet-swa](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa2.png)

## Passo 3: Criação da NSG (Network Security Group)

Seguindo, criação do NSG `nsg-swa` com as opções padrão dentro do Resource Group `rg-swa`. 

![nsg-swa](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa3.png)

## Passo 4: Anexar o NSG à Subnet

Após finalizar, acesse o recurso, e anexe o NSG à Subnet `default` que está dentro da `vnet-example` para liberações de portas de forma centralizada e facilitada:

![nsg-swa](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa4.png)

## Passo 5: Criação da Virtual Machine Linux

Vamos criar a VM com nome `lnx-swa` dentro do `rg-swa` com o tipo de segurança: `Standard`.

![lnx-swa](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa5.png)

A imagem será uma `Ubuntu Server 20.04 LTS ARM64 Gen2`. A arquitetura da VM será `Arm64` para maior eficiência energética e de processamento. O tamanho será uma `Standard_D2ps_v5` compatível com a arquitetura. A autenticação será feita por senha, de acordo com a preferência de cada um e sem portas de entradas públicas.

![lnx-swa](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa6.png)

**Saiba Mais:** [Máquinas Virtuais doß Azure com processadores baseados em Arm do Ampere Altra](https://azure.microsoft.com/pt-br/updates/generally-available-new-azure-virtual-machines-with-ampere-altra-armbased-processors/)

Certifique-se de que não seja criado um novo NSG e selecione a opção para apagar o IP público e a NIC junto com a VM.

![lnx-swa](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa7.png)

Depois seguimos com a instalação padrão.

Precisamos liberar a porta SSH 22 dentro do nsg-swa para seguir com os procedimentos:

![nsg-swa](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa8.png)

Verifique qual IP público foi atribuído à VM `vm-lnx`, copie e abra um terminal para conexão ssh:

```bash
ssh usuario@IPX.XXX.XXX.XX
```
No meu caso: 

```bash
ssh rafael@172.203.234.14
```
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa9.png)

De preferência, atualize os pacotes do sistema:

```bash
sudo apt-get update
sudo apt-get upgrade -y
```
![sudo apt-get upgrade -y](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa10.png)

## Passo 6: Configurar a API com Python e Flask

#### Instale o Python:

```bash
sudo apt-get install python3 python3-pip -y
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa11.png)

#### Estrutura do Projeto

Vamos estruturar nosso projeto da seguinte forma:

```yaml
/meu_projeto
    /docs
      /doxygen_docs
    /src
        Doxyfile
        app.py
```

Crie um diretório para o projeto e navegue até ele:

```bash
mkdir -p meu_projeto/docs
mkdir -p meu_projeto/src
cd meu_projeto/src
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa12.png)

### Criando a API com Flask

Primeiramente instale o Flaks:

```bash
pip install Flask
```

![pip install Flask](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa13.png)

Crie e edite o arquivo `app.py` com o seguinte conteúdo:

```bash
vim app.py
```

```yaml
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def home():
    return "Bem-vindo à API!"

@app.route('/hello', methods=['GET'])
def hello():
    name = request.args.get('name', 'Mundo')
    return jsonify(message=f"Olá, {name}!")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa15.png)

OBS1: IMPORTANTE - Para sair do Vim Aperte a tecla ESC depois `:wq` para sair salvando (write + quit (eu acho que seja isso)) e tecla ENTER.

OBS2: Você que é da área de Infra/DevOps/Cloud, não se atente ao código, estamos usando um código fake para subirmos a infra.

Vamos testar a API:

```bash
python3 app.py
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa14.png)

Inicie a aplicação e acesse `http://172.203.234.14:5000/` no navegador. Porém a página não irá carregar, porque não liberamos a porta `5000` dentro do `nsg-swa`. Vamos lá!

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa16.png)

E como mágica, teremos:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa17.png)

OBS: Para sair aperte com as teclas `CTRL + C`.

## Passo 7: Adicionar Doxygen para Documentação do Código-Fonte

O Doxygen é uma ferramenta de documentação que gera documentação em vários formatos (como HTML, PDF, etc.) a partir de comentários anotados no código-fonte. Vamos entender como ele funciona e como você pode usá-lo:

### Passos Básicos para Usar o Doxygen
#### Instalação do Doxygen:

- Windows: Baixe o instalador do site oficial do Doxygen e siga as instruções de instalação.
- Linux/MacOS: Utilize um gerenciador de pacotes. Por exemplo, no Ubuntu, você pode usar:

``` bash 
sudo apt-get install doxygen
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa21.png)

### Configuração do Doxygen

Primeiramente criamos o arquivo Doxyfile com o comando `doxygen -g Doxyfile`, dentro da pasta src:

``` bash 
doxygen -g Doxyfile
```
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa18.png)

Seguindo, atualize o Doxyfile com as seguintes configurações:

```bash
vim Doxyfile
```

```bash
PROJECT_NAME           = "Minha API Flask"
OUTPUT_DIRECTORY       = ../docs/doxygen_docs
INPUT                  = ./app.py
RECURSIVE              = NO
GENERATE_HTML          = YES
GENERATE_LATEX         = NO
```

Para facilitar a edição, você pode procurar uma palavra especifica saindo do modo INSERT, apertando a tecla ESC e digitar: `/` seguido da palavra que procurar no documento e apertando a tecla ENTER. Por exemplo:

```bash
/INPUT
```

Assim você consegue encontrar determinadas palavras de forma facilitada no editor vim :D.

Não se esqueça, para sair do Vim Aperte a tecla ESC depois `:wq` para sair salvando

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

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa19.png)

A documentação será gerada no diretório ~/meu_projeto/docs/doxygen_docs.

## Passo 8: Fazer o Deploy no Azure Static Web Apps

No portal da Azure, crie um Static Web App dentro do RG que estamos usando para o laboratório: `rg-swa`. O tipo de Plano será: `Standard`. Vamos simular um ambiente de produção, iremos criar um Static Web Apps com private endpoint. Deixe a opção Deployment details como outros, conforme imagem abaixo:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa24.png)


### Adição de um Private Endpoint
Vá até a seção de "Settings" do seu Static Web App. Selecione a opção Add, e Express:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa25.png)

Aparecerá uma nova janela, onde iremos nomear o Private Endpoint como: `pvt-swa` e associa-lo a subnet `default` da `vnet-swa`. Será criado automaticamente um DNS para resolver o nome do Static Web App para o endereço IP privado do Private Endpoint.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa26.png)

## Passo 9: Criação de um Repositório no GitHub
Crie um novo repositório no GitHub, irei deixar público para quem tiver interesse em visitar e conhecer mais, selecionei a criação de um readme nomeei como: `static-web-app`, não vamos adicionar README para seguir com os futuros.

**Github:** [static-web-app](https://github.com/rafaelmaferreira/static-web-app)

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa27.png)

Precisamos adicionar a chave ssh da VM linux ao teu GitHub, clique na sua foto no canto superior direito, settings, SSH and GPG Keys:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa28.png)

Add SSH Key:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa29.png)

Agora, precisamos retornar à VM-lnx e gerar uma nova chave SSH:

```bash
ssh-keygen
```

OBS: Para fins didáticos, estou gerando uma chave sem senha para facilitar nosso laboratório. Crianças, nunca façam isso em produção :D

```bash
cat /home/rafael/.ssh/id_rsa.pub
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa30.png)

Copie toda a informação que e exibida após o comando cat e retorne para o GitHub.

Na mesma tela que paramos, coloque o nome da VM, por exemplo: `lnx-swa` no titulo e copie o conteúdo da chave, conforme imagem abaixo:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa31.png)

Retorne a VM e faça a configurção mínima para o git, lembre-se de alterar suas informações:

```bash
git config --global user.name "rafaelmaferreira"
git config --global user.email rafael.low1@gmail.com
```
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa32.png)

Vamos entrar no diretório html para fazer o push dos arquivos para o GitHub:

```bash
cd meu_projeto/docs/doxygen_docs/html/
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa20.png)

E então vamos fazer o push dos arquivos do seu projeto para o repositório, conforme dica do proprio GitHub, não se esqueça de mudar: `git add README.md` para `git add .`:

```bash
echo "# static-web-app" >> README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:rafaelmaferreira/static-web-app.git
git push -u origin main
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa33.png)

Dando um Check no GitHub:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa34.png)

### Criação de Secret no GitHub

Pensando sempre em segurança com zero trust, vamos criar um segredo no repositório para armazenar o token de deployment.

No portal da Azure, no swa - Static Web App, clique em Manage deployment token e copie o token.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa44.png)

De volta ao GitHub, clique em Settings, Secrets and variables, actions, new repository secret:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa45.png)

Digite o nome conforme exemplo:

```bash
AZURE_STATIC_WEB_APPS_API_TOKEN
```

e cole o Deployment token:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa46.png)

Adicionar

### Configuração do Workflow do GitHub Actions

No seu repositório GitHub, vá até a aba "Actions" e selecione a opcão: "Crie um workflow você mesmo":

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa23.png)

Crie um arquivo `.github/workflows/deploy.yml` com o seguinte conteúdo **OBS: apague os espaços após o $ entre as { { e } }**

```yaml
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
          azure_static_web_apps_api_token: ${ { secrets.AZURE_STATIC_WEB_APPS_API_TOKEN } }
          repo_token: ${ { secrets.GITHUB_TOKEN } }
          action: "upload"
          app_location: "/"
          output_location: "docs/doxygen_docs/html"
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa35.png)

Não se esqueça de clicar no botão: `commit changes`:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa47.png)

E voilá, pipeline executando:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa48.png)

## Passo 11: Criação da Virtual Machine Windows 11

Já que não colocamos o Static Web App na internet, ele está apenas acessível na nossa rede interna. Precisamos criar uma VM, por exemplo, com Windows 11 para visualizar o deploy do Static Web App no navegador.

Dentro do nosso `rg-swa`, com o nome: `win-swa`, com tipo de segurança `Standard` e imagem `Windows 11 Pro`.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa36.png)

Escolhi o tamanho `Standard_B4ms` para ser mais rápido nos testes. Criei um usuário e senha de sua preferência (não se esqueça de anotar a senha rs).

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa37.png)

Sem porta de entrada pública, iremos configurar depois manualmente. Confirme a licença.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa38.png)

Certifique-se de que esteja na Vnet correta: `vnet-swa`, na subnet: `default`, e que não seja atribuído um NSG à NIC:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa39.png)

Depois opções default. Finalizando precisamos liberar a porta RDP no `nsg-swa`, settings, Inbound security rules, add, Services, RDP:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa40.png)

Estou usando Windows, portanto, procure no Iniciar `Remote` e abra o Remote Desktop Connection:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa41.png)

Copie o IP público, digite no Remote Desktop Connection, clique no botão conectar, escolha uma conta diferente, digite o usuário e senha que foram criados anteriormente e clique em ok:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa42.png)

Confirme o certificado:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa43.png)

## Finalizando: Verificação do Deploy
Vamos testar via navegador web. Acesse a URL do seu Static Web App, retorne ao portal da Azure e copie o endereço de domínio para colar na VM Windows 11:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa49.png)

- https://black-sand-0051c0f0f.5.azurestaticapps.net

**OBS: Esse é o nome padrão que vem. Podemos alterá-lo validando nosso domínio externo e configurando ainda mais nossa aplicação dentro do nosso recurso Azure Static Web App.**

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa50.png)

E se testarmos fora da nossa rede interna, por exemplo, utilizando a rede externa do nosso computador:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa51.png)

Acesso negado, conforme o esperado :D

Podemos ainda configurar senhas de visitantes. Por exemplo, se fosse uma API para consultar holerites, com dados sensíveis, dentro do portal da Azure na seção de configurações do Static Web App:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa52.png)

E então:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa53.png)

Digitando a senha conseguimos acessar a API:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa50.png)

## Desenho Arquitetura

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/swa/swa.png)

## Conclusão
Neste artigo, aprendemos como configurar uma Virtual Machine no Azure (Resource Group, Virtual Network, Network Security Group, Disco, Network Interface, Public IP address). Configuramos uma API simples utilizando Python e Flask, documentamos a API com Doxygen e hospedamos a documentação no Azure Static Web Apps (Private Endpoint + Private DNS). Utilizamos o GitHub para hospedar o código e implementamos pipelines com GitHub Actions para realizar o deploy automático no Azure Static Web Apps. Este guia fornece uma abordagem abrangente para garantir que sua API seja bem documentada e acessível, utilizando o provedor de nuvem Azure. Se você tiver dúvidas estou à disposição para ajudar.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/Logo2.png)