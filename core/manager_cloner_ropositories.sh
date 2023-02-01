clear
MSG="Você deve estar conectado na VPN, caso contrário não será feito clone dos repositórios!"

echo
echo -e "\033[1;40;42m${MSG}\033[0m"
echo 
echo

echo Escolha uma das opções
echo ===================================
echo
echo [1] Repositorios para rodar v3
echo [2] Repositorios para rodar v2
echo [3] Repositorios para rodar roswell
echo [q] Sair
echo

read -p "Opção: " op

case "$op" in
"1")
    ./core/clone_repositories_v3.sh
    ;;
"2")
    ./core/clone_repositories_v2.sh
    ;;
"3")
    ./core/clone_repositories_roswell.sh
    ;;
"q")
    exit
    ;;
esac
