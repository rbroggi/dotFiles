
My Ubuntu setup step by step:

1. first packages and git config:

```bash
sudo add-apt-repository ppa:neovim-ppa/stable #for neovim
sudo apt-get update
sudo apt-get install i3 vim python git xclip python-dev python-pip python3-dev python3-pip neovim curl npm
sudo npm install -g neovim
git config --global user.email <email>
git config --global user.name <user> 
mkdir -p ~/.fonts
```
2. setup your dotfile-tracking specialized git command. With this command you will have your dotfiles (complete explanations [here](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html):
```bash
$ git clone --separate-git-dir=$HOME/.dotfiles <remote_dotfiles_repo> ~
```
If the previous command fails you can try:

```bash
$ git clone --separate-git-dir=$HOME/.dotfiles <remote_dotfiles_repo> tmpdotfiles
$ rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
$ rm -r tmpdotfiles
```
