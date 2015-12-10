#! /bin/bash

dialog --msgbox 'Este script vai converter seu(s) arquivo(s) .RPM e transformalos em .TXZ , depois realizara a instalação' 50 50
dialog --msgbox 'Digite 1 para instalar o arquivo localmente ( o arquivo rpm deve estar na mesma pasta do Script) , ou 2 para colar o link de download do arquivo' 50 50
read NUM

if [ '$NUM' = 1 ]; then
	rpm2txz *.rpm && upgradepkg --install-new *.t?z && rm *.rpm;
elif [ '$NUM' = 2 ]; then
	dialog --msgbox 'Digite seu nome de usuario !' 30 30 && read USUARIO && cd /home/$USUARIO/Downloads && dialog --msgbox 'Cole o link do arquivo rpm aqui !' 30 30 && read LINK && wget -c $LINK && rpm2txz *.rpm && upgradepkg --install-new *.t?z && rm *.rpm;
else
	dialog --msgbox 'Opção invalida!' 30 30;
fi
dialog --msgbox 'A instalação do aquivo foi realizada com exito , agora abra o terminal e digite o nome do arquivo para verifivar a falta de dependências , caso esteja tudo ok o programa irá abrir normalmente !' 50 50
