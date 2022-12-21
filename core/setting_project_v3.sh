cd ${HOME}/UOL/git/pgv3-cli/;

# setando repositorio privado do uol
npm config set @uol:registry http://verdaccio.cms.intranet/;


# remocao de node_module de projeto grafico v3/
./remove_node_modules_v3;

npm i;
sudo npm i -g;

sleep 2;


msg_config_pgv3=" ====== Atencao passos para configuracao do pgv3-cli ===="
echo
echo
echo
echo
echo -e "\e[1;40;42m${msg_config_pgv3}\e[0m"
echo 
echo Apos enter sera exibida uma url acesse url, uma pagina sera aberta 
echo vc tera que passar seu nome e nome de usuario uol
echo abaixo sera solicitado o path dos repositorios PROJETO-GRAFICO-V3 E templatecache

echo Para projeto-grafico-v3 cole o valor abaixo:
echo "${HOME}/UOL/git/projeto-grafico-v3"

echo Para templatecache cole valor abaixo:
echo "${HOME}/templatecache-local/templates"
echo 

read -p "[Enter] para continuar"

sudo pgv3-cli config;
