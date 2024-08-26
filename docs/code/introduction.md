---
title: Introdução
description: 'Guia para configuração e gerenciamento de ambiente de desenvolvimento no macOS'
---

# Configuração de Ambiente de Desenvolvimento para macOS

Este projeto fornece um conjunto de arquivos de configuração e scripts para facilitar a configuração e manutenção de um ambiente de desenvolvimento consistente no macOS.

## Visão Geral

O projeto inclui:

- Arquivos de configuração para Vim (.vimrc) e Zsh (.zshrc)
- Scripts para clonagem de repositórios e atualização de submódulos
- Lista de plugins recomendados

## Requisitos

- macOS
- Git
- Vim
- Zsh

## Como Usar

1. Clone este repositório:

```bash
git clone https://github.com/seu-usuario/osx-config.git
```

2. Execute o script de clonagem para obter submódulos adicionais:

```bash
./clone.sh
```

3. Copie os arquivos de configuração para seu diretório home:

```bash
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
```

4. Para atualizar submódulos posteriormente, use:

```bash
./update_submodules.sh
```

5. Consulte `plugin_list.txt` para ver os plugins recomendados e instale-os conforme necessário.

## Estrutura do Projeto

- `.vimrc`: Configurações do Vim
- `.zshrc`: Configurações do Zsh
- `clone.sh`: Script para clonar repositórios adicionais
- `list.sh`: Script para listar arquivos/diretórios
- `plugin_list.txt`: Lista de plugins recomendados
- `update_submodules.sh`: Script para atualizar submódulos

## Contribuindo

Sinta-se à vontade para fazer fork deste repositório e adaptá-lo às suas necessidades. Contribuições são bem-vindas através de pull requests.