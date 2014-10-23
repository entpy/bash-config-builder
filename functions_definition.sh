#! /bin/bash

# script

# funzione per scrivere la configurazione finale
function write_custom_configuration() {

	# eval string into a new assocociative array -> http://stackoverflow.com/questions/4069188/how-to-pass-an-associative-array-as-argument-to-a-function-in-bash
	eval "declare -A TEMPLATE_SUBSTITUTION="${1#*=} # è molto pericoloso nel caso di plugin sconosciuti
	CONF_TEMPLATE="$2"
	CONF_PATH="$3"

	for key in "${!TEMPLATE_SUBSTITUTION[@]}"
	do
		SED_STR="s|$key|${TEMPLATE_SUBSTITUTION[$key]}|"
		CONF_TEMPLATE=$(echo "$CONF_TEMPLATE" | sed -e $SED_STR)
	done

	echo "${CONF_TEMPLATE}" > "${CONF_PATH}"
	echo "### write configuration file: ${CONF_PATH} ###"
}

function build_conf_files() {
	# ciclo sulle configurazioni pluggate ed eseguo l'init per ognuna
	# echo "dirname ${CONF_PLUGGED["sandbox_local_settings_conf", "PLUGIN_NAME"]}"
	for i in ${CONF_PLUGGED[*]}; do
		# echo "conf name ${PLUGIN_CONF_ARRAY["$i PLUGIN_DIR_NAME"]}"
		# echo "conf file ${PLUGIN_CONF_ARRAY["$i CONFIGURATION_FILE"]}"
		if [ "${PLUGIN_CONF_ARRAY["$i PLUGIN_DIR_NAME"]}" ] && [ "${PLUGIN_CONF_ARRAY["$i CONFIGURATION_FILE"]}" ]; then
			cd $SCRIPT_PATH${PLUGIN_CONF_ARRAY["$i PLUGIN_DIR_NAME"]}
			source ${PLUGIN_CONF_ARRAY["$i CONFIGURATION_FILE"]}
			source init.sh
			plugin_init
			# per evitare conflitti pulire le variabili presenti in ${PLUGIN_CONF_ARRAY["$i CONFIGURATION_FILE"]}
			unset_plugin_vars
		fi
	done
}

function make_project_dir() {
	# creo la directory contenente le webapp (se non esiste già) e quella del progetto
	echo "### mkdir -p ${INI__project_dir_path} ###"
	mkdir -p "${INI__project_dir_path}"
}

function check_app_directory() {
	if [ -d "${INI__project_dir_path}" ]; then
		echo "enviroment per la webapp gia' configurato"
		exit
	fi
}

function unset_plugin_vars() {
	unset CONF_TEMPLATE_VAR
	unset CONF_FILE_SETTINGS
}
