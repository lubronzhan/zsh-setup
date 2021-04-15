#!/bin/bash

echo "###########################################"
echo "Install oh-my-zsh"

if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)



echo ""
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



echo ""
echo "###########################################"
echo "Change theme ZSH_THEME=agnoster"
sed -i "" 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/' ~/.zshrc




echo ""
echo "###########################################"
echo "Change AUTO_SUGGESTION_HIGHLIGHT_COLOR"
echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'" >> ~/.zshrc



echo ""
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


echo ""
echo "###########################################"
echo "Change DEFAULT_USER to only contain username"
echo "Change DEFAULT_USER to only contain username">> ~/.zshrc
echo "DEFAULT_USER=$USER" >> ~/.zshrc


echo ""
echo "###########################################"
echo "Install font"
git clone git@github.com:powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts



echo ""
echo "###########################################"
echo "Install fzf..."
echo "For show command history by using ^r"
cat >> ~/.zshrc <<EOF
## fzf
## fzf show full screen by default. This one shows 40% of the screen
export FZF_DEFAULT_OPTS='--height 40%'
EOF
if ! [ -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
~/.fzf/install



echo ""
echo "GOPROXY"
export GO111MODULE=on
export GOPROXY=https://goproxy.cn



eccho ""
echo "git"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status



echo "##############################################"
echo "########### Installation is done #############"
echo "########### Manual work          #############"
echo "##############################################"
echo "Don't forgot to change font to 'Meslo LG M Regular for Powerline' and"
echo "Set color preset to 'Solarized Dark' in your iTerm!"
echo "run 'source ~/.zshrc'"
echo "run 'fzf'. It requires some permissions to work"

