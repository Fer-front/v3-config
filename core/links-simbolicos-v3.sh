function createDir() {
    folders=('jsuol.com.br' 'commons.uol.com.br')
    lengthFolders=${#folders[@]}

    for ((i = 0; i < $lengthFolders; i++)); do
        mkdir "${folders[${i}]}"
    done
}

# REQUISITO OBRIGATORIOS
# ======================================================================
./core/install_tcl.sh



# Etapa de criacao de links simbolicos
# ======================================================================
PATH_TCL=${HOME}/templatecache-local/templates/

# cd ${HOME}/templatecache-local/templates/
cd $PATH_TCL

createDir &&

# no template links
ln -s ${PATH_TCL}jsuol.com.br ${PATH_TCL}jsuol.com ;
ln -s ${HOME}/UOL/git/jsuol.com-c/ ${PATH_TCL}c.jsuol.com.br ;

# dentro de common
ln -s ${HOME}/UOL/git/commons.uol.com.br-monaco ${PATH_TCL}commons.uol.com.br/monaco ;
ln -s ${HOME}/UOL/git/commons.uol.com.br-projects ${PATH_TCL}commons.uol.com.br/projects ;
ln -s ${HOME}/UOL/git/commons.uol.com.br-static ${PATH_TCL}commons.uol.com.br/static ;
ln -s ${HOME}/UOL/git/commons.uol.com.br-sistemas ${PATH_TCL}commons.uol.com.br/sistemas ;

# dentro da pasta static
ln -s ${HOME}/UOL/git/projeto-grafico-v3 ${HOME}/UOL/git/commons.uol.com.br-static/v3 ;

# dentro da jsuol.com.br
ln -s ${HOME}/UOL/git/jsuol.com-c/ ${PATH_TCL}jsuol.com.br/c
