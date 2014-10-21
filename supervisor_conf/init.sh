#! /bin/bash

# script per creare il file locale di impostazioni di Django
function plugin_init() {
	# creo la struttura per i file di configurazione, se non esiste
	if [ ! -d "${CONF_FILE_SETTINGS["SUPERVISOR_CONFIG_DIR_PATH"]}" ]; then
		echo "### supervisor: mkdir ${CONF_FILE_SETTINGS["SUPERVISOR_CONFIG_DIR_PATH"]} ###"
		mkdir -p "${CONF_FILE_SETTINGS["SUPERVISOR_CONFIG_DIR_PATH"]}"
	fi

	write_custom_configuration "${CONF_FILE_SETTINGS["CONF_TEMPLATE_VAR_TO_STRING"]}" "${CONF_FILE_SETTINGS["CONF_TEMPLATE"]}" "${CONF_FILE_SETTINGS["CONF_FILE_PATH"]}"
	return
}
