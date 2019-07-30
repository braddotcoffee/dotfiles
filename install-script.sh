CURR_DIR=$(echo $PWD)

# Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Symbolic link files
ln -s $CURR_DIR/Personal-Computer/.vimrc ~/.vimrc
ln -s $CURR_DIR/Personal-Computer/.tmux.conf ~/.tmux.conf

# Install Plugins
vim ~/.vimrc +PlugInstall +qall

# Make ZSH default shell
chsh -s $(which zsh) $(echo $USER)

# Fix Fonts
cd
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir ~/.fonts/
mv PowerlineSymbols.otf ~/.fonts/
mkdir -p .config/fontconfig/conf.d #if directory doesn't exists
fc-cache -vf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# Setup Nord
cd
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git ~/nord
~/nord/src/nord.sh

# Install Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
