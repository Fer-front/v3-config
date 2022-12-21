DIR_V3=(${HOME}/UOL/ ${HOME}/UOL/git/ ${HOME}/UOL/git/commons.uol.com.br-monaco/ ${HOME}/UOL/git/commons.uol.com.br-static/ ${HOME}/UOL/git/commons.uol.com.br-projects/  ${HOME}/UOL/git/commons.uol.com.br-sistemas/ ${HOME}/UOL/git/projeto-grafico-v3/ ${HOME}/UOL/git/jsuol.com-c/ ${HOME}/UOL/git/pgv3-cli/);
NO_DIR=();

creat_root_repository() {
    cd ~;
    cd ${HOME}/UOL/git/ || mkdir -p ${HOME}/UOL/git/

    cd ${HOME}/UOL/git/
}

clone() {
    case "$1" in
        ${HOME}/UOL/git/commons.uol.com.br-monaco/)
            git clone https://${userName}:${password}@stash.uol.intranet/scm/dcweb/commons.uol.com.br-monaco.git
        ;;

        ${HOME}/UOL/git/commons.uol.com.br-sistemas/)
            git clone https://${userName}:${password}@stash.uol.intranet/scm/dcweb/commons.uol.com.br-sistemas.git
        ;;

        ${HOME}/UOL/git/commons.uol.com.br-static/)
            git clone https://${userName}:${password}@stash.uol.intranet/scm/dcweb/commons.uol.com.br-static.git
        ;;

        ${HOME}/UOL/git/commons.uol.com.br-projects/)
            git clone https://${userName}:${password}@stash.uol.intranet/scm/dcweb/commons.uol.com.br-projects.git
        ;;

        ${HOME}/UOL/git/jsuol.com-c/)
            git clone https://${userName}:${password}@stash.uol.intranet/scm/dcweb/jsuol.com-c.git
        ;;

        ${HOME}/UOL/git/projeto-grafico-v3/)
            git clone https://${userName}:${password}@stash.uol.intranet/scm/dcweb/projeto-grafico-v3.git
        ;;

        ${HOME}/UOL/git/pgv3-cli/)
            git clone https://${userName}:${password}@stash.uol.intranet/scm/~fjsilva/pgv3-cli.git
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
        echo -e "\e[1;40;42m ${HOME}/UOL/git/ \e[0m"
        echo

        echo Iremos realizar o clone novamente após isso faça a verificação novamente.
        echo Caso não resolva clone manualmente os repo no path acima. 
        

        # Iniciando processo de clone dos repositorios necessarios para o v3
        echo 
        msg="Você deve estar conectado na VPN, caso contrario não sera feito clone do repositorios!"
        echo -e "\e[1;40;42m${msg}\e[0m"

        read -p "Nome do usuario: " userName
        read -s -p "Senha: " password

        for repos in "${NO_DIR[@]}"; do
            clone $repos;
        done
    fi

}


init