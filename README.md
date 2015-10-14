# dhis2-test-config
Script for Dhis2 setup with an empty database

## prerequisites
- Make sure that postgres is running
- Setup hibernate.properties file
- Make sure that **DHIS2_HOME** environment variable exist and points to folder that contains **hibernate.properties** file.

## Usage
```sh
$ dhis2-setup-empty-db.sh install # for installation
```

```sh
$ dhis2-setup-empty-db.sh run # To run DHIS2 application
```
