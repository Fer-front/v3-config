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

read -p "Nome do usuario: " userName;
read -p "Senha: " password;

pwd $password;

TYPE="git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm"

echo
echo -e "\033[1;40;42m${VPN_DISCLAMER}\033[0m"

create_root_repository;


# REPOSITORIOS BASE PARA APLICAÇOES DO ROSWELL
# ----------------------------------------------------------
${TYPE}/dcweb/app.servicos.uol.com.br.git
${TYPE}/ros/roswell-cli.git
${TYPE}/ros/roswell-api.git
${TYPE}/ros/roswell-core.git
${TYPE}/ros/roswell-cron.git
${TYPE}/ros/roswell-dashboard.git
${TYPE}/ros/roswell-monkey.git