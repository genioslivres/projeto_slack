#! /bin/bash

dialog --msgbox 'Este script vai converter seu(s) arquivo(s) .RPM e transformalos em .TXZ , depois realizara a instalação' 50 50
dialog --msgbox 'Digite 1 para instalar o arquivo localmente ( o arquivo rpm deve estar na mesma pasta do Script) , ou 2 para colar o link de download do arquivo' 50 50
read NUM
read LINK
read USUARIO

case $NUM in
	1) rpm2txz *.rpm && upgradepkg --install-new *.t?z && rm *.rpm ;;
	2) cd /home/$USUARIO/Downloads && wget -c $LINK && rpm2txz *.rpm && upgradepkg --install-new *.t?z && rm *.rpm ;
	*) dialog --msgbox 'Esta opção não é valida , tente novamente' 50 50 "!" ;;
esac
dialog --msgbox 'A instalação do aquivo foi realizada com exito , agora abra o terminal e digite o nome do arquivo para verifivar a falta de dependências , caso esteja tudo ok o programa irá abrir normalmente !' 50 50
