---
layout: post
title: "Configuração de um repositório no Github"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Configuração, GitHub]
tags: [Artigos, Configuração, GitHub]
---

## Introdução

Este artigo serve como uma base introdutória para futuros tutoriais relacionados à configuração de repositórios no GitHub. Vamos abordar os passos iniciais para criar e configurar um repositório no GitHub, adicionar uma chave SSH para autenticação segura e realizar operações básicas de Git.

### Primeiramente, O que é Git?

Git é um sistema de controle de versão distribuído, amplamente utilizado por desenvolvedores em todo o mundo para gerenciar e acompanhar mudanças no código-fonte durante o desenvolvimento de software. Ele permite que múltiplos desenvolvedores trabalhem no mesmo projeto simultaneamente, mantendo um histórico completo de todas as alterações e facilitando a colaboração e o gerenciamento de versões.

### O GitHub é de comer?

GitHub é uma plataforma de hospedagem de repositórios Git na nuvem. Ele fornece uma interface web amigável e uma série de ferramentas e funcionalidades que facilitam o gerenciamento de projetos de software, colaboração entre desenvolvedores, revisão de código e integração contínua. Além disso, GitHub é um ponto de encontro para desenvolvedores de todo o mundo compartilharem projetos open source, contribuírem com melhorias e colaborarem em projetos de interesse comum.

Neste artigo, vamos guiá-lo através dos passos necessários para começar a utilizar Git e GitHub, desde a criação de um repositório até a configuração de chaves SSH e a execução de operações básicas de Git.


## Passo 1: Criação de um novo repositório no GitHub

1. Acesse GitHub e faça login na sua conta.
2. Clique no ícone "+" no canto superior direito e selecione "New repository".
3. Nomeie seu repositório como example.
4. Selecione a opção "Public" para tornar o repositório acessível a todos.
5. Não adicione um README, pois vamos seguir com comandos para criar e configurar um manualmente.
6. Clique em "Create repository".

**GitHub:** [example](https://github.com/rafaelmaferreira/example)

![example](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example9.png)

## Passo 2: Adicionar chave SSH ao GitHub

1. No GitHub, clique na sua foto no canto superior direito e vá para "Settings".
2. No menu lateral, selecione "SSH and GPG keys".
3. Clique em "New SSH key".

![SSH Key](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example11.png)

## Passo 3: Gerar uma chave SSH

Abra o terminal e gere uma chave SSH com o comando:

```bash
ssh-keygen
```

OBS: Para fins didáticos, estou gerando uma chave sem senha para facilitar nosso laboratório. Crianças, nunca façam isso em produção :D

```bash
cat /home/raafel/.ssh/id_rsa.pub
```

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example11.png)

Copie toda a informação que e exibida após o comando cat e retorne para o GitHub.

Na mesma tela que paramos, coloque o nome do seu computador, por exemplo: vm-example no titulo e copie o conteúdo da chave, conforme imagem abaixo:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example12.png)

## Passo 4: Configuração mínima para o Git

Realize a configurção mínima para o git, lembre-se de alterar suas informações:

```bash
git config --global user.name "rafaelmaferreira"
git config --global user.email rafael.low1@gmail.com
```
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example20.png)


## Passo 5: Fazer o push dos arquivos para o repositório

Vamos agora fazer o push dos arquivos do seu projeto para o repositório. Conforme a dica do próprio GitHub, não se esqueça de mudar: "git add README.md" para "git add .":

```bash
echo "# example" >> README.md
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:rafaelmaferreira/example.git
git push -u origin main
```
Dando um Check no GitHub:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example21.png)

## Curiosidades e Dicas Extras

### História do GitHub

- **Fundação**: O GitHub foi fundado em 2008 por Tom Preston-Werner, Chris Wanstrath, PJ Hyett e Scott Chacon. Desde então, cresceu exponencialmente e se tornou a plataforma de hospedagem de código mais popular do mundo.
- **Aquisição pela Microsoft**: Em 2018, o GitHub foi adquirido pela Microsoft por 7,5 bilhões de dólares. A aquisição ajudou a expandir ainda mais a base de usuários e as funcionalidades da plataforma.

### Por que usar SSH para autenticação?

- **Segurança**: O uso de chaves SSH para autenticação é mais seguro do que senhas tradicionais. As chaves SSH são criptograficamente mais robustas e difíceis de serem comprometidas.
- **Facilidade de uso**: Uma vez configurada, a autenticação SSH facilita o processo de clonagem e push para repositórios sem a necessidade de inserir senhas repetidamente.

### Boas práticas para commits no GitHub

- **Commits frequentes e significativos**: Faça commits frequentes com mensagens claras e descritivas. Isso ajuda a manter o histórico de alterações organizado e facilita o rastreamento de mudanças.
- **Mensagens de commit**: Escreva mensagens de commit detalhadas que expliquem o que foi alterado e por quê. Por exemplo: "Adiciona função de login com autenticação OAuth para melhorar a segurança do usuário".

### Usando arquivos README

- **Informações essenciais**: Um arquivo README.md bem escrito é fundamental para qualquer repositório. Ele deve conter uma visão geral do projeto, instruções de instalação, exemplos de uso e informações sobre como contribuir.
- **Markdown**: Aproveite o poder do Markdown para formatar seu README com títulos, listas, links e imagens. Um README bem formatado torna o projeto mais acessível e fácil de entender.

### Integração com CI/CD

- **GitHub Actions**: Use GitHub Actions para configurar pipelines de CI/CD diretamente no seu repositório. Isso permite automações como testes automatizados, linting, deployments e muito mais.

### Ferramentas e Extensões Úteis

- **GitHub Desktop**: Uma aplicação oficial do GitHub que facilita a utilização de Git e GitHub através de uma interface gráfica amigável.
- **Extensões de Navegador**: Extensões como "Refined GitHub" para Chrome e Firefox melhoram a interface do GitHub com recursos adicionais e melhorias de usabilidade.

### Comunidade e Colaboração

- **Contribuição Open Source**: Contribuir para projetos open source no GitHub é uma excelente maneira de ganhar experiência prática, aprender novas habilidades e fazer networking com outros desenvolvedores.
- **GitHub Discussions**: Use as discussões do GitHub para colaborar com outros desenvolvedores, resolver problemas e compartilhar ideias sobre o projeto.

## Conclusão

Configurar um repositório no GitHub é uma tarefa essencial para desenvolvedores e profissionais de TI. Este guia introdutório abordou os passos necessários para criar e configurar um repositório, adicionar uma chave SSH para autenticação segura e realizar operações básicas de Git. Esta base servirá como referência para futuros tutoriais mais avançados.

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/Logo2.png)