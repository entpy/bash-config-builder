#! /bin/bash

# script per creare il file locale di impostazioni di Django
function plugin_init() {
	write_custom_configuration "${CONF_FILE_SETTINGS["CONF_TEMPLATE_VAR_TO_STRING"]}" "${CONF_FILE_SETTINGS["CONF_TEMPLATE"]}" "${CONF_FILE_SETTINGS["CONF_FILE_PATH"]}"
	return
}
