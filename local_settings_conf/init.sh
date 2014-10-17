#! /bin/bash

# script per creare il file locale di impostazioni di Django

# config module settings
declare -A CONF_ARRAY

CONF_ARRAY["ADMIN_NAME"]="admin_name"
CONF_ARRAY["ADMIN_EMAIL"]="admin_name@mail.com"
CONF_ARRAY["PROJECT_POSTFIX"]="-sandbox"
CONF_ARRAY["SECURE_KEY"]="secure_key"
CONF_ARRAY["GIT_PROJECT_NAME"]="git_project_name"
CONF_ARRAY["ALLOWED_HOST"]="'127.0.0.1',"
CONF_ARRAY["DATABASE_NAME"]="dbname"
CONF_ARRAY["DATABASE_USER"]="dbuser"
CONF_ARRAY["DATABASE_PASSWORD"]="dbpass"
CONF_TEMPLATE="$(cat default_template.txt)"

for key in "${!CONF_ARRAY[@]}"
do
	SED_STR="s/$key/${CONF_ARRAY[$key]}/"
	CONF_TEMPLATE=$(echo "$CONF_TEMPLATE" | sed -e $SED_STR)
done

echo "${CONF_TEMPLATE}"
exit
