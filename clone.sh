#!/bin/bash

# Diretório base onde os plugins serão clonados
base_dir=~/.vim/bundle
input_file=~/.vim/bundle/plugin_list.txt

# Verifica se o arquivo de entrada existe
if [ ! -f "$input_file" ]; then
  echo "O arquivo de entrada não existe: $input_file"
  exit 1
fi

# Cria o diretório base se não existir
mkdir -p "$base_dir"

# Muda para o diretório base
cd "$base_dir" || exit 1

# Itera sobre cada linha do arquivo de entrada
while IFS= read -r repo_url; do
  # Obtém o nome do plugin a partir da URL do repositório
  plugin_name=$(basename "$repo_url" .git)
  
  # Clona o repositório se o diretório não existir
  if [ ! -d "$plugin_name" ]; then
    echo "Clonando $plugin_name de $repo_url..."
    git clone "$repo_url"
  else
    echo "$plugin_name já existe, pulando..."
  fi
done < "$input_file"

echo "Clone de plugins concluído."

