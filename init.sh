
clear 

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
    echo [2] Clonar repositorios
    echo [3] Criar links simbolicos do v3
    echo [4] Configurar v3
    echo [5] Remover node module V3
    echo [6] Certificados HTTPS
    echo [7] Ajustar Json de pgv3-cli config V3
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
                ./core/manager_cloner_ropositories.sh
            ;;
            3) 
                ./core/links-simbolicos-v3.sh 
            ;;
            4) 
                ./core/setting_project_v3.sh 
            ;;
            5) 
                ./core/remove_node_modules_v3.sh 
            ;;
            6) 
                ./core/certificados.sh
            ;;
            7) 
                ./core/config_data_pgv3_cli_config.sh
            ;;
          
        esac
        clear

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
    echo [1] Clonar repositorios
    echo [2] Criar links simbolicos do v3
    echo [3] Certificados HTTPS
    echo [q] Sair
    echo
    read -p "Digite sua opção: " op;

    echo

    while [ $op != q ]; do
        case "$op" in
            1) 
                ./core/manager_cloner_ropositories.sh
            ;;
            2) 
                ./core/links-simbolicos-v3.sh 
            ;;
            3) 
                ./core/certificados.sh
            ;;
        esac
        clear
        mac
    done
}

manager_so() {
    case "$OSTYPE" in
        "linux-gnu"* ) 
            linux;
        ;;
        "darwin"* ) 
            mac;
        ;;
    esac
}


init() {
    if test -n "$BASH_VERSION"; then
        apply_permission_executable;
        manager_so;

    else
        MSG_ALERT="Vc terá que trocar para o shell bash"

        echo
        echo
        echo -e "\033[1;40;42m${MSG_ALERT}\033[0m"
        echo "==================================================="

        echo "execute comando:"
        echo -e "\033[1;40;42m bash \033[0m"
        echo
        echo "e rode o script novamente"
        echo

        echo
        echo
        
        exit;
    fi
}

init