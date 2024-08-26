---
title: update_submodules.sh
description: 'Script Bash para atualizar submódulos Git em um diretório específico'
---

# update_submodules.sh

Este script Bash automatiza o processo de atualização de submódulos Git localizados em um diretório específico.

## Funcionalidade

1. Define o diretório base onde os submódulos estão localizados (`~/.vim/bundle`).
2. Verifica se o diretório base existe.
3. Itera sobre todos os subdiretórios no diretório base.
4. Para cada subdiretório, executa `git pull` para atualizar o submódulo.

## Uso

Execute o script no terminal:

```bash
./update_submodules.sh
```

## Detalhes do Script

- O script verifica a existência do diretório base antes de prosseguir.
- Utiliza um loop para percorrer todos os subdiretórios.
- Para cada subdiretório, entra nele, executa `git pull`, e retorna ao diretório base.
- Exibe mensagens de progresso durante a execução.

## Notas

- Certifique-se de que o script tenha permissões de execução (`chmod +x update_submodules.sh`).
- O script assume que todos os subdiretórios no diretório base são repositórios Git.
- Em caso de erro ao entrar em um diretório ou executar `git pull`, o script será encerrado.

Este script é útil para manter atualizados múltiplos submódulos Git em um único comando, especialmente em configurações de ambiente de desenvolvimento com vários plugins ou dependências.