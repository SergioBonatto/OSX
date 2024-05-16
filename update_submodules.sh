#!/bin/bash

# Diretório base onde estão os submódulos
base_dir=~/.vim/bundle

# Verifica se o diretório base existe
if [ ! -d "$base_dir" ]; then
  echo "O diretório base não existe: $base_dir"
  exit 1
fi

# Muda para o diretório base
cd "$base_dir" || exit 1

# Itera sobre todos os subdiretórios
for dir in *; do
  # Verifica se é um diretório
  if [ -d "$dir" ]; then
    # Entra no diretório
    echo "Atualizando $dir..."
    cd "$dir" || exit 1

    # Executa git pull
    git pull

    # Retorna para o diretório base
    cd "$base_dir" || exit 1
  fi
done

echo "Atualizações concluídas."

