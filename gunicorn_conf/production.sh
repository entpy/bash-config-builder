#! /bin/bash

# config module settings
declare -A CONF_TEMPLATE_VAR
declare -A CONF_FILE_SETTINGS

CONF_TEMPLATE_VAR["{DJANGO_PROJECT_NAME}"]=${INI__django_project_name}
CONF_TEMPLATE_VAR["{PROJECT_DIR_PATH}"]="${INI__project_dir_path}${INI__production_environment_conf__environment_name}"
CONF_TEMPLATE_VAR["{APPNAME}"]="${INI__webapp_project_dir_name}_${INI__production_environment_conf__environment_name}"

CONF_FILE_SETTINGS["CONF_TEMPLATE"]=`${INI__production_gunicorn_conf__conf_template_CMD}`
CONF_FILE_SETTINGS["CONF_FILE_PATH"]=${INI__production_gunicorn_conf__conf_file_path}

# pass assocociative array CONF_TEMPLATE_VAR in string form to function -> http://stackoverflow.com/questions/4069188/how-to-pass-an-associative-array-as-argument-to-a-function-in-bash
CONF_FILE_SETTINGS["CONF_TEMPLATE_VAR_TO_STRING"]=$(declare -p CONF_TEMPLATE_VAR)
