
My Ubuntu setup step by step:

1. first packages and git config:

```bash
sudo add-apt-repository ppa:neovim-ppa/stable #for neovim
sudo apt-get update
sudo apt-get install i3 vim python git xclip python-dev python-pip python3-dev python3-pip neovim curl npm gnome-tweaks feh compton rofi ranger dunst unclutter lxappearance htop qrencode i3blocks pulseaudio pulsemixer calcurse pavucontrol clang pavucontrol tmux zathura
sudo npm install -g neovim
git config --global user.email <email>
git config --global user.name <user>
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf #for fzf
~/.fzf/install #installing fzf
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

# Acknowledgements

Big thanks to Luke Smith for the inspiring lessons from his [videos](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA) and from his [repos ](https://github.com/LukeSmithxyz).

Also big thanks to Alex Booker for the nice work in this [playlist](https://www.youtube.com/watch?v=j1I63wGcvU4&list=PL5ze0DjYv5DbCv9vNEzFmP6sU7ZmkGzcf) and for his [repos](https://github.com/alexbooker)
