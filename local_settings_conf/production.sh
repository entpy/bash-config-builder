#! /bin/bash

# config module settings
declare -A CONF_TEMPLATE_VAR
declare -A CONF_FILE_SETTINGS

CONF_TEMPLATE_VAR["{ADMIN_NAME}"]=${INI__production_local_settings_conf__conf_template_ADMIN_NAME}
CONF_TEMPLATE_VAR["{ADMIN_EMAIL}"]=${INI__production_local_settings_conf__conf_template_ADMIN_EMAIL}
CONF_TEMPLATE_VAR["{PROJECT_POSTFIX}"]=${INI__production_local_settings_conf__conf_template_PROJECT_POSTFIX}
CONF_TEMPLATE_VAR["{SECURE_KEY}"]=${INI__production_local_settings_conf__conf_template_SECURE_KEY}
CONF_TEMPLATE_VAR["{GIT_PROJECT_NAME}"]=${INI__webapp_project_dir_name}
CONF_TEMPLATE_VAR["{ALLOWED_HOST}"]=${INI__production_local_settings_conf__conf_template_ALLOWED_HOST}
CONF_TEMPLATE_VAR["{DATABASE_NAME}"]=${INI__production_local_settings_conf__conf_template_DATABASE_NAME}
CONF_TEMPLATE_VAR["{DATABASE_USER}"]=${INI__production_local_settings_conf__conf_template_DATABASE_USER}
CONF_TEMPLATE_VAR["{DATABASE_PASSWORD}"]=${INI__production_local_settings_conf__conf_template_DATABASE_PASSWORD}
CONF_FILE_SETTINGS["CONF_TEMPLATE"]=`${INI__production_local_settings_conf__conf_template_CMD}`
CONF_FILE_SETTINGS["CONF_FILE_PATH"]=${INI__production_local_settings_conf__conf_file_path}

# pass assocociative array CONF_TEMPLATE_VAR in string form to function -> http://stackoverflow.com/questions/4069188/how-to-pass-an-associative-array-as-argument-to-a-function-in-bash
CONF_FILE_SETTINGS["CONF_TEMPLATE_VAR_TO_STRING"]=$(declare -p CONF_TEMPLATE_VAR)
