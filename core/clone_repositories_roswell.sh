# Iniciando processo de clone dos repositorios necessarios para o v2
PATH_REPO="${HOME}/uol_git/"
PASSWORD=""
TYPE=""

create_root_repository() {
    cd ~;
    cd ${PATH_REPO} || mkdir -p ${PATH_REPO}

    cd ${PATH_REPO}
}

read -p "Nome do usuario: " USER;

echo "Senha: "
read -s  PASSWORD;

PASSWORD=$(./core/password.sh $PASSWORD)

TYPE="git clone https://${USER}:${PASSWORD}@stash.uol.intranet/scm"

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