#!/bin/bash

# Solicitar a língua dos comentários
read -p "Escolha seu idioma / Choose your language (pt/en): " idioma

# Função para exibir mensagens em português
mensagem_pt() {
  case $1 in
    zsh_nao_instalado) echo "❌ Zsh não está instalado. Instalando Zsh..." ;;
    instalando_ohmyzsh) echo "⬇️ Instalando Oh My Zsh..." ;;
    alterando_tema) echo "🎨 Alterando o tema do Zsh para 'fino'..." ;;
    adicionando_plugins) echo "➕ Adicionando plugins ao Zsh..." ;;
    instalando_autosuggestions) echo "⬇️ Instalando o plugin 'zsh-autosuggestions'..." ;;
    erro_autosuggestions) echo "❌ Erro ao clonar o repositório 'zsh-autosuggestions'." ;;
    instalando_syntax_highlighting) echo "⬇️ Instalando o plugin 'zsh-syntax-highlighting'..." ;;
    erro_syntax_highlighting) echo "❌ Erro ao clonar o repositório 'zsh-syntax-highlighting'." ;;
    sucesso) echo "✅ Oh My Zsh instalado, tema 'fino' configurado e plugins adicionados com sucesso." ;;
  esac
}

# Função para exibir mensagens em inglês
mensagem_en() {
  case $1 in
    zsh_nao_instalado) echo "❌ Zsh is not installed. Installing Zsh..." ;;
    instalando_ohmyzsh) echo "⬇️ Installing Oh My Zsh..." ;;
    alterando_tema) echo "🎨 Changing Zsh theme to 'fino'..." ;;
    adicionando_plugins) echo "➕ Adding plugins to Zsh..." ;;
    instalando_autosuggestions) echo "⬇️ Installing 'zsh-autosuggestions' plugin..." ;;
    erro_autosuggestions) echo "❌ Error cloning 'zsh-autosuggestions' repository." ;;
    instalando_syntax_highlighting) echo "⬇️ Installing 'zsh-syntax-highlighting' plugin..." ;;
    erro_syntax_highlighting) echo "❌ Error cloning 'zsh-syntax-highlighting' repository." ;;
    sucesso) echo "✅ Oh My Zsh installed, 'fino' theme configured and plugins added successfully." ;;
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

# Verificar se o Zsh está instalado
if ! command -v zsh &> /dev/null; then
  mensagem zsh_nao_instalado
  brew install zsh
fi

# Instalar Oh My Zsh
mensagem instalando_ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Alterar o tema no arquivo .zshrc para "fino"
mensagem alterando_tema
sed -i '' 's/^ZSH_THEME=".*"/ZSH_THEME="fino"/' ~/.zshrc

# Adicionar plugins à variável plugins
mensagem adicionando_plugins

mensagem instalando_autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Validar se o clone foi bem-sucedido
if [ $? -ne 0 ]; then
  mensagem erro_autosuggestions
  exit 1
fi

mensagem instalando_syntax_highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Validar se o clone foi bem-sucedido
if [ $? -ne 0 ]; then
  mensagem erro_syntax_highlighting
  exit 1
fi

sed -i '' 's/^plugins=(.*)/plugins=(git colorize zsh-autosuggestions colored-man-pages safe-paste web-search vscode gitfast zsh-syntax-highlighting)/' ~/.zshrc

source ~/.zshrc

mensagem sucesso