---
title: list.sh
description: 'Script Bash para listar URLs de repositórios Git de plugins Vim'
---

# list.sh

Este script Bash é projetado para listar os URLs dos repositórios Git de plugins Vim instalados como submódulos.

## Funcionalidade

O script realiza as seguintes operações:

1. Define o diretório base onde os submódulos (plugins) estão localizados (`~/.vim/bundle`).
2. Especifica um arquivo de saída para armazenar a lista de plugins (`~/.vim/bundle/plugin_list.txt`).
3. Verifica se o diretório base existe.
4. Itera sobre todos os subdiretórios no diretório base.
5. Para cada subdiretório que é um repositório Git, obtém o URL do repositório remoto.
6. Salva os URLs dos repositórios no arquivo de saída.

## Uso

Para usar este script:

1. Salve-o como `list.sh` em um local acessível.
2. Torne-o executável com o comando `chmod +x list.sh`.
3. Execute-o com `./list.sh`.

## Saída

O script gera um arquivo de texto (`plugin_list.txt`) no diretório `~/.vim/bundle/` contendo os URLs dos repositórios Git de todos os plugins Vim instalados.

## Notas

- O script assume que os plugins Vim estão instalados como submódulos Git no diretório `~/.vim/bundle/`.
- Certifique-se de que você tem permissões de leitura e escrita nos diretórios e arquivos relevantes.