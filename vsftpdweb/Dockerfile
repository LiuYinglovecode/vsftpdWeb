FROM debian
LABEL Maintainer <norbert.van.nobelen2@gmail.com>

# Install base software
RUN apt-get update && apt-get install -y --no-install-recommends mysql-client \
    apache2 \
    php php-pear php-mysql && \
    apt-get clean
# Configure file paths for user management
RUN mkdir -p /ftp
ADD launch.sh /
RUN chmod +x /launch.sh
# Configure admin interface
RUN rm /var/log/apache2/access.log && ln -s /dev/stdout /var/log/apache2/access.log
RUN rm -f /var/www/html/*
RUN mkdir -p /var/www/html/ftp
ADD vsftpdweb/ /var/www/html/ftp
RUN mv /var/www/html/ftp/index.html /var/www/html/
RUN rm -rf /etc/sudoers
ADD etc/ /etc
RUN chown root:root /etc/sudoers && chmod oug-rwx /etc/sudoers && chmod ug+r /etc/sudoers

# Add extra security since the tool used is a bit ancient and at least suspect to SQL injection
# Probably should become a kubernetes secret so that the container does not need to be recompiled when the password changes
RUN htpasswd -b -c /etc/apache2/.htpasswd admin UPDATE_THIS_UNSAFE

CMD /launch.sh
