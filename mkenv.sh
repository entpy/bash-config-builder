#! /bin/bash

# determine absolute script path
# http://stackoverflow.com/questions/630372/determine-the-path-of-the-executing-bash-script
SCRIPT_PATH="`dirname \"$0\"`"              # relative
SCRIPT_PATH="`( cd \"$SCRIPT_PATH\" && pwd )`/"  # absolutized and normalized
cd "$SCRIPT_PATH"

# loading ini file parser
source bash_ini_parser-master/read_ini.sh

# parsing ini file
read_ini config.ini

# loading script base function
source functions_definition.sh

# config var {{{
# variabili lette da parametro (per ora sono di test)
#PROJECT_NAME="entpy_contest" # da parametro @1, il nome che voglio dare al progetto, campo libero
#GIT_PROJECT_NAME="entpy-contest" # da parametro @2, il nome del repo di git
#GIT_ACCOUNT_NAME="entpy" # da parametro @3, il nome dell'account di git (utilizzato per comporre l'url)
# config var }}}

# directory
#WEBAPP_DIR="/tmp/webapp/"
#PROJET_DIR="$WEBAPP_DIR$PROJECT_NAME/"

# configurazioni varie di git e pip
#GIT_REPO_URL="git://github.com/$GIT_ACCOUNT_NAME/$GIT_PROJECT_NAME.git"

# tipi di configurazioni pluggate (ATTENZIONE: elmenti definiti secondo un ordine di esecuzione)
CONF_PLUGGED=(
		# environment plugin
		"environment_sandbox"
		"environment_production"

		# django local settings plugin
		"local_settings_sandbox"
		"local_settings_production"

		# gunicorn plugin
		"gunicorn_sandbox"
		"gunicorn_production"

		# supervisor plugin
		"supervisor"

		# nginx plugin
		"nginx"
	)

# configurazioni per i tipi di configurazioni pluggate:
# il nome deve coincidere con un plugin definito in $CONF_PLUGGED
# seguito da uno spazio e dal tipo di configurazione del plugin (ordine casuale)
declare -A PLUGIN_CONF_ARRAY=(
		# environment conf {{{
		["environment_sandbox PLUGIN_DIR_NAME"]="environment_conf"
		["environment_sandbox CONFIGURATION_FILE"]="sandbox.sh"
		["environment_production PLUGIN_DIR_NAME"]="environment_conf"
		["environment_production CONFIGURATION_FILE"]="production.sh"
		# environment conf }}}

		# django local setting conf {{{
		["local_settings_sandbox PLUGIN_DIR_NAME"]="local_settings_conf"
		["local_settings_sandbox CONFIGURATION_FILE"]="sandbox.sh"
		["local_settings_production PLUGIN_DIR_NAME"]="local_settings_conf"
		["local_settings_production CONFIGURATION_FILE"]="production.sh"
		# django local setting conf }}}

		# gunicorn conf {{{
		["gunicorn_sandbox PLUGIN_DIR_NAME"]="gunicorn_conf"
		["gunicorn_sandbox CONFIGURATION_FILE"]="sandbox.sh"
		["gunicorn_production PLUGIN_DIR_NAME"]="gunicorn_conf"
		["gunicorn_production CONFIGURATION_FILE"]="production.sh"
		# gunicorn conf }}}

		# supervisor setting conf {{{
		["supervisor PLUGIN_DIR_NAME"]="supervisor_conf"
		["supervisor CONFIGURATION_FILE"]="all_environment.sh"
		# supervisor setting conf }}}

		# nginx setting conf {{{
		["nginx PLUGIN_DIR_NAME"]="nginx_conf"
		["nginx CONFIGURATION_FILE"]="all_environment.sh"
		# nginx setting conf }}}
	)

# TODO: se la directory $WEBAPP_DIR$PROJECT_NAME esiste già -> exit (environment already exists)
# check_app_directory

# creating project directory
make_project_dir

# build conf files
build_conf_files
