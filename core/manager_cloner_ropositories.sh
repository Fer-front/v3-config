clear

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
    ./core/clone_repositories_v3.sh;
    ;;
"2")
    ./core/clone_repositories_v2.sh;
    ;;
"3")
    ./core/clone_repositories_roswell.sh;
    ;;
"q")
    exit;
    ;;
esac
