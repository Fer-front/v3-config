# Iniciando processo de clone dos repositorios necessarios para o v2
PATH_REPO="${HOME}/uol_git/"
TYPE=""

create_root_repository() {
    cd ~;
    cd ${PATH_REPO} || mkdir -p ${PATH_REPO}

    cd ${PATH_REPO}
}

setCloneType() {

    echo "Escolha uma formas de clone HTTP ou SSH"
    echo "================================================="
    echo
    echo "  [ 1 ] HTTP"
    echo "  [ 2 ] SSH"
    echo 
    read -p "Opção: " op;
    
    case "$op" in
        "1")

            read -p "Nome do usuario: " USER;
            
            echo "Senha: "
            read -s PASSWORD;

            PASSWORD=$(./core/password.sh $PASSWORD)

            TYPE="git clone https://${USER}:${PASSWORD}@stash.uol.intranet/scm"
        ;;
        "2")
            TYPE="git clone ssh://git@stash.uol.intranet:7999"
        ;;
    esac
}

setCloneType;
create_root_repository;

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