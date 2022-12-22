MSG_ALERT="Este script so funcionara com shell bash"

echo -e "\e[1;40;42m${MSG_ALERT}\e[0m"
echo ===================================================

echo caso vc esteja utilizando zsh 
echo execute comando:
echo -e "\e[1;40;42m bash \e[0m"
echo
echo e rode o script novamente
echo
read -p "Pressione qualquer tecla para continuar"

echo
echo

apply_permission_executable() {
    chmod +x ./core/*.sh
}

msg_options() {
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
}

apply_permission_executable;
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

    msg_options
done