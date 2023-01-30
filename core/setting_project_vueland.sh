HAS_NODE=$(which node)
HAS_N=$(which n)
VERSION_NODE_PROJECT='16.15.0'
PATH_DIR="${HOME}/uol_git/"
NEW_PWD=""


show_commands() {
    # Exibicao de comando basicos
    echo            Comando básicos
    echo --------------------------------------
    echo 
    echo   vueland-cli build              - Buildar projeto
    echo   vueland-cli documentation      - Abrir storybook 
    echo 
}

install_node() {
    if test ! -n $HAS_NODE; then
        sudo apt install nodejs -y
    fi
}

install_n() {
    if test ! -n $HAS_N; then
        sudo npm install -g n
    fi
}

set_version_node() {
    if test ! -n $(n which ${VERSION_NODE_PROJECT}); then
        echo 
        echo 'Intalando versão do node compativel com projeto vueland'
        echo '======================================================='
        echo 
        sudo n $VERSION_NODE_PROJECT &&
        sudo n

    else 
        echo 
        echo 'Selecione versão 16.15.0 na proxima etapa.'
        echo 

        sleep 3
        sudo n;
    fi
}

create_root_repository() {
    cd ~;
    cd ${PATH_DIR} || mkdir -p ${PATH_DIR}

    cd ${PATH_DIR}
}

_pwd() {
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

install_vueland_cli() {
    clear
    echo '          Install e config vueland-cli             '
    echo '==================================================='
    echo

    cd ${PATH_DIR}

    read -p "Nome do usuario: " userName;
    read -p "Senha: " password;

    _pwd $password;

    # clonar repositorio vueland-cli
    git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/~fjsilva/vueland-cli.git;

    # configurar o repositorio do verdaccio
    npm config set @vueland:registry http://verdaccio.cms.intranet/
    npm config set @nodeland:registry http://verdaccio.cms.intranet/
    npm config set @uol:registry http://verdaccio.cms.intranet/
    
    # instalando cli
    cd ./vueland-cli

    npm i
    sudo npm i -g
    
    # configurando npm e diretorio em so linux
    if [[ $OSTYPE == "linux-gnu"* ]]; then
        npm set prefix "/usr/local"
        sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
    fi

}

install_solar_ds() {
    clear

    echo '          Install e config solar-sd                '
    echo '==================================================='
    echo

    cd ${PATH_DIR}

    if [[ ! -d ${HOME}/uol_git/jupiter/ ]]; then
        mkdir 'jupiter'        
    fi

    cd ./jupiter


    read -p "Nome do usuario: " userName;
    read -p "Senha: " password;

    _pwd $password;

    # clonar repositorio solar-ds
    git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/vuel/solar-ds.git;

    # instalando dependecias
    cd ./solar-ds

    npm install;

    # configurando projeto isso ficara manual
    vueland-cli config;

    show_commands;
}

init() {
    create_root_repository

    install_node;
    install_n;

    set_version_node;

    install_vueland_cli;
    install_solar_ds;
}


init;