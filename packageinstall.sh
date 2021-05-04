#!/bin/bash
clear
while true; do
    echo "===============================================
        Digite o pacote a ser instalado:
                    1 - NodeJs
                    2 - Virtual Box
                    3 - abiword
                    4 - sublime-text
                    5 - navegador opera
                    6 - Visual Studio Code
================================================"
        echo -n "Escolha uma opção e aguarde a instalação: "

        read opcao

        #verificar se foi digitada uma opção

        if [ -z $opcao ]; then
               echo "ERRO: Digite uma opção"
               exit
        fi


        case $opcao in
                1)
                        curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
                        sudo apt-get install -y nodejs;;
                2)
                        sudo apt-get install virtualbox;;
                3)
                        sudo apt install abiword;;
                4)
                        wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
                        sudo apt-get install apt-transport-https
                        echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
                        sudo apt-get update
                        sudo apt-get install sublime-text;;
                5)
                       sudo apt-get update
                       sudo apt-get install opera-stable;; 
                6)
                       wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
                       sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
                       sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
                       rm -f packages.microsoft.gpg
                       sudo apt install apt-transport-https
                       sudo apt update
                       sudo apt install code;;
                0)
                        echo "saindo..."
                        exit;;
                *)
                        echo 
                        echo "ERRO: Opção invalida"
                        echo ;;
        esac
        done
