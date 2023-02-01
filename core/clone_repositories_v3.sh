DIR_V3=(${PATH_REPO} ${PATH_REPO}commons.uol.com.br-monaco/ ${PATH_REPO}commons.uol.com.br-static/ ${PATH_REPO}commons.uol.com.br-projects/ ${PATH_REPO}commons.uol.com.br-sistemas/ ${PATH_REPO}projeto-grafico-v3/ ${PATH_REPO}jsuol.com-c/ ${PATH_REPO}pgv3-cli/)
PATH_REPO="${HOME}/uol_git/"
NO_DIR=()
TYPE=""

create_root_repository() {
    cd ~
    cd ${PATH_REPO} || mkdir -p ${PATH_REPO}

    cd ${PATH_REPO}
}

setCloneType() {

    echo "Escolha uma formas de clone HTTP ou SSH"
    echo "================================================="
    echo
    echo "  [ 1 ] HTTP"
    echo "  [ 2 ] SSH"
    echo
    read -p "Opção: " op

    case "$op" in
    "1")
        echo
        echo Digite se usuario e senha do stash:
        echo ============================================
        echo

        read -p "Nome do usuario: " USER

        echo "Senha: "
        read -s PASSWORD

        PASSWORD=$(./core/password.sh $PASSWORD)

        TYPE="git clone https://${USER}:${PASSWORD}@stash.uol.intranet/scm"
        ;;
    "2")
        TYPE="git clone ssh://git@stash.uol.intranet:7999"
        ;;

    esac
}

clone() {

    echo
    echo "Iniciando clone"
    echo

    case "$1" in
    commons.uol.com.br-monaco/)
        ${TYPE}/dcweb/commons.uol.com.br-monaco.git
        ;;

    commons.uol.com.br-sistemas/)
        ${TYPE}/dcweb/commons.uol.com.br-sistemas.git
        ;;

    commons.uol.com.br-static/)
        ${TYPE}/dcweb/commons.uol.com.br-static.git
        ;;

    commons.uol.com.br-projects/)
        ${TYPE}/dcweb/commons.uol.com.br-projects.git
        ;;

    jsuol.com-c/)
        ${TYPE}/dcweb/jsuol.com-c.git
        ;;

    projeto-grafico-v3/)
        ${TYPE}/dcweb/projeto-grafico-v3.git
        ;;

    pgv3-cli/)
        ${TYPE}/~fjsilva/pgv3-cli.git || git clone https://stash.uol.intranet/scm/~fjsilva/pgv3-cli.git
        ;;
    esac
}

init() {

    echo
    echo Diretorios para rodar v3:
    echo =====================================================
    for dir in "${DIR_V3[@]}"; do
        if [ -d $dir ]; then
            echo diretorio ok : $dir
        else
            NO_DIR+=($dir)
        fi
    done

    LEN_NO_DIR="${#NO_DIR[@]}"

    if [ $LEN_NO_DIR -eq "0" ]; then
        echo
        echo Seu diretorios para rodar o V3 estão completo!
        echo

    else
        echo
        echo Vc Tera que clonar os seguintes repositorios:
        echo =====================================================

        for repos in "${NO_DIR[@]}"; do
            echo $repos
        done

        echo
        echo path onde será feito o clone:
        echo =====================================================
        echo -e "\033[1;40;42m ${PATH_REPO} \033[0m"
        echo

        setCloneType
        create_root_repository

        for repos in "${NO_DIR[@]}"; do
            clone $repos
        done
    fi

}

init
