#!/bin/bash

clear

#DECLARAÇÃO DE VARIAVEIS

DATAHORA=$(date +%Y%m%d%H%M)
PASTA="$HOME/Backup"
CHECKDIA=$(find $HOME/Backup/ -mtime -7 -iname "backup_home_*.tar.gz")

#VERIFICANDO SE O DIRETORIO BACKUP EXISTE, CASO NÃO SERÁ CRIADO
if [ ! -d $PASTA ]; then
    echo "Criando diretório de backup.."
	sleep 1
    mkdir -p $HOME/Backup
fi

#VERIFICA SE JÁ EXISTEM BACKUPS NOS ÚLTIMOS 7 DIAS, CASO EXISTE SERÁ INFORMADO SE QUER PROSSEGUIR COM O BACKUP
if [ -z $CHECKDIA ]; then
    echo "Criando backup, aguarde.."
	sleep 3
    tar --exclude="$HOME/Backup" -czvf $HOME/Backup/backup_home_$DATAHORA.tar.gz $HOME
    echo "Backup concluído!"
	sleep 1
	find $HOME/Backup -iname "backup_home_$DATAHORA.tar.gz"
	echo "Backup criado em: "
	exit 0
else		
    echo "Já existe um backup do diretório HOME nos últimos 7 dias"
    read -p "Deseja continuar: [N/S]" OPCAO
    case $OPCAO in
        n)
            echo "Backup cancelado!"
			sleep 3
            exit 1
        ;;    
        N)
            echo "Backup cancelado!"
			sleep 3
			exit 1 
        ;;
        s)
            echo "Criando o backup, aguarde.."
			sleep 3
            tar --exclude="$HOME/Backup" -czvf $HOME/Backup/backup_home_$DATAHORA.tar.gz $HOME
            echo "Backup concluído"
			sleep 1
			echo "Backup criado em: "
			find $HOME/Backup -iname "backup_home_$DATAHORA.tar.gz"
			exit 0
        ;;
        *)
            echo "Opção invalida"
            exit 1
    esac     
fi    
