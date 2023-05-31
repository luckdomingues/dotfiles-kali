#!/usr/bin/env bash
# criado em    :  29.05.2023
# atualiado em : 29.05.2023
# script de instalacao do dotfiles no Kali 
#

# Constantes
hoje=$(date +'%Y%m%d')
UID=$(/usr/bin/id -u)
dir_atual=$(pwd)
dir_user=$(echo ~)
dir_destino="~/dotfiles"

# verifica se o usuario é o root e alerta o risco
if [ $UID -ne 0 ] ; then
  echo "Usuario root , melhor abortar..."
  sleep 1
  exit 1
fi

#################
# Valida estrutura de diretorios
#####################################
# Verifica se diretorio existe e se nao , cria
if [ ! -d ~/dotfiles ];then
  echo "[+] Criando arquivo dotfiles..."
  mkdir -p ~/dotfiles  
fi

if [ ! -d ~/dotfiles/olds ];then
  echo "[+] Criando arquivo dotfiles/olds..."
  mkdir -p ~/dotfiles/olds  
fi

# verifica se o arquivo .zsh_functions existe
# Existindo tira uma copia, nao existindo cria
if [ ! -d ~/dotfiles/dot-zsh_functions ];then
  cp $dir_atual/dot-zsh_functions ~/dotfiles/
fi


###################
# Valida arquivos existentes
##################################
# tira copia do .vimrc atual
if [ -f .vimrc ] ; then
  cp $dir_user/.vimrc $dir_user/dotfiles/olds/$hoje.vimrc
fi

# tira copia do .zshrc atual
if [ -f .zshrc ]; then
  cp $dir_user/.zshrc $dir_user/dotfiles/olds/$hoje.zshrc
fi

#
if [ -f .zsh_functions ]; then
  cp $dir_user/.zsh_functions $dir_user/dotfiles/olds/$hoje.zsh_functions
fi

###################
# Criando os links simbolicos
##################################

ln -s ~/dotfiles/.zshrc ~/

# verifica se o .zshrc tem o apontador para o .zsh_functions

# 
