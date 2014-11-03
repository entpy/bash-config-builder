#! /bin/bash

# script per creare il file locale di impostazioni di Django
function plugin_init() {

	ENVIRONMENT_NAME="${CONF_FILE_SETTINGS["ENVIRONMENT_NAME"]}"
	# upload di GIT_PROJECT_NAME nella directory di sandbox (git clone in sandbox)
	echo "### cd ${INI__project_dir_path} ###"
	cd ${INI__project_dir_path}
	echo "### git clone ${INI__git_repo_url} $ENVIRONMENT_NAME ###"
	git clone ${INI__git_repo_url} $ENVIRONMENT_NAME

	# creo il virtualenv
	echo "### virtualenv $ENVIRONMENT_NAME ###"
	virtualenv $ENVIRONMENT_NAME

	# entro nel virtualenv e lo attivo
	echo "### cd $ENVIRONMENT_NAME ###"
	cd $ENVIRONMENT_NAME
	echo "### source bin/activate ###"
	source bin/activate

	# installo le dipendenze con pip leggendo da un file che metterò nel repo di git
	echo "### pip install requirements file ###"
	pip install -r requirements.txt

	# deactivating virtualenv
	deactivate

	return
}
