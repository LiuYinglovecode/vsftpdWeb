# Configuring the vsftpd container

Take care to set the correct passwords in etc/vsftpd.conf and in pam.d/vsftpd else the vsftpd server will not have access to MariaDB and will show incorrect behavior.
Also update the MariaDB host `DBHOST`

For now the config files are build into the container. Feel free to update this to a configmap or secret.

# Building the vstfpd container

    docker build .

Tagging and kubernetes deployment file updates are to be setup by the developer.
