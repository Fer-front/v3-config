DIR_V3=(${PATH_REPO} ${PATH_REPO}commons.uol.com.br-monaco/ ${PATH_REPO}commons.uol.com.br-static/ ${PATH_REPO}commons.uol.com.br-projects/  ${PATH_REPO}commons.uol.com.br-sistemas/ ${PATH_REPO}projeto-grafico-v3/ ${PATH_REPO}jsuol.com-c/ ${PATH_REPO}pgv3-cli/);
PATH_REPO="${HOME}/uol_git/"
NO_DIR=();
NEW_PWD=""
TYPE=""

pwd() {
    utf8_to_asci() {
        case "$1" in
            "!")
                NEW_PWD+="%21"
            ;;
            "#")
                NEW_PWD+="%23"
            ;;
            "$")
                NEW_PWD+="%24"
            ;;
            "&")
                NEW_PWD+="%26"
            ;;
            "'")
                NEW_PWD+="%27"
            ;;
            "(")
                NEW_PWD+="%28"
            ;;
            ")")
                NEW_PWD+="%29"
            ;;
            "*")
                NEW_PWD+="%2A"
            ;;
            "+")
                NEW_PWD+="%2B"
            ;;
            ",")
                NEW_PWD+="%2C"
            ;;
            "/")
                NEW_PWD+="%2F"
            ;;
            ":")
                NEW_PWD+="%3A"
            ;;
            ";")
                NEW_PWD+="%3B"
            ;;
            "=")
                NEW_PWD+="%3D"
            ;;
            "?")
                NEW_PWD+="%3F"
            ;;
            "@")
                NEW_PWD+="%40"
            ;;
            "[")
                NEW_PWD+="%5B"
            ;;
            "]")
                NEW_PWD+="%5D"
            ;;
            *)
                NEW_PWD+="${1}"
            ;;
        esac
    }

    last=${#1}

    for ((i=0;i<$last;i++)) ; do 
        utf8_to_asci ${1:i:1};
    done
}

create_root_repository() {
    cd ~;
    cd ${PATH_REPO} || mkdir -p ${PATH_REPO}

    cd ${PATH_REPO}
}

cloneType() {

    echo "Escolha uma formas de clone HTTP ou SSH"
    echo "================================================="
    echo
    echo "  [ 1 ] HTTP"
    echo "  [ 2 ] SSH"
    echo 
    read -p "Opção: " op;
    
    case "$op" in
        "1")
            read -p "Nome do usuario: " userName;
            read -p "Senha: " password;

            pwd $password;

            TYPE="git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm"
        ;;
        "2")
            TYPE="git clone ssh://git@stash.uol.intranet:7999"
        ;;

    esac
}

clone() {
    case "$1" in
        ${PATH_REPO}commons.uol.com.br-monaco/)
            ${TYPE}/dcweb/commons.uol.com.br-monaco.git
        ;;

        ${PATH_REPO}commons.uol.com.br-sistemas/)
            ${TYPE}/dcweb/commons.uol.com.br-sistemas.git
        ;;

        ${PATH_REPO}commons.uol.com.br-static/)
            ${TYPE}/dcweb/commons.uol.com.br-static.git
        ;;

        ${PATH_REPO}commons.uol.com.br-projects/)
            ${TYPE}/dcweb/commons.uol.com.br-projects.git
        ;;

        ${PATH_REPO}jsuol.com-c/)
            ${TYPE}/dcweb/jsuol.com-c.git
        ;;

        ${PATH_REPO}projeto-grafico-v3/)
            ${TYPE}/dcweb/projeto-grafico-v3.git
        ;;

        ${PATH_REPO}pgv3-cli/)
            ${TYPE}/~fjsilva/pgv3-cli.git || git clone https://stash.uol.intranet/scm/~fjsilva/pgv3-cli.git
        ;;
    esac
}

init() {
    create_root_repository;

    echo
    echo Diretorios para rodar v3:
    echo =====================================================
     for dir in "${DIR_V3[@]}"; do
        if [ -d $dir ];
        then
            echo diretorio ok : $dir 
        else
            NO_DIR+=($dir)
        fi
    done

    LEN_NO_DIR="${#NO_DIR[@]}"

    if [ $LEN_NO_DIR -eq "0" ];
    then
        echo 
        echo Seu diretorios para rodar o V3 estão completo!
        echo
                
    else
        echo
        echo Vc Tera que clonar os seguintes repositorios:
        echo =====================================================
        
        for repos in "${NO_DIR[@]}"; do
            echo $repos;
        done

        echo
        echo path onde será feito o clone:
        echo ===================================================== 
        echo -e "\033[1;40;42m ${PATH_REPO} \033[0m"
        echo
        

        # Iniciando processo de clone dos repositorios necessarios para o v3
        echo
        msg="Você deve estar conectado na VPN, caso contrario não sera feito clone do repositorios!"
        echo -e "\033[1;40;42m${msg}\033[0m"

        cloneType

        echo 
        echo "Iniciando clone"
        echo 

        for repos in "${NO_DIR[@]}"; do
            clone $repos;
        done
    fi

}

init