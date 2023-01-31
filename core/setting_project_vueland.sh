HAS_NODE=$(which node)
HAS_N=$(which n)
VERSION_NODE_PROJECT='16.15.0'
PATH_DIR="${HOME}/uol_git/"

show_commands() {
    # Exibicao de comando basicos
    echo Comando básicos
    echo --------------------------------------
    echo
    echo vueland-cli build - Buildar projeto
    echo vueland-cli documentation - Abrir storybook
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
        sudo n
    fi
}

create_root_repository() {
    cd ~
    cd ${PATH_DIR} || mkdir -p ${PATH_DIR}

    cd ${PATH_DIR}
}

install_vueland_cli() {

    # clonar repositorio vueland-cli
    git clone https://${USER}:${PASSWORD}@stash.uol.intranet/scm/~fjsilva/vueland-cli.git

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

    # clonar repositorio solar-ds
    git clone https://${USER}:${PASSWORD}@stash.uol.intranet/scm/vuel/solar-ds.git

    # instalando dependecias
    cd ./solar-ds

    npm install

    # configurando projeto isso ficara manual
    vueland-cli config

    show_commands
}

init() {

    echo Digite se usuario e senha do stash:
    echo ============================================
    echo

    read -p "Nome do usuario: " USER
    read -p "Senha: " PASSWORD

    PASSWORD=$(./core/password.sh $PASSWORD)

    create_root_repository

    install_node
    install_n

    set_version_node

    install_vueland_cli
    install_solar_ds
}

init
