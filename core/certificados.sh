clear

echo Tutorial compativel com navegador Chromme
echo ===========================================
echo 
echo Abra o navegador 
echo na barra de url cole a seguinte url:
echo
echo -e "\033[1;40;42m chrome://settings/certificates\033[0m"
echo 
echo ira aparecer pagina de gerenciamento de certificados https
echo sera possivel ver 4 abas 
echo 
echo acesse a aba autoridade 
echo click no btn import 

echo sera aberto uma pasta com os certificados a serem registrado
echo passe o caminho dela e registre os mesmos
echo 

read -p "[Enter] para abrir pasta com certificados"

nautilus ./certificados

 
