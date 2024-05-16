#!/bin/bash

# Diretório base onde estão os submódulos
base_dir=~/.vim/bundle
output_file=~/.vim/bundle/plugin_list.txt

# Verifica se o diretório base existe
if [ ! -d "$base_dir" ]; then
  echo "O diretório base não existe: $base_dir"
  exit 1
fi

# Muda para o diretório base
cd "$base_dir" || exit 1

# Limpa o arquivo de saída
> "$output_file"

# Itera sobre todos os subdiretórios
for dir in *; do
  # Verifica se é um diretório
  if [ -d "$dir" ]; then
    cd "$dir" || exit 1

    # Verifica se é um repositório Git
    if [ -d ".git" ]; then
      # Obtém o URL do repositório
      repo_url=$(git config --get remote.origin.url)
      echo "$repo_url" >> "$output_file"
    fi

    # Retorna para o diretório base
    cd "$base_dir" || exit 1
  fi
done

echo "Lista de plugins salva em $output_file."

