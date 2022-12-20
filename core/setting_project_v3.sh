MSG_ALERT="em desenvolvimento!";

# echo 
# echo -e "\e[1;40;42m${MSG_ALERT}\e[0m"

# printar o passo a passo 
# abrir pasta dos certificados
# abrir navagador primario

# ir repositorios V3
# dar pgv3-cli 
# npm install 
# sudo npm install -g

# git clone https://stash.uol.intranet/scm/~fjsilva/pgv3-cli.git

cd /home/febarros/UOL/git/pgv3-cli && \


pwd && \

npm config set @uol:registry http://verdaccio.cms.intranet/;
npm install;
sudo npm install -g;

sleep 2;

pgv3-cli config;
sudo pgv3-cli config;



# abrir url no terminal
# passar nome e login

# abrir arquivo com informacao de cola link do repositorio projeto grafico e do template-cache

# /home/febarros/UOL/git/projeto-grafico-v3
# /home/febarros/templatecache-local/templates

