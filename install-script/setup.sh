OS="$(uname)"

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

#=======================
# Install basic packages
#=======================
if [[ "${OS}" == "Linux" ]]
then
  sudo apt-get install build-essential
fi

#==============
# Configure git
#==============
if [[ "${OS}" == "Linux" ]]
then
  sudo add-apt-repository -y ppa:git-core/ppa
  sudo apt update && sudo apt install -y git
fi
ln -s ~/dotfiles/config/git/gitconfig ~/.gitconfig


#==============================
# Install homebrew and packages
#==============================
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ "${OS}" == "Linux" ]]
then
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> $HOME/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

brew doctor
brew update


#==============
# Configure zsh
#==============

# Set zsh as default shell
chsh -s /bin/zsh 

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Link config
ln -s ~/dotfiles/config/zsh/zshrc ~/.zshrc


#===============
# Configure nvim
#===============

# Install vim-plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link config
ln -s ~/dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim

# Install plugins
nvim +':PlugInstall' +qa
