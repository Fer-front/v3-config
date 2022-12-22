DIR_V3=(${HOME}/uol_git/ ${HOME}/uol_git/commons.uol.com.br-monaco/ ${HOME}/uol_git/commons.uol.com.br-static/ ${HOME}/uol_git/commons.uol.com.br-projects/  ${HOME}/uol_git/commons.uol.com.br-sistemas/ ${HOME}/uol_git/projeto-grafico-v3/ ${HOME}/uol_git/jsuol.com-c/ ${HOME}/uol_git/pgv3-cli/);
NO_DIR=();
NEW_PWD=""

# TESTE="$(./core/pwd.sh 'oi')" 


# echo "SENHA => ${TESTE}"

# exit 

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

creat_root_repository() {
    cd ~;
    cd ${HOME}/uol_git/ || mkdir -p ${HOME}/uol_git/

    cd ${HOME}/uol_git/
}

clone() {
    case "$1" in
        ${HOME}/uol_git/commons.uol.com.br-monaco/)
            git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/commons.uol.com.br-monaco.git
        ;;

        ${HOME}/uol_git/commons.uol.com.br-sistemas/)
            git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/commons.uol.com.br-sistemas.git
        ;;

        ${HOME}/uol_git/commons.uol.com.br-static/)
            git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/commons.uol.com.br-static.git
        ;;

        ${HOME}/uol_git/commons.uol.com.br-projects/)
            git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/commons.uol.com.br-projects.git
        ;;

        ${HOME}/uol_git/jsuol.com-c/)
            git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/jsuol.com-c.git
        ;;

        ${HOME}/uol_git/projeto-grafico-v3/)
            git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/projeto-grafico-v3.git
        ;;

        ${HOME}/uol_git/pgv3-cli/)
            git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/~fjsilva/pgv3-cli.git
        ;;
    esac
}

init() {
    creat_root_repository;

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
        echo path onde deve ser feito o clone:
        echo ===================================================== 
        echo -e "\e[1;40;42m ${HOME}/uol_git/ \e[0m"
        echo

        echo Iremos realizar o clone novamente após isso faça a verificação novamente.
        echo Caso não resolva clone manualmente os repo no path acima. 
        

        # Iniciando processo de clone dos repositorios necessarios para o v3
        echo 
        msg="Você deve estar conectado na VPN, caso contrario não sera feito clone do repositorios!"
        echo -e "\e[1;40;42m${msg}\e[0m"

        read -p "Nome do usuario: " userName;
        read -p "Senha: " password;

        pwd $password;

        for repos in "${NO_DIR[@]}"; do
            clone $repos;
        done
    fi

}


init