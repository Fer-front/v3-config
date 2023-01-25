
clear 

cd ~

echo Etapas para editar os arquivos config.json do pgv3-cli config:
echo são dois arquivos um no root e outro na home
echo 
echo O primeiro da [home] sera aberto automaticamente para vc editar
echo 
echo Ja o do root vc tera que rodar o seguinte comandos abaixo no terminal
echo vai pedir sua senha de login 
echo 
echo ========================================
echo OBS: deve ser rodado uma linha por vez
echo ========================================
echo "cd ~ && sudo su"
echo "gedit /root/.pgv3-cli/config.json"
echo 
echo

read -p "[Enter] Para abrir aquivo da [HOME]" 

sudo gedit ~/.pgv3-cli/config.json

