#!/bin/bash

echo "🚀 Starte ULTIMATE ENTERPRISE Mac Setup..."

# ---- Persönliche Konfiguration ----
DEFAULT_GIT_NAME="Volker"
DEFAULT_GITHUB_USERNAME="$(whoami)"
DEFAULT_GIT_EMAIL="${DEFAULT_GITHUB_USERNAME}@users.noreply.github.com"

read -r -p "Git-Name [${DEFAULT_GIT_NAME}]: " GIT_NAME
GIT_NAME="${GIT_NAME:-$DEFAULT_GIT_NAME}"

read -r -p "GitHub-Username [${DEFAULT_GITHUB_USERNAME}]: " GITHUB_USERNAME
GITHUB_USERNAME="${GITHUB_USERNAME:-$DEFAULT_GITHUB_USERNAME}"

read -r -p "Git-E-Mail [${DEFAULT_GIT_EMAIL}]: " GIT_EMAIL
GIT_EMAIL="${GIT_EMAIL:-$DEFAULT_GIT_EMAIL}"

echo "👉 Einrichtung wird vorbereitet für: ${GIT_NAME} (${GITHUB_USERNAME}, ${GIT_EMAIL})"

###############################################
# 1. Homebrew installieren
###############################################

if ! command -v brew >/dev/null 2>&1; then
    echo "🍺 Installiere Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "🍺 Homebrew bereits installiert."
fi

brew update

###############################################
# 2. Core-Tools installieren
###############################################

echo "🔧 Installiere Core-CLI-Tools..."
brew install git wget gh jq fzf zsh-autosuggestions zsh-syntax-highlighting

###############################################
# 3. Kubernetes-Stack
###############################################

echo "☸️ Installiere Kubernetes-Tools..."
brew install kubectl
brew install k3d
brew install helm

###############################################
# 4. Terraform & Terragrunt
###############################################

echo "🌍 Installiere Terraform & Terragrunt..."
brew install terraform
brew install terragrunt

###############################################
# 5. Cloud CLIs (AWS, Azure, GCP)
###############################################

echo "☁️ Installiere Cloud-CLIs..."
brew install awscli
brew install azure-cli
brew install google-cloud-sdk

###############################################
# 6. Docker Desktop Download
###############################################

echo "🐳 Lade Docker Desktop herunter..."
wget -O "$HOME/Downloads/Docker.dmg" "https://desktop.docker.com/mac/main/arm64/Docker.dmg"
echo "👉 Bitte Docker.dmg manuell installieren."

###############################################
# 7. VS Code installieren
###############################################

if [ ! -d "/Applications/Visual Studio Code.app" ]; then
    echo "💻 Installiere VS Code..."
    wget -O "$HOME/Downloads/vscode.zip" "https://update.code.visualstudio.com/latest/darwin/universal/stable"
    unzip "$HOME/Downloads/vscode.zip" -d /Applications
else
    echo "💻 VS Code bereits installiert."
fi

###############################################
# 8. VS Code Extensions
###############################################

echo "🧩 Installiere VS Code Extensions..."
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-azuretools.vscode-docker
code --install-extension GitHub.vscode-pull-request-github
code --install-extension GitHub.copilot
code --install-extension eamodio.gitlens
code --install-extension antropic.claude-code

###############################################
# 9. VS Code Settings
###############################################

echo "⚙️ Erstelle VS Code Settings..."
mkdir -p "$HOME/Library/Application Support/Code/User"
cat <<'EOF' > "$HOME/Library/Application Support/Code/User/settings.json"
{
  "editor.formatOnSave": true,
  "files.autoSave": "afterDelay",
  "terminal.integrated.fontSize": 14,
  "git.enableSmartCommit": true,
  "git.confirmSync": false,
  "remote.containers.showWelcome": false,
  "docker.showStartPage": false
}
EOF

###############################################
# 10. Git konfigurieren
###############################################

echo "🧩 Git konfigurieren..."
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main

###############################################
# 11. SSH-Key Setup
###############################################

SSH_KEY="$HOME/.ssh/id_ed25519"

if [ ! -f "$SSH_KEY" ]; then
    echo "🔑 Erzeuge SSH-Key..."
    ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f "$SSH_KEY" -N ""
else
    echo "🔑 SSH-Key existiert bereits."
fi

eval "$(ssh-agent -s)"
ssh-add "$SSH_KEY"
pbcopy < "${SSH_KEY}.pub"

echo "📋 SSH-Key in Zwischenablage kopiert!"

###############################################
# 12. GitHub CLI vorbereiten
###############################################

echo "🔗 GitHub CLI vorbereiten..."
echo "👉 Danach bitte ausführen: gh auth login"

###############################################
# 13. ZSH Aliases & Optimierungen
###############################################

echo "⚡ Optimiere ZSH..."
cat <<'EOF' >> "$HOME/.zshrc"
# --- Aliases Enterprise ---
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias k="kubectl"
alias kctx="kubectl config use-context"
alias kns="kubectl config set-context --current --namespace"
alias tf="terraform"
alias tg="terragrunt"
alias awsprofile="export AWS_PROFILE="
alias gcloudinit="gcloud init"
alias azlogin="az login"
alias dev="cd ~/dev/projects"
alias infra="cd ~/dev/infra"

# Autosuggestions & Syntax Highlighting
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

###############################################
# 14. Dev-Ordnerstruktur
###############################################

echo "📁 Erstelle Enterprise-Dev-Struktur..."
mkdir -p "$HOME/dev/projects"
mkdir -p "$HOME/dev/infra/terraform"
mkdir -p "$HOME/dev/infra/terragrunt"
mkdir -p "$HOME/dev/infra/k8s"
mkdir -p "$HOME/dev/infra/scripts"
mkdir -p "$HOME/dev/tmp"

###############################################
# 15. Lokales k3d Cluster (optional)
###############################################

echo "☸️ Erzeuge optionales lokales k3d-Cluster..."
k3d cluster create dev-cluster --agents 2 --servers 1 || echo "k3d Cluster konnte nicht erstellt werden (Docker evtl. noch nicht installiert)."

###############################################
# 16. macOS Tweaks
###############################################

echo "🛠️ Wende macOS Tweaks an..."
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location "$HOME/Screenshots"

###############################################
# Fertig
###############################################

echo "🎉 ULTIMATE ENTERPRISE Setup abgeschlossen!"
echo "👉 SSH-Key ist in der Zwischenablage – jetzt bei GitHub einfügen."
echo "👉 Danach: gh auth login"
echo "👉 Docker.dmg manuell installieren."
echo "👉 Cloud-CLIs: aws configure, az login, gcloud init ausführen."
