# Iniciando processo de clone dos repositorios necessarios para o v2
VPN_DISCLAMER="Você deve estar conectado na VPN, caso contrario não sera feito clone do repositorios!"
PATH_REPO="${HOME}/uol_git_TESTE/"
NEW_PWD=""
TYPE=""

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

create_root_repository() {
    cd ~;
    cd ${PATH_REPO} || mkdir -p ${PATH_REPO}

    cd ${PATH_REPO}
}

cloneType() {

    echo "Escolha uma formas de clone HTTP ou SSH"
    echo "================================================="
    echo
    echo "  [ 1 ] HTTP"
    echo "  [ 2 ] SSH"
    echo 
    read -p "Opção: " op;
    
    case "$op" in
        "1")
            read -p "Nome do usuario: " userName;
            read -p "Senha: " password;

            pwd $password;

            TYPE="git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm"
        ;;
        "2")
            TYPE="git clone ssh://git@stash.uol.intranet:7999"
        ;;
    esac
}

echo
echo -e "\e[1;40;42m${VPN_DISCLAMER}\e[0m"

create_root_repository;

cloneType;

${TYPE}/dcweb/app.servicos.uol.com.br.git
${TYPE}/dcweb/jsuol.com-barra.git
${TYPE}/dcweb/tab.uol.com.br.git
${TYPE}/dcweb/carros.uol.com.br.git
${TYPE}/dcweb/tilt.uol.com.br.git
${TYPE}/dcweb/nossa.uol.com.br.git
${TYPE}/dcweb/noticias.uol.com.br.git
${TYPE}/dcweb/universa.uol.com.br.git
${TYPE}/dcweb/economia.uol.com.br.git
${TYPE}/dcweb/vestibular.uol.com.br.git
${TYPE}/dcweb/educacao.uol.com.br.git
${TYPE}/dcweb/projeto-grafico-v2.git
${TYPE}/dcweb/placar.uol.com.br.git
${TYPE}/dcweb/viagem.uol.com.br.git
${TYPE}/dcweb/eleicoes.uol.com.br.git
${TYPE}/dcweb/play-conteudo.uol.com.br.git
${TYPE}/dcweb/vivabem.uol.com.br.git
${TYPE}/dcweb/esporte.uol.com.br.git
${TYPE}/~gpaes/git-deploy.git
${TYPE}/dcweb/robocopier.git
${TYPE}/dcweb/splash.uol.com.br.git
${TYPE}/dcweb/www3.uol.com.br.git
${TYPE}/dcweb/jsuol.com-b.git
${TYPE}/dcweb/start.uol.com.br.git