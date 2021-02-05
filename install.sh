#!/bin/bash

echo "###########################################"
echo "Install oh-my-zsh"

if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)




echo "###########################################"
echo "Install powerline font"
echo "Don't forgot to change font to 'Meslo LG M Regular for Powerline' and Set color preset to 'Solarized Dark'"

git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts




echo "###########################################"
echo "Change theme ZSH_THEME=agnoster"
sed -i "" 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/' ~/.zshrc





echo "###########################################"
echo "Change AUTO_SUGGESTION_HIGHLIGHT_COLOR"
echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'" >> ~/.zshrc





echo "###########################################"
echo "Install fzf..."
echo "For show history by using ^r"
cat >> ~/.zshrc <<EOF
## fzf
## fzf show full screen by default. This one shows 40% of the screen
export FZF_DEFAULT_OPTS='--height 40%'
EOF
if ! [ -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
~/.fzf/install




echo "###########################################"
echo "Install antigen"
if [ ! -d ~/antigen ]; then
    git clone https://github.com/zsh-users/antigen.git ~/antigen
fi
cat >> ~/.zshrc <<EOF
## Antigen
source ~/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle z
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

EOF



echo "###########################################"
echo "Change DEFAULT_USER to only contain username"
echo "DEFAULT_USER=$USER" >> ~/.zshrc



echo "Installation is done. "
echo "Don't forgot to change font to 'Meslo LG M Regular for Powerline' and"
echo "Set color preset to 'Solarized Dark' in your iTerm!"
echo "run 'source ~/.zshrc'"
