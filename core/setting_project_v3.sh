clear

./core/remove_node_modules_v3.sh;


cd ${HOME}/uol_git/pgv3-cli/;
# setando repositorio privado do uol
npm config set @uol:registry http://verdaccio.cms.intranet/

npm i;
sudo npm i -g;

msg_config_pgv3=" ====== Atenção passos para configuração do pgv3-cli ====";
echo
echo
echo
echo
echo -e "\033[1;40;42m${msg_config_pgv3}\033[0m"
echo 
echo Apos enter sera exibida uma url acesse url, uma pagina sera aberta 
echo vc tera que passar seu nome e nome de usuario uol
echo abaixo sera solicitado o path dos repositorios PROJETO-GRAFICO-V3 E templatecache

echo Para projeto-grafico-v3 cole o valor abaixo:
echo "${HOME}/uol_git/projeto-grafico-v3"
echo 

echo Para templatecache cole valor abaixo:
echo "${HOME}/templatecache-local/templates"
echo 

read -p "[Enter] para continuar"

pgv3-cli config;
