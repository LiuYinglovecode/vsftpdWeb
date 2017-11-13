# What is this?

This container/pod has the ftp service and a user management interface for the ftp.

There are two containers defined here:

* A vsftpd container with only vsftpd;
* A web interface container as clone from http://velkoff.net/vsftpdweb/ updated for php7

# Main differences with velkoff

The main differences are:

* Updates for php7;
* Added warning on delete of a user;
* Some small bugfixes (but certainly not all)

As Velkoff mentions, this is not a production tool due to several limitations. One limitation, security, is however enhanced in this repo by adding a basic authentication in front of the admin interface. This limits the chances of SQL injection in the existing code. 

# Why use this tool?

In looking for a nice easy to use interface without any installation issues, this tool scores pretty good. In short: It works for managing users for vsftpd and nothing more than that.

# Dependencies

This application depends on an external mysql database.

# Building

     cd vsftpd
     docker build .
     cd ../vsftpdweb
     docker build .

Tagging/versioning: Up to the user of this code.

# Installation

Setup the database using the sql file:

    mysql -u root -p < vsftpd.sql

Load the services and the ingress:

    kubectl apply -f svc.yaml

# Starting/stopping

To start:

   kubectl apply -f deploy.yaml

To stop:

   kubectl delete -f deploy.yaml

# Known issues/limitations

1) Delete a user and than add a user leads to calling delete again but without any id (so no damage, but certainly not pretty);
2) Limited number of pasv ports: 30 assigned right now. A helm template could make this better by using go-templating to generate out a larger set;
3) No use of configmaps for both the apache and the vsftpd configuration;
4) Code is prone to SQL injection and is up for an update;
5) The mail component does nothing: Not installed in the container, not configured.

# Updates on repo

The repo is under active maintenance. Please branch and submit any updates.

# Applicable licenses

The license followed is the license set by Velkoff for the vsftpdweb admin interface

The license for using the vsftpd container, setup, and Kubernetes is GPLv3 (https://www.gnu.org/licenses/gpl-3.0.en.html)
