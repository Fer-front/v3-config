transform_executable() {
    chmod +x ./core/*.sh
}

msg_options() {
    sleep 1;

    echo Escolha uma das opções abaixo;
    echo ==========================================
    echo [1] Instalar apps
    echo [2] Clonar repositorios do V3
    echo [3] Checar seus repositorios V3
    echo [4] Criar links simbolidos do v3
    echo [5] Configurar v3
    echo [6] Clonar repositorios do V2
    echo [q] Sair
    echo
    read -p "Digite sua opção: " op;

    echo
}

transform_executable;
msg_options;

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
    esac

    msg_options
done
