# dhis2-test-config
Script for Dhis2 setup with an empty database

## Dependencies
- postgres
- bazaar
- maven

##Instructions

- Create a **hibernate.properties** file and add the following

  ```
  hibernate.dialect = org.hibernate.dialect.PostgreSQLDialect
  hibernate.connection.driver_class = org.postgresql.Driver
  hibernate.connection.url = jdbc:postgresql:dhis2
  hibernate.connection.username = dhis
  hibernate.connection.password =
  hibernate.hbm2ddl.auto = update
  hibernate.show_sql=false
  ```
- Add the following to your **~/.bashrc** or **~/.zshrc**

  ```sh
  export MAVEN_OPTS="-Xms1024m -Xmx2048m -XX:NewSize=256m -XX:MaxNewSize=356m -XX:PermSize=512m -XX:MaxPermSize=1024m"
  export JAVA_OPTS="-Xms1024m -Xmx2048m -XX:NewSize=256m -XX:MaxNewSize=356m -XX:PermSize=512m -XX:MaxPermSize=1024m"
  export DHIS2_HOME= <location of your hibernate.properties file> # Dont include hibernate.properties in the location
  ```
- Start the postgres server by running (Ignore this if your postgres is running)

  ```sh
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
  ```

- Run the following command to download dhis2 from bazaar and build the application. Also it will setup database user along with empty db for dhis2.

  ```sh
  ./dhis2-setup-empty-db.sh install
  ```
- Below command helps you to run the dhis2 application

  ```sh
  ./dhis2-setup-empty-db.sh run
  ```

- Now open **localhost:8080** on your browser. ```username:admin password:district```
