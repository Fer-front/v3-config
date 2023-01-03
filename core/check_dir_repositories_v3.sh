DIR_V3=(${HOME}/uol_git/ ${HOME}/uol_git/commons.uol.com.br-monaco/ ${HOME}/uol_git/commons.uol.com.br-static/ ${HOME}/uol_git/commons.uol.com.br-projects/  ${HOME}/uol_git/commons.uol.com.br-sistemas/  ${HOME}/uol_git/projeto-grafico-v3/ ${HOME}/uol_git/jsuol.com-c/ ${HOME}/uol_git/pgv3-cli/);
NO_DIR=();

check_dir_for_v3() {
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
        echo -e "\033[1;40;42m ${HOME}/uol_git/ \033[0m"
        echo        
    fi
}

check_dir_for_v3;

read -p "Pressional qualquer tecla para continuar!" ;