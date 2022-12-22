DIR_TCL=${HOME}/templatecache-local/template/;
MSG_ALERT="É obrigatorio estar conectado na VPN !";

if [ -d $DIR_TCL ]; then
    echo Vc já possui templatecache instalado!
    exit
fi


echo 
echo -e "\e[1;40;42m${MSG_ALERT}\e[0m"
echo
read -p "pressione qual quer tecla para continuar"

wget -O ${HOME}/tcl-installer.jar http://templatecache.qa.intranet/templatecache-local/tcl-installer.jar | \
echo "ERRO: POSSIVELMENTE VC NÃO ESTAR CONECTADO NA VPN!";

cd ~ && java -jar ./tcl-installer.jar && sudo rm -rf ./tcl-installer.jar;

echo