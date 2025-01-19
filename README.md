🇧🇷 [Documentação em Português](#scripts-de-configuração) | 🇺🇸 [English Documentation](#configuration-scripts)

# Scripts de Configuração

Este repositório contém dois scripts para configurar o GitHub e o Oh My Zsh no terminal do macOS.

## Script de Configuração do GitHub

### Descrição

Este script configura o GitHub no terminal do macOS, incluindo a configuração do nome de usuário, email, geração de chave SSH e habilitação de commits assinados.

### Como Utilizar

1. Clone o repositório:
   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd <NOME_DO_REPOSITORIO>
   ```

2. Torne o script executável:
   ```bash
   chmod +x githubconfig.sh
   ```

3. Execute o script:
   ```bash
   ./githubconfig.sh
   ```

### O que o Script Faz

- Solicita o nome de usuário e email do GitHub.
- Gera uma nova chave SSH.
- Inicia o `ssh-agent` e adiciona a chave SSH gerada.
- Habilita commits assinados e configura uma chave SSH para assinatura de commits.

### Repositórios e Documentação

- [GitHub CLI](https://cli.github.com/)
- [Documentação Oficial de Chaves SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Documentação Oficial de Commits Assinados](https://docs.github.com/en/authentication/managing-commit-signature-verification)

## Script de Configuração do Oh My Zsh

### Descrição

Este script instala o Oh My Zsh no terminal do macOS, altera o tema para "fino" e adiciona plugins úteis.

### Como Utilizar

1. Clone o repositório:
   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd <NOME_DO_REPOSITORIO>
   ```

2. Torne o script executável:
   ```bash
   chmod +x ohmyzshconfig.sh
   ```

3. Execute o script:
   ```bash
   ./ohmyzshconfig.sh
   ```

### O que o Script Faz

- Verifica se o Zsh está instalado e instala se necessário.
- Instala o Oh My Zsh.
- Altera o tema no arquivo `.zshrc` para "fino".
- Adiciona os plugins `git`, `colorize`, `zsh-autosuggestions`, `colored-man-pages`, `safe-paste`, `web-search`, `vscode`, `gitfast` e `zsh-syntax-highlighting`.

### Plugins Instalados

- `git`: Integração com Git.
- `colorize`: Adiciona cores a comandos como `cat`.
- `zsh-autosuggestions`: Sugestões de comandos baseadas no histórico.
- `colored-man-pages`: Adiciona cores às páginas de manual.
- `safe-paste`: Evita colagem acidental e execução automática de comandos.
- `web-search`: Facilita a busca na web com `google chatgpt`.
- `vscode`: Atalhos para o Visual Studio Code.
- `gitfast`: Acelera comandos do Git.
- `zsh-syntax-highlighting`: Realça a sintaxe dos comandos.

### Repositórios e Documentação

- [Oh My Zsh](https://ohmyz.sh/)
- [Repositório do Oh My Zsh no GitHub](https://github.com/ohmyzsh/ohmyzsh)
- [Plugin zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [Plugin zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

# Configuration Scripts

This repository contains two scripts to configure GitHub and Oh My Zsh in the macOS terminal.

## GitHub Configuration Script

### Description

This script configures GitHub in the macOS terminal, including setting up the username, email, SSH key generation, and enabling signed commits.

### How to Use

1. Clone the repository:
   ```bash
   git clone <REPOSITORY_URL>
   cd <REPOSITORY_NAME>
   ```

2. Make the script executable:
   ```bash
   chmod +x githubconfig.sh
   ```

3. Run the script:
   ```bash
   ./githubconfig.sh
   ```

### What the Script Does

- Prompts for GitHub username and email.
- Generates a new SSH key.
- Starts the `ssh-agent` and adds the generated SSH key.
- Enables signed commits and configures an SSH key for commit signing.

### Repositories and Documentation

- [GitHub CLI](https://cli.github.com/)
- [Official SSH Key Documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Official Signed Commits Documentation](https://docs.github.com/en/authentication/managing-commit-signature-verification)

## Oh My Zsh Configuration Script

### Description

This script installs Oh My Zsh in the macOS terminal, changes the theme to "fino", and adds useful plugins.

### How to Use

1. Clone the repository:
   ```bash
   git clone <REPOSITORY_URL>
   cd <REPOSITORY_NAME>
   ```

2. Make the script executable:
   ```bash
   chmod +x ohmyzshconfig.sh
   ```

3. Run the script:
   ```bash
   ./ohmyzshconfig.sh
   ```

### What the Script Does

- Checks if Zsh is installed and installs it if necessary.
- Installs Oh My Zsh.
- Changes the theme in the `.zshrc` file to "fino".
- Adds the plugins `git`, `colorize`, `zsh-autosuggestions`, `colored-man-pages`, `safe-paste`, `web-search`, `vscode`, `gitfast`, and `zsh-syntax-highlighting`.

### Installed Plugins

- `git`: Git integration.
- `colorize`: Adds colors to commands like `cat`.
- `zsh-autosuggestions`: Command suggestions based on history.
- `colored-man-pages`: Adds colors to man pages.
- `safe-paste`: Prevents accidental pasting and automatically execution of commands.
- `web-search`: Facilitates web searches.
- `vscode`: Shortcuts for Visual Studio Code.
- `gitfast`: Speeds up Git commands.
- `zsh-syntax-highlighting`: Highlights command syntax.

### Repositories and Documentation

- [Oh My Zsh](https://ohmyz.sh/)
- [Oh My Zsh GitHub Repository](https://github.com/ohmyzsh/ohmyzsh)
- [zsh-autosuggestions Plugin](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting Plugin](https://github.com/zsh-users/zsh-syntax-highlighting)
