# config module settings
declare -A CONF_TEMPLATE_VAR
declare -A CONF_FILE_SETTINGS

CONF_TEMPLATE_VAR["{PRODUCTION_APP_NAME}"]=${INI__all_environment_nginx_conf__conf_template_PRODUCTION_APP_NAME}
CONF_TEMPLATE_VAR["{SANDBOX_APP_NAME}"]=${INI__all_environment_nginx_conf__conf_template_SANDBOX_APP_NAME}
CONF_TEMPLATE_VAR["{PRODUCTION_APP_PATH}"]=${INI__all_environment_nginx_conf__conf_template_PRODUCTION_APP_PATH}
CONF_TEMPLATE_VAR["{SANDBOX_APP_PATH}"]=${INI__all_environment_nginx_conf__conf_template_SANDBOX_APP_PATH}
CONF_FILE_SETTINGS["CONF_TEMPLATE"]=`${INI__all_environment_nginx_conf__conf_template_CMD}`
CONF_FILE_SETTINGS["CONF_FILE_PATH"]=${INI__all_environment_nginx_conf__conf_file_path}

# pass assocociative array CONF_TEMPLATE_VAR in string form to function -> http://stackoverflow.com/questions/4069188/how-to-pass-an-associative-array-as-argument-to-a-function-in-bash
CONF_FILE_SETTINGS["CONF_TEMPLATE_VAR_TO_STRING"]=$(declare -p CONF_TEMPLATE_VAR)
