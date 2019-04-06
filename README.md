
My Ubuntu setup step by step:

1. first packages and git config:

```bash
$ sudo apt-get install i3 vim python git xclip
$ git config --global user.email <email>
$ git config --global user.name <user> 
```
2. setup your dotfile-tracking specialized git command. With this command you will have your dotfiles (complete explanations [here]{https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html}:
```bash
$ git clone --separate-git-dir=$HOME/.dotfiles <remote_dotfiles_repo> ~
```
If the previous command fails you can try:

```bash
$ git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anandpiyer/.dotfiles.git tmpdotfiles
$ rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
$ rm -r tmpdotfiles
```
