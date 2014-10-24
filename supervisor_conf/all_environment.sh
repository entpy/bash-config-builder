# config module settings
declare -A CONF_TEMPLATE_VAR
declare -A CONF_FILE_SETTINGS

CONF_TEMPLATE_VAR["{PRODUCTION_APP_NAME}"]="${INI__webapp_project_dir_name}_${INI__production_environment_conf__environment_name}"
CONF_TEMPLATE_VAR["{PRODUCTION_APP_PATH}"]="${INI__project_dir_path}${INI__production_environment_conf__environment_name}"
CONF_TEMPLATE_VAR["{SANDBOX_APP_NAME}"]="${INI__webapp_project_dir_name}_${INI__sandbox_environment_conf__environment_name}"
CONF_TEMPLATE_VAR["{SANDBOX_APP_PATH}"]="${INI__project_dir_path}${INI__sandbox_environment_conf__environment_name}"
CONF_FILE_SETTINGS["CONF_TEMPLATE"]=`${INI__all_environment_supervisor_conf__conf_template_CMD}`
CONF_FILE_SETTINGS["CONF_FILE_PATH"]=${INI__all_environment_supervisor_conf__conf_file_path}
CONF_FILE_SETTINGS["SUPERVISOR_CONFIG_DIR_PATH"]=${INI__all_environment_supervisor_conf__supervisor_config_dir_path}

# pass assocociative array CONF_TEMPLATE_VAR in string form to function -> http://stackoverflow.com/questions/4069188/how-to-pass-an-associative-array-as-argument-to-a-function-in-bash
CONF_FILE_SETTINGS["CONF_TEMPLATE_VAR_TO_STRING"]=$(declare -p CONF_TEMPLATE_VAR)
