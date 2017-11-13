# Requirements

The installation requires:

* Update of the kubernetes/deploy.yaml to set a correct data directory
* An external MariaDB to persist the login information

# Configuration

There are several passwords which need to be updated:

* In the Dockerfile update UPDATE_THIS_UNSAFE to a strong password;
* in vsftpdweb/application/config/database.php update the password and DBHOST;
* Set the credentials in the install/vsftpd.sql file to the correct credentials (see UPDATE_THIS_UNSAFE at the bottom of the file, 6 times and you might want to consider 3 different passwords (one for admin, one for database access, and 1 for e-mail, the admin password can be reset later using the web interface);
* Execute the SQL file in MariaDB.

