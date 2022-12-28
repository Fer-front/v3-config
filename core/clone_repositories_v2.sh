# Iniciando processo de clone dos repositorios necessarios para o v2

NEW_PWD=""

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

echo
msg="Você deve estar conectado na VPN, caso contrario não sera feito clone do repositorios!"
echo -e "\e[1;40;42m${msg}\e[0m"

cd ${HOME}/uol_git/

read -p "Nome do usuario: " userName
read -p "Senha: " password

pwd $password;

git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/app.servicos.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/jsuol.com-barra.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/tab.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/carros.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/tilt.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/nossa.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/noticias.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/universa.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/economia.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/vestibular.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/educacao.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/projeto-grafico-v2.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/placar.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/viagem.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/eleicoes.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/play-conteudo.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/vivabem.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/esporte.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/~gpaes/git-deploy.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/robocopier.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/splash.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/www3.uol.com.br.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/jsuol.com-b.git
git clone https://${userName}:${NEW_PWD}@stash.uol.intranet/scm/dcweb/start.uol.com.br.git