

apply_permission_executable() {
    chmod +x ./core/*.sh
}

                    # LINUX
# =======================================================

linux() {
    sleep 1;
    echo
    echo
    echo Escolha uma das opções abaixo;
    echo ==========================================
    echo [1] Instalar apps
    echo [2] Clonar repositorios do V3
    echo [3] Checar seus repositorios V3
    echo [4] Criar links simbolicos do v3
    echo [5] Configurar v3
    echo [6] Clonar repositorios do V2
    echo [7] Remover node module V3
    echo [8] Certificados HTTPS V3
    echo [9] Ajustar Json de pgv3-cli config V3
    echo [q] Sair
    echo
    read -p "Digite sua opção: " op;

    echo

    while [ $op != q ]; do
        case "$op" in
            1) 
                ./core/install_apps_uol.sh
            ;;
            2) 
                ./core/clone_repositories_v3.sh
            ;;
            3) 
                ./core/check_dir_repositories_v3.sh 
            ;;
            4) 
                ./core/links-simbolicos-v3.sh 
            ;;
            5) 
                ./core/setting_project_v3.sh 
            ;;
            6) 
                ./core/clone_repositories_v2.sh 
            ;;
            7) 
                ./core/remove_node_modules_v3.sh 
            ;;
            8) 
                ./core/certificados.sh
            ;;
            9) 
                ./core/config_data_pgv3_cli_config.sh
            ;;
        esac

        linux
    done
}
                    # MAC-OS
# =======================================================

mac() {
    sleep 1;
    echo
    echo
    echo Escolha uma das opções abaixo;
    echo ==========================================
    echo [1] Clonar repositorios do V3
    echo [2] Checar seus repositorios V3
    echo [3] Criar links simbolicos do v3
    echo [4] Clonar repositorios do V2
    echo [5] Certificados HTTPS V3
    echo [q] Sair
    echo
    read -p "Digite sua opção: " op;

    echo

    while [ $op != q ]; do
        case "$op" in
            1) 
                ./core/clone_repositories_v3.sh
            ;;
            2) 
                ./core/check_dir_repositories_v3.sh 
            ;;
            3) 
                ./core/links-simbolicos-v3.sh 
            ;;
            4) 
                ./core/clone_repositories_v2.sh 
            ;;
            5) 
                ./core/certificados.sh
            ;;
        esac

        mac
    done
}

manager_so() {
    echo
    echo "       Qual sistema operacional?"
    echo "=========================================="
    echo 
    echo "  [1] linux"
    echo "  [2] mac"
    echo "  [q] exit"
    echo

    read -p "Escolha entre as opções 1 e 2 : " os

    case "$os" in
        "1") 
            linux;
        ;;
        "2") 
            mac;
        ;;
    esac
}


init() {
    apply_permission_executable;

    echo
    echo "       Qual shell vc está utilizando?"
    echo "=========================================="
    echo 
    echo "  [1] bash"
    echo "  [2] zsh"
    echo "  [q] exit"
    echo

    read -p "Escolha entre as opções 1 e 2 : " _shell

    case "$_shell" in
        1) 
            manager_so;
        ;;
        2) 
            MSG_ALERT="Vc terá que trocar para o shell bash"

            echo
            echo
            echo -e "\e[1;40;42m${MSG_ALERT}\e[0m"
            echo "==================================================="

            echo "execute comando:"
            echo -e "\e[1;40;42m bash \e[0m"
            echo
            echo "e rode o script novamente"
            echo

            read -p "[ENTER] para continuar"

            echo
            echo
            
            exit;
        ;;
    esac
}

init