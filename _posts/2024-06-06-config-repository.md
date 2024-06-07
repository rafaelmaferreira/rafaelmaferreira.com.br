---
layout: post
title: "Configuração de um repositório no Github"
author: rafaferreira011
#date: 2023-10-27 18:30:00 -500
categories: [Artigos, Azure, Virtual Machine]
tags: [Artigos, Azure, Virtual Machine]
---

Crie um novo repositório no GitHub, irei deixar público para quem tiver interesse em visitar e conhecer mais, selecionei a criação de um readme nomeei como: "example", não vamos adicionar README para seguir com os futuros comandos.

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

Copie toda a informação que e exibida após o comando cat e retorne para o GitHub.

Na mesma tela que paramos, coloque o nome da VM, por exemplo: vm-example no titulo e copie o conteúdo da chave, conforme imagem abaixo:

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example31.png)

Retorne a VM e faça a configurção mínima para o git, lembre-se de alterar suas informações:

```bash
git config --global user.name "rafaelmaferreira"
git config --global user.email rafael.low1@gmail.com
```
![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/artigos/example/example32.png)

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

## Conclusão

![](https://stoblobcertificados011.blob.core.windows.net/imagens-blog/posts/Logo2.png)