#! /bin/bash

# script

# config var {{{
# variabili lette da parametro (per ora sono di test)
PROJECT_NAME="entpy_contest" # da parametro @1, il nome che voglio dare al progetto, campo libero
GIT_PROJECT_NAME="entpy-contest" # da parametro @2, il nome del repo di git
GIT_ACCOUNT_NAME="entpy" # da parametro @3, il nome dell'account di git (utilizzato per comporre l'url)
# config var }}}

# directory
WEBAPP_DIR="/tmp/webapp/"
PRODUCTION_DIR_NAME="production"
SANDBOX_DIR_NAME="sandbox"
PROJET_DIR="$WEBAPP_DIR$PROJECT_NAME/"
PRODUCTION_DIR="$PROJET_DIR$PRODUCTION_DIR_NAME/"
SANDBOX_DIR="$PROJET_DIR$SANDBOX_DIR_NAME/"
CURDIR="$PWD/" # directory di esecuzione script

# configurazioni varie di git e pip
DJANGO_VER="1.6.5"
GIT_REPO_URL="git://github.com/$GIT_ACCOUNT_NAME/$GIT_PROJECT_NAME.git"

# tipi di configurazione pluggate
CONF_PLUGGED=("local_settings_conf" "gunicorn_conf" "supervisor_conf" "nginx_conf")

# ciclo sulle configurazioni pluggate ed eseguo l'init per ognuna
for i in ${CONF_PLUGGED[@]}; do
	cd $CURDIR${i}
	source init.sh
	exit
done

exit
# se la directory $WEBAPP_DIR$PROJECT_NAME esiste già -> exit (environment already exists)
if [ -d "$PROJET_DIR" ]; then
	echo "enviroment per la webapp gia' configurato"
	# TODO exit
fi

# creo la directory contenente le webapp (se non esiste già) e quella del progetto
echo "### mkdir -p $PROJET_DIR ###"
mkdir -p "$PROJET_DIR"

# upload di GIT_PROJECT_NAME nella directory di sandbox (git clone in sandbox)
echo "### cd $PROJET_DIR ###"
cd $PROJET_DIR
echo "### git clone $GIT_REPO_URL $SANDBOX_DIR_NAME ###"
# git clone $GIT_REPO_URL $SANDBOX_DIR_NAME

# creo il virtualenv
echo "### virtualenv $SANDBOX_DIR_NAME ###"
virtualenv $SANDBOX_DIR_NAME

# entro nel virtualenv e lo attivo
echo "### cd $SANDBOX_DIR_NAME ###"
cd $SANDBOX_DIR_NAME
echo "### source bin/activate ###"
source bin/activate

# installo le dipendenze con pip leggendo da un file che metterò nel repo di git
echo "### pip install django==$DJANGO_VER ###"
pip install django==$DJANGO_VER

# creo i file local_settings.py per entrambi gli ambienti,
# anche in questo caso, parto da un modello vuoto, sostituisco e copio il contenuto nella
# giusta directory

# creo lo script gunicorn_start sostituendo le variabili al suo interno
# lo faccio con una regexp e partendo da un file da sostituire con il contenuto di gunicorn_start

# creo le directory bin e logs con developer come proprietario e permessi completi

### supervisor conf ###
# se CREATE_SUPERVISOR_CONF == 1, creo il file di configurazione di supervisor,
# anche in questo caso, parto da un modello vuoto, sostituisco e copio il contenuto nella
# giusta directory

### nginx conf ###
# se CREATE_NGINX_CONF == 1, creo il file di configurazione di nginx,
# anche in questo caso, parto da un modello vuoto, sostituisco e copio il contenuto nella
# giusta directory
