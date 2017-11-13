FROM debian
LABEL Maintainer <norbert.van.nobelen2@gmail.com>

# Install base software
RUN apt-get update && apt-get install -y --no-install-recommends vsftpd mysql-client \
    libpam-mysql && \
    apt-get clean
# Configure vsftpd
RUN mkdir -p /var/run/vsftpd/empty
RUN mkdir -p /ftp
ADD launch.sh /
ADD etc/ /etc
RUN chmod +x /launch.sh

CMD /launch.sh
