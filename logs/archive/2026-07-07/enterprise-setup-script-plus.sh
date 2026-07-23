#!/bin/bash
set -euo pipefail

echo "🚀 Starte PERSONALISIERTES Mac-Setup..."

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

read -r -p "GitHub-Repos (kommagetrennt, z.B. owner/repo1,owner/repo2; leer = überspringen): " REPO_INPUT
REPO_INPUT="${REPO_INPUT:-}"

read -r -p "Mac-Apps installieren? (iTerm2, Rectangle, Raycast, Arc, Warp) [y/N]: " INSTALL_APPS
INSTALL_APPS="${INSTALL_APPS:-N}"

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
# 2. Basis-Tools installieren
###############################################

echo "🔧 Installiere Basis-Tools..."
brew install git wget gh jq fzf zsh-autosuggestions zsh-syntax-highlighting

###############################################
# 3. Node.js, Python, pipx
###############################################

echo "🟩 Installiere Node.js und Python-Tooling..."
if ! command -v nvm >/dev/null 2>&1; then
    brew install nvm
    mkdir -p "$HOME/.nvm"
    export NVM_DIR="$HOME/.nvm"
    if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
        . "/opt/homebrew/opt/nvm/nvm.sh"
    elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
        . "/usr/local/opt/nvm/nvm.sh"
    fi
    cat <<'EOF' >> "$HOME/.zshrc"
# NVM Setup
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
EOF
fi

export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
    . "/opt/homebrew/opt/nvm/nvm.sh"
elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
    . "/usr/local/opt/nvm/nvm.sh"
fi
nvm install --lts || true

brew install python pipx
pipx ensurepath || true

###############################################
# 4. Optional macOS Apps
###############################################

if [[ "$INSTALL_APPS" =~ ^[Yy]$ ]]; then
    echo "📦 Installiere macOS Apps..."
    brew install --cask iterm2 rectangle raycast arc warp || true
fi

###############################################
# 5. Docker + Cloud-Tools
###############################################

echo "🐳 Lade Docker Desktop herunter..."
wget -O "$HOME/Downloads/Docker.dmg" "https://desktop.docker.com/mac/main/arm64/Docker.dmg"

echo "☁️ Installiere Cloud-CLI-Tools..."
brew install awscli azure-cli google-cloud-sdk kubectl k3d helm terraform terragrunt || true

###############################################
# 6. VS Code installieren
###############################################

if [ ! -d "/Applications/Visual Studio Code.app" ]; then
    echo "💻 Installiere VS Code..."
    wget -O "$HOME/Downloads/vscode.zip" "https://update.code.visualstudio.com/latest/darwin/universal/stable"
    unzip -q "$HOME/Downloads/vscode.zip" -d /Applications
else
    echo "💻 VS Code bereits installiert."
fi

###############################################
# 7. VS Code Extensions
###############################################

echo "🧩 Installiere VS Code Extensions..."
if command -v code >/dev/null 2>&1; then
    code --install-extension GitHub.copilot || true
    code --install-extension GitHub.vscode-pull-request-github || true
    code --install-extension eamodio.gitlens || true
    code --install-extension esbenp.prettier-vscode || true
    code --install-extension ms-python.python || true
    code --install-extension ms-azuretools.vscode-docker || true
    code --install-extension antropic.claude-code || true
else
    echo "⚠️ VS Code CLI ist noch nicht verfügbar. Bitte im Editor den PATH-Befehl aktivieren."
fi

###############################################
# 8. VS Code Settings
###############################################

echo "⚙️ Erstelle VS Code Settings..."
mkdir -p "$HOME/Library/Application Support/Code/User"
cat <<'EOF' > "$HOME/Library/Application Support/Code/User/settings.json"
{
  "editor.formatOnSave": true,
  "editor.tabSize": 2,
  "files.autoSave": "afterDelay",
  "terminal.integrated.fontSize": 14,
  "workbench.startupEditor": "none",
  "git.enableSmartCommit": true,
  "git.confirmSync": false,
  "prettier.singleQuote": true
}
EOF

###############################################
# 9. Git konfigurieren
###############################################

echo "🧩 Git konfigurieren..."
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main

git config --global github.user "$GITHUB_USERNAME"

###############################################
# 10. SSH-Key Setup
###############################################

SSH_KEY="$HOME/.ssh/id_ed25519"
if [ ! -f "$SSH_KEY" ]; then
    echo "🔑 Erzeuge SSH-Key..."
    ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f "$SSH_KEY" -N ""
else
    echo "🔑 SSH-Key existiert bereits."
fi

eval "$(ssh-agent -s)" || true
ssh-add "$SSH_KEY" || true
pbcopy < "${SSH_KEY}.pub" || true

echo "📋 SSH-Key in Zwischenablage kopiert!"

###############################################
# 11. ZSH und Aliases
###############################################

echo "⚡ Optimiere ZSH..."
cat <<'EOF' >> "$HOME/.zshrc"
# --- Custom Aliases ---
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias v="code ."
alias dev="cd ~/dev/projects"
alias ll="ls -lah"
alias py="python3"
alias npmi="npm install"

# Autosuggestions & Syntax Highlighting
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

###############################################
# 12. Dev-Ordnerstruktur und Templates
###############################################

echo "📁 Erstelle Dev-Ordnerstruktur..."
mkdir -p "$HOME/dev/projects" "$HOME/dev/templates/node" "$HOME/dev/templates/python" "$HOME/dev/tools" "$HOME/dev/tmp"

cat <<'EOF' > "$HOME/dev/templates/node/package.json"
{
  "name": "starter-project",
  "version": "1.0.0",
  "scripts": {
    "start": "node index.js"
  }
}
EOF

echo "console.log('Hello Node!')" > "$HOME/dev/templates/node/index.js"

echo 'print("Hello Python!")' > "$HOME/dev/templates/python/main.py"

cat <<'EOF' >> "$HOME/.zshrc"
# Automatische Python venv
function mkvenv() {
    python3 -m venv .venv
    source .venv/bin/activate
    pip install --upgrade pip
}
EOF

###############################################
# 13. Repos klonen
###############################################

if [ -n "$REPO_INPUT" ]; then
    echo "🔄 Klone angegebene Repositories..."
    mkdir -p "$HOME/dev/projects"
    cd "$HOME/dev/projects"
    IFS=',' read -r -a REPOS <<< "$REPO_INPUT"
    for repo in "${REPOS[@]}"; do
        repo="$(echo "$repo" | xargs)"
        [ -n "$repo" ] || continue
        if [[ "$repo" != http* ]]; then
            repo="https://github.com/${repo}.git"
        fi
        repo_name="$(basename "$repo" .git)"
        if [ ! -d "$repo_name" ]; then
            echo "Klonen: $repo"
            git clone "$repo" "$repo_name" || true
        else
            echo "Überspringe vorhandenes Repo: $repo_name"
        fi
    done
fi

###############################################
# 14. macOS Tweaks
###############################################

echo "🛠️ Wende macOS Tweaks an..."
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location "$HOME/Screenshots"

###############################################
# 15. Abschluss
###############################################

echo "🎉 Personalisiertes Setup abgeschlossen!"
echo "👉 SSH-Key ist in der Zwischenablage – jetzt bei GitHub einfügen."
echo "👉 Danach: gh auth login"
echo "👉 Docker.dmg manuell installieren."
echo "👉 Falls VS Code CLI fehlt: Cmd + Shift + P → 'Shell Command: Install code command in PATH'"
