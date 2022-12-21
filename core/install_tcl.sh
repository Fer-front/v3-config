DIR_TCL=~/templatecache-local/template/;
MSG_ALERT="É obrigatorio estar conectado na VPN !";

if [ -d $DIR_TCL ]; then
    echo Vc já possui templatecache instalado!
    exit
fi


echo 
echo -e "\e[1;40;42m${MSG_ALERT}\e[0m"
echo
read -p "pressione qual quer tecla para continuar"

wget -O ~/tcl-installer.jar http://templatecache.qa.intranet/templatecache-local/tcl-installer.jar |
echo \n ERRO: POSSIVELMENTE VC NÃO ESTAR CONECTADO NA VPN! && sleep: 3 && exit

cd ~ && java -jar ./tcl-installer.jar;

echo