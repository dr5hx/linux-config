#!/bin/bash
echo "This script will install and configure vim and zsh automatic."
echo "The time this takes is related to the network conditions, please wait patiently."
if [[ `whoami` == "root" ]];then
    echo -e "\033[31mYou are  running this script with Root\033[0m"
    echo -e "\033[31mGenerally, we do not recommend using root for programming or directly controlling your Linux OS, especially when you are a beginner \033[0m"
    echo -e "\033[31mSo, There is no necessary for you to configure with root."
    read -p "Do you really want to do this?[N/y]" choice
    if [[ ${choice} != y ]];then
    	echo "Bye."
    	exit 1
    fi
fi
if which apt-get >/dev/null; then
	sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git wget
elif which yum >/dev/null; then
	sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel wget	epel-release python3 python3-devel
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

#sudo easy_install -ZU autopep8 
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
rm -rf ~/.local/share/nvim/ 2>&1 >/dev/null
mv -f ~/.nvim ~/.nvim_old
rm -rf ~/.config/nvim/

if !hash node 2>/dev/null; then
    echo "install nvs for manage node"
    export NVS_HOME="$HOME/.nvs"
    git clone https://github.com/jasongin/nvs "$NVS_HOME"
    . "$NVS_HOME/nvs.sh" install
    nvs add node/14.19.3 && nvs link 14.19.3 && nvs use 14.19.3 && npm install -g neovim
fi
pip3 install pynvim
cd ~/ && wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz && tar xfzv nvim-linux64.tar.gz -C ~/.nvim
if [$SHELL == '/bin/zsh']; then
    echo "NVIM_HOME=~/.nvim" >> ~/.bashrc
    echo "export PATH=$NVIM_HOME/bin:$PATH" >> ~/.bashr
    source ~/.bashrc
elif [$SHELL == '/bin/bash']; then
    echo "NVIM_HOME=~/.nvim" >> ~/.zshrc
    echo "export PATH=$NVIM_HOME/bin:$PATH" >> ~/.zshrc
    source ~/.zshrc
fi
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim/
cd ~/.config/nvim && ln -s ~/linux-config/nvim/init.vim init.vim
echo "程序正在自动安装相应插件" > nvim_install
echo "你会发现，所有任务会瞬间完成。当然，如果真的没有安装成功，上面的命令也会重新安装未完成的插件。" >> nvim_install
echo "安装完毕将自动退出" >> nvim_install
echo "请耐心等待" >> nvim_install
nvim nvim_install -c "CocInstall coc-clangd"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-cmake"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-emmet"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-git"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-highlight"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-jedi"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-json"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-python"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-sh"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-snippets"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-vimlsp"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-yaml"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-syntax"  -c "q" -c "q"
nvim nvim_install -c "CocInstall coc-pairs"  -c "q" -c "q"
rm nvim_install
echo "安装完成"

