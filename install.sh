if command -v brew &> /dev/null; then
	echo "Homebrew is already installed. Proceeding to next step."
else
    echo "Homebrew is not installed. Installing now..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew_install_if_needed() {
	echo "\nInstalling $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install $1 && echo "$1 is installed"
    fi
}

brew_install_if_needed "neovim"

mkdir ~/.config/nvim/

if command -v git &> /dev/null; then
    echo "Git is already installed."
else
	echo "Git is not installed. Installing now..."
	brew_install_if_needed "git"
fi

git clone https://github.com/masamonoke/neovim-config ~/.config/nvim

brew_install_if_needed "alacritty"

mkdir ~/.config/alacritty

git clone https://github.com/masamonoke/alacritty-config ~/.config/alacritty

if command -v clang > /dev/null 2>&1; then
	echo "llvm is installed"
else
	brew_install_if_needed "llvm"
fi

if command -v node > /dev/null 2>&1; then
    echo "Node.js is installed."
else
    echo "Node.js is not installed."
	brew_install_if_needed "node"
fi

brew_install_if_needed "fish"
