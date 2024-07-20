OS="$(uname)"
DOTFILES_FOLDER=$HOME/dotfiles

#=====================
# Remove old dot flies
#=====================
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zsh_prompt > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.gitconfig > /dev/null 2>&1

sudo rm -rf ~/.config/nvim
sudo rm -rf ~/.config/git/prompts

mkdir ~/.config

#=======================
# Install basic packages
#=======================
if [[ "${OS}" == "Linux" ]]
then
  sudo apt-get install -y build-essential
fi

#==============
# Configure git
#==============
if [[ "${OS}" == "Linux" ]]
then
  sudo add-apt-repository -y ppa:git-core/ppa
  sudo apt update && sudo apt install -y git
fi
ln -s $DOTFILES_FOLDER/config/git/gitconfig $HOME/.gitconfig

# https://harper.blog/2024/03/11/use-an-llm-to-automagically-generate-meaningful-git-commit-messages/
ln -s $DOTFILES_FOLDER/config/git/prompts $HOME/.config/git/prompts


#==============================
# Install homebrew and packages
#==============================
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ "${OS}" == "Linux" ]]
then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew doctor
brew update
brew bundle --file=$DOTFILES_FOLDER/install-script/Brewfile


#==============
# Configure zsh
#==============

# Make zsh available to be selected
if grep -q 'zsh' /etc/shells; then
  echo "zsh is available in /etc/shells"
else
  command -v zsh | sudo tee -a /etc/shells
fi

# Set zsh as default shell
chsh -s $(command -v zsh)

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"

# Remove installed zshrc
rm -f $HOME/.zshrc

# Link config
ln -s $DOTFILES_FOLDER/config/zsh/zshrc $HOME/.zshrc

if [[ "${OS}" == "Linux" ]]
then
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.zshrc
fi

echo -e "\\n. $(brew --prefix asdf)/libexec/asdf.sh" >> $HOME/.zshrc

#===============
# Configure nvim
#===============
ln -s $DOTFILES_FOLDER/config/nvim $HOME/.config/nvim
