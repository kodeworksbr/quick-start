#!/bin/bash

# Solicitar a língua dos comentários
read -p "Escolha seu idioma / Choose your language (pt/en): " idioma

# Função para exibir mensagens em português
mensagem_pt() {
  case $1 in
    nome_vazio) echo "❌ Erro: Nome não pode estar vazio." ;;
    email_vazio) echo "❌ Erro: Email não pode estar vazio." ;;
    digite_nome) echo "Digite seu nome (mesmo do github): " ;;
    digite_email) echo "Digite seu email (mesmo do github): " ;;
    confirmacao) echo "🧐 As informações estão corretas? (s/n): " ;;
    confirmacao_informacoes) echo "⬇️ Você inseriu as seguintes informações:" ;;
    nome_informacao) echo "🪪 Nome: $nome" ;;
    email_informacao) echo "📧 Email: $email" ;;
    cancelado) echo "❌ Configuração cancelada pelo usuário." ;;
    configurado) echo "✅ email e usuário do github configurado com sucesso" ;;
    chave_gerada) echo "✅ Chave SSH gerada com sucesso" ;;
    ssh_agent_iniciado) echo "✅ ssh-agent iniciado com sucesso" ;;
    chave_adicionada) echo "✅ Chave SSH adicionada ao ssh-agent com sucesso" ;;
    chave_copiada) echo "📑 Chave SSH copiada para a área de transferência. Adicione-a à sua conta do GitHub." ;;
    link_ssh) echo "🔗 adicione a chave SSH ao GitHub: https://github.com/settings/ssh/new e continue a configuração" ;;
    continuar) echo "Continuar configuração? (s/n): " ;;
    habilitar_commits) echo "🧐 Deseja habilitar commits assinados? (s/n): " ;;
    segunda_chave_gerada) echo "✅ Segunda chave SSH para assinatura de commits gerada com sucesso" ;;
    segunda_chave_adicionada) echo "✅ Segunda chave SSH adicionada ao ssh-agent com sucesso" ;;
    segunda_chave_configurada) echo "✅ Segunda chave SSH configurada para assinatura de commits com sucesso" ;;
    segunda_chave_copiada) echo "📑 Chave SSH de assinatura copiada para a área de transferência. Adicione-a à sua conta do GitHub." ;;
    link_signing) echo "🔗 Adicione a chave no github como 'Signing Key': https://github.com/settings/ssh/new" ;;
    concluido) echo "Configuração do GitHub concluída com sucesso." ;;
  esac
}

# Função para exibir mensagens em inglês
mensagem_en() {
  case $1 in
    nome_vazio) echo "❌ Error: Name cannot be empty." ;;
    email_vazio) echo "❌ Error: Email cannot be empty." ;;
    digite_nome) echo "Enter your name (same as github): " ;;
    digite_email) echo "Enter your email (same as github): " ;;
    confirmacao) echo "🧐 Are the details correct? (y/n): " ;;
    confirmacao_informacoes) echo "⬇️ You entered the following information:" ;;
    nome_informacao) echo "🪪 Name: $nome" ;;
    email_informacao) echo "📧 Email: $email" ;;
    cancelado) echo "❌ Configuration canceled by the user." ;;
    configurado) echo "✅ GitHub username and email configured successfully" ;;
    chave_gerada) echo "✅ SSH key generated successfully" ;;
    ssh_agent_iniciado) echo "✅ ssh-agent started successfully" ;;
    chave_adicionada) echo "✅ SSH key added to ssh-agent successfully" ;;
    chave_copiada) echo "📑 SSH key copied to clipboard. Add it to your GitHub account." ;;
    link_ssh) echo "🔗 Add the SSH key to GitHub: https://github.com/settings/ssh/new and continue the configuration" ;;
    continuar) echo "Continue configuration? (y/n): " ;;
    habilitar_commits) echo "🧐 Do you want to enable signed commits? (y/n): " ;;
    segunda_chave_gerada) echo "✅ Second SSH key for signing commits generated successfully" ;;
    segunda_chave_adicionada) echo "✅ Second SSH key added to ssh-agent successfully" ;;
    segunda_chave_configurada) echo "✅ Second SSH key configured for signing commits successfully" ;;
    segunda_chave_copiada) echo "📑 Signing SSH key copied to clipboard. Add it to your GitHub account." ;;
    link_signing) echo "🔗 Add the key to GitHub as 'Signing Key': https://github.com/settings/ssh/new" ;;
    concluido) echo "GitHub configuration completed successfully." ;;
  esac
}

# Função para exibir mensagens de acordo com o idioma escolhido
mensagem() {
  if [ "$idioma" == "pt" ]; then
    mensagem_pt $1
  else
    mensagem_en $1
  fi
}

# Solicitar o nome de usuário e email do GitHub
read -p "$(mensagem digite_nome)" nome
read -p "$(mensagem digite_email)" email

# Validar se o nome está vazio
if [ -z "$nome" ]; then
  mensagem nome_vazio
  exit 1
fi

# Validar se o email está vazio
if [ -z "$email" ]; then
  mensagem email_vazio
  exit 1
fi

# Confirmar as informações inseridas pelo usuário
clear
mensagem confirmacao_informacoes
mensagem nome_informacao
mensagem email_informacao
read -p "$(mensagem confirmacao)" confirmacao

if [[ "$confirmacao" != "s" && "$confirmacao" != "y" ]]; then
  mensagem cancelado
  exit 1
fi

# Configurar o nome de usuário e email do GitHub
git config --global user.name "$nome"
git config --global user.email "$email"
mensagem configurado

# Gerar uma nova chave SSH
ssh-keygen -t ed25519 -C "$email"
mensagem chave_gerada

# Iniciar o ssh-agent em segundo plano
eval "$(ssh-agent -s)"
mensagem ssh_agent_iniciado

# Adicionar a chave SSH ao ssh-agent
ssh-add ~/.ssh/id_ed25519
mensagem chave_adicionada

# Copiar a chave SSH para a área de transferência
pbcopy < ~/.ssh/id_ed25519.pub
mensagem chave_copiada
mensagem link_ssh

read -p "$(mensagem continuar)" continuarconfig

if [[ "$continuarconfig" == "s" || "$continuarconfig" == "y" ]]; then
  # Perguntar ao usuário se deseja habilitar commits assinados
  read -p "$(mensagem habilitar_commits)" habilitar_commits_assinados

  if [[ "$habilitar_commits_assinados" == "s" || "$habilitar_commits_assinados" == "y" ]]; then
    # Gerar uma segunda chave SSH para assinatura de commits
    ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519_signing
    mensagem segunda_chave_gerada

    # Adicionar a segunda chave SSH ao ssh-agent
    ssh-add ~/.ssh/id_ed25519_signing
    mensagem segunda_chave_adicionada

    # Configurar a segunda chave SSH para assinatura de commits
    git config --global user.signingkey ~/.ssh/id_ed25519_signing
    mensagem segunda_chave_configurada

    # Copiar a chave SSH para a área de transferência
    pbcopy < ~/.ssh/id_ed25519_signing.pub
    mensagem segunda_chave_copiada
    mensagem link_signing
  fi
fi

mensagem concluido