# Requirements

The installation requires:

* Update of the kubernetes/deploy.yaml to set a correct data directory
* An external MariaDB to persist the login information

# Installation

1) Set the credentials in the vsftpd.sql file to the correct credentials (see UPDATE_THIS_UNSAFE at the bottom of the file, 6 times and you might want to consider 3 different passwords (one for admin, one for database access, and 1 for e-mail, the admin password can be reset later using the web interface)
2) Update the credentials in the vsftpd/etc/vsftpd.conf;
3) Execute the SQL file in MariaDB;
4) Execute the deploy.yaml & svc.yaml
