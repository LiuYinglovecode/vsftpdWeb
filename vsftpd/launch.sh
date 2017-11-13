#!/bin/bash -e
echo starting ftp server
chown www-data:www-data /ftp
/usr/sbin/vsftpd
