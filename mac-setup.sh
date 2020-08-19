#!/usr/bin/env bash

echo "Install XCode first"
xcode-select --install

# Setup directories
mkdir ~/Projects
mkdir ~/Projects/Repositories
mkdir ~/Projects/Material

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Tap
brew tap homebrew/bundle
brew tap homebrew/core
brew tap caskroom/fonts
brew tap matteocrippa/ibeacon

# Update
brew update
brew upgrade

# Install brews
brew install coreutils
brew install git
brew install node yarn
brew install wget
brew install curl
brew install cocoapods
brew install swiftlint
brew install mackup
brew install ibeacon

# Vim
brew install vim
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Zsh
brew install zsh zsh-completions
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
brew install zsh-autosuggestions

# install zsh spaceship
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Setup ZSHRC
echo "export PATH=\$HOME/bin:/usr/local/bin:\$PATH" > ~/.zshrc
echo "export PATH=\$HOME/.fastlane/bin:\$PATH" >> ~/.zshrc
echo "export PATH=/Users/matteocrippa/Library/Android/sdk/platform-tools:\$PATH" >> ~/.zshrc
echo "export PATH=/Users/matteocrippa/Library/Android/sdk:\$PATH" >> ~/.zshrc
echo "export ANDROID_SDK_ROOT=/usr/local/share/android-sdk"
echo "export ZSH=/Users/matteocrippa/.oh-my-zsh" >> ~/.zshrc
echo "ZSH_THEME=\"spaceship\"" >> ~/.zshrc
echo "plugins=(git colored-man colorize github virtualenv brew osx zsh-syntax-highlighting)" >> ~/.zshrc
echo "fpath=(/usr/local/share/zsh-completions \$fpath)" >> ~/.zshrc
echo "source \$ZSH/oh-my-zsh.sh" >> ~/.zshrc
echo "export SSH_KEY_PATH=\"~/.ssh/rsa_id\"" >> ~/.zshrc
echo "source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc


# List of apps
brew cask install android-sdk
brew cask install android-file-transfer
brew cask install caffeine
brew cask install charles
brew cask install google-chrome
brew cask install cleanmymac
brew cask install clipy
brew cask install fastlane
brew cask install docker
brew cask install docker-toolbox
brew cask install grammarly
brew cask install imageoptim
brew cask install intellij-idea
brew cask install istat-menus
brew cask install iterm2
brew cask install knuff
brew cask install paw
brew cask install sourcetree
brew cask install tunnelblick
brew cask install the-unarchiver
brew cask install vscodium
brew cask install homebrew/cask-drivers/luna-display
brew cask install brooklyn
brew cask install spectacle
brew cask install google-backup-and-sync
brew cask install jetbrains-toolbox
brew cask install kitematic

# Install mas
brew install mas

# Cleanup
brew cleanup

# Download AppStore apps
mas install 497799835
mas install 409183694
mas install 409201541
mas install 409203825
mas install 407963104
mas install 1063996724
mas install 1007457278
mas install 476533227
mas install 824171161
mas install 1178548760
mas install 1063996724
mas install 1176895641
mas install 732710998

# Setup XCode theme
mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
cd ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
git clone https://github.com/dracula/xcode.git Dracula
cp Dracula.xccolortheme .
chmod +x Dracula.xccolortheme
echo "👉 Select Dracula theme in XCode"

# Setup iTerm theme
echo "👉 Select import in iTerm and install it"
cd ~/Downloads
git clone https://github.com/dracula/iterm.git

# Install font
brew cask install font-meslo-for-powerline
echo "👉 Set Meslo powerline as iTerm2 font"

# Force disable .DS_Store
git config --global core.excludesfile ~/.gitignore
echo .DS_Store >> ~/.gitignore

# Disable brew analytics
brew analytics off

# Transmit
wget https://download.panic.com/transmit/Transmit%204.4.13.zip

# Restore mackup
echo "[storage]" >> ~/.mackup.cfg
echo "engine = google_drive" >> ~/.mackup.cfg
echo "directory = Mackup" >> ~/.mackup.cfg
echo "[applications_to_ignore]" >> ~/.mackup.cfg
echo "vscode" >> ~/.mackup.cfg
echo "atom" >> ~/.mackup.cfg
echo "docker" >> ~/.mackup.cfg

mackup restore

# Restore Visual Studio Code
echo ">> Install https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync"

# Little Snitch
echo ">> Install https://www.obdev.at/products/littlesnitch/download.html"

# fix issue with device sleep and drain battery
sudo pmset -b tcpkeepalive 0
sudo pmset hibernatemode 25
