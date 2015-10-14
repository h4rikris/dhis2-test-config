 #!/bin/bash
function usage
{
	echo "usage: ./setup.sh OPTIONS\nPossible Options are\n1)install\n2)run"
}

function database_setup
{
	echo "Creating postgres user"
	createuser -SDR dhis
	echo "Dropping dhis2 database"
	dropdb dhis2
	echo "Creating dhis2 database"
	createdb -O dhis dhis2

}

function install
{
	DIRECTORY="trunk/"
	if [ -d "$DIRECTORY" ]; then
		cd $DIRECTORY;
		bzr update;
	else
		echo "Downloading dhis repository"
        bzr branch lp:~dhis2-devs-core/dhis2/2.20 $DIRECTORY;
    	cd $DIRECTORY;
	fi
	cd "dhis-2/"
	chmod +x build.sh
	./build.sh
}

function run
{
	DHISPATH="trunk/dhis-2/dhis-web/dhis-web-portal/"
	cd $DHISPATH
	mvn jetty:run-war
}

if [ "$1" == "install" ]; then
	install
	database_setup
	exit 0
elif [ "$1" == "run" ]; then
	run
	exit 0
else
	usage
	exit 1
fi