#!/bin/bash

# info regarding produce argument in docker command
help_produce() {
	echo "Example:"
	echo "docker run --rm -v /local_directory/my_mkdocs_project:/mkdocs/my_mkdocs_project img:tag produce /mkdocs/my_mkdocs_project"
}

# info regarding serve argument in docker command
help_serve() {
	echo "Example:"
	echo "docker run -p 8000:8000 <arguments> <docker_img_name> serve"
}

# info regarding produce and serve command for mkdocs
help_init() {
	echo "Produce and serve a local mkdocs project"
	help_produce
	help_serve
}

# it generate a tar file in given directory using command line argument.
produce() {
	if [[ -z "$1" ]]; then
		echo -e "mkdocs project directory required\n"
		help_produce

		exit 1
	fi

	if [[ -d $1 ]]; then

		tar czf - -C $1 .

	fi
}

# using archived tar file its serve the mkdocs project on localhost:8000
serve() {

	tar xzf - -C .
	echo "mkdocs is serving in localhost:8000"
	mkdocs serve --dev-addr=0.0.0.0:8000

}

case $1 in
	produce)
		produce $2
		;;
	serve)
		serve
		;;
  *)
		help_init
		;;
esac
