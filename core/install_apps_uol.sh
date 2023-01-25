APPS=(git curl wget snap node npm n java svn teams code "sublime-text" chrome spotify terminator "chromium-browser" wps lunatask marktext webstorm flameshot zsh)
INSTALLED=()
UNINSTALL=()
INSTALING=()


clear 

# FUNCS COMMONS
# ==================================================================

notifyInstalation() {
    echo
    echo
    echo
    echo 
    echo instalando $1
    echo ================================================
    echo

    sleep 1
}

check_instalation_app() {
    for app in "${APPS[@]}"; do
        if [ $(which $app) ]; then
            INSTALLED+=($app)
        else
            UNINSTALL+=($app)
        fi
    done
}

print_status_instalation_app() {
    echo APPS JÁ INSTALADOS EM SUA MAQUINA:
    echo =============================================

    for appi in "${INSTALLED[@]}"; do
        echo "  [ok] ${appi}"
    done
    echo
    echo

    echo APPS QUE SERÃO INSTALADOS:
    echo =============================================

    for appu in "${UNINSTALL[@]}"; do
        echo "  [ ] ${appu}"
    done

    echo
    echo
}

# FUNCS DE INSTALACAO DOS APPS
# ==================================================================

install_svn() {
    # svn
    # ==========================================================
    sudo apt -y install subversion
    sudo apt update
}

install_wget() {
    notifyInstalation "wget"
    sudo apt -y install wget
}

install_curl() {
    notifyInstalation "curl"
    sudo apt install curl
}

install_git() {
    notifyInstalation "git"
    sudo apt install git
}

install_snap() {
    notifyInstalation "snap"
    sudo apt install snapd &&
        sudo snap install core
}

install_teams() {
    notifyInstalation "TEAMS"

    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - &&
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list' &&
        sudo apt update
    sudo apt install teams
}

install_code() {
    notifyInstalation "VS-CODE"
    sudo apt install code
}

install_chromium() {
    notifyInstalation "CHROMIUM"
    sudo apt install chromium-browser
}

install_spotify() {
    notifyInstalation "SPOTIFY"

    curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - &&
        echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list &&
        sudo apt update &&
        sudo apt install spotify-client
}

install_zsh() {
    msg_config="========= Configuracao do zsh ========"

    notifyInstalation "zsh e plugins"
    sudo apt install zsh &&
        sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&

        # instalar os plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # sudo usermod --shell $(which zsh) $USER

    # trocar o arquivo zshrc

    echo
    echo
    echo
    echo -e "\033[1;40;42m ${msg_config}/UOL/teste/ \033[0m"
    echo 
    echo Para ativar os plugins no shell zsh na linha onde possui plugins adicione o seguinte: 
    echo 
    echo zsh-syntax-highlighting zsh-autosuggestions
    echo
    echo "ex: plugins=(git zsh-syntax-highlighting zsh-autosuggestions)"

    read -p "Vc deseja editar o arquivo zshrc? [s|n]" edit;
    echo 

    if [ $edit = "s" ]; then
        sudo gedit ${HOME}/.zshrc
    fi
}

install_terminator() {
    notifyInstalation "TERMINATOR"
    sudo apt -y install terminator
}

install_svn() {
    notifyInstalation "SVN"
    sudo apt -y install subversion
}

install_node() {
    notifyInstalation "NODE, N CONFIG VERSION COMPATIVEL PROJETO GRAFICO"
    sudo snap install node --classic --channel=14 &&
        sudo npm install -g n &&
        sudo n 14.15.4 &&
        sudo n
}

install_java() {
    notifyInstalation "JAVA"
    tar -vzxf jre-8u351-linux-x64.tar.gz;
     sudo apt install default-jre;
     javac --version;
}

install_wps() {
    notifyInstalation "WPS OFFICE"
    wget -O ./wps.deb https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11664/wps-office_11.1.0.11664.XA_amd64.deb --show-progress && \
    sudo dpkg -i ./wps.deb
    sudo rm -rf ./wps.deb
}

install_flameshot() {
    sudo snap install flameshot
}

install_chrome() {
    notifyInstalation "Google chrome"
    wget -O ./chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --show-progress
    sudo dpkg -i ./chrome.deb
    sudo rm -rf ./chrome.deb
}

install_sublime-text() {
    notifyInstalation "Sublime text"
    sudo snap install sublime-text --classic
}

install_lunatask() {
    notifyInstalation "Lunatask gerenciador de tarefas e notepad"
    sudo snap install lunatask
}

install_marktext() {
    notifyInstalation "Marktext editor de markdowm"
    snap install marktext
}

install_webstorm() {
    sudo snap install webstorm --classic
}


# FUNCS INTERACAO CO CLI
# ==================================================================

select_app_to_install() {
    for app in "${UNINSTALL[@]}"; do
        read -p "Deseja instalar [ ${app} ] ? [s|n] : " option

        if [ $option = "s" ]; then
            INSTALING+=($app)
        fi
    done
}

exec_installs() {
    echo

    read -p "Deseja instalar algun desses app? [s|n] : " option
    echo
    echo

    if [ $option = "s" ]; then
        select_app_to_install

        for appu in "${INSTALING[@]}"; do
            install_$appu
        done
    else
        exit
    fi
}

init() {
    check_instalation_app
    print_status_instalation_app

    sleep 1
    exec_installs
}

init
