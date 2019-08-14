
alias clip='xclip -sel clip'
alias gitdot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias gitcmake='/usr/bin/git --git-dir=$HOME/.$(basename $(pwd))cmake/ --work-tree=$HOME/repo/acv/'
alias tox='cd ~/repo/acv'
alias acv='cd ~/repo/acv'
alias encrypt_notes='openssl enc -in ${HOME}/note/note.txt  -aes-256-cbc -pass stdin > ${HOME}/note_enc/note.txt.enc'
alias decrypt_notes='openssl enc -in ${HOME}/note_enc/note.txt.enc -d -aes-256-cbc -pass stdin'
