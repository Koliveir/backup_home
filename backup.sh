#!/bin/bash

clear

#DECLARAÇÃO DE VARIAVEIS

DATAHORA=$(date +%Y%m%d%H%M)
PASTA="$HOME/Backup"
CHECKDIA=$(find $HOME/Backup/ -mtime -7 -iname "backup_home_*.tar.gz")
#CHECKDIA=$(find $HOME -mtime -7 -iname "*.pdf")


if [ ! -d $PASTA ]; then
    echo "parte1"
    mkdir -p $HOME/Backup
fi

if [ -z $CHECKDIA ]; then
    echo "parte2"
    echo "Criando backup, aguarde.."
    tar --exclude="$HOME/Backup" -czvf $HOME/Backup/teste.tar.gz $HOME
    echo "Backup concluído!"
else
    echo "parte3"
    echo "Já existe um backup do diretório HOME nos últimos 7 dias"
    read -p "Deseja continuar: [N/S]" OPCAO
    case $OPCAO in
        n)
            echo "parte4"
            exit 1
        ;;    
        N)
            echo "parte5"
            exit 1 
        ;;
        s)
            echo "parte6"
            echo "Criando o backup, aguarde.."
            tar --exclude="$HOME/Backup" -czvf $HOME/Backup/teste.tar.gz $HOME
            echo "Backup concluído"
        ;;
        *)
            echo "Opção invalida"
            exit 1
    esac     
fi    

find -iname "backup_home_$DATAHORA.tar.gz"