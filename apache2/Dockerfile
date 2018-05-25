FROM ubuntu:14.04
MAINTAINER The CentOS Project <cloud-ops@centos.org>
#if use centos5 that is depricated uncomment four repo line
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apache2 -y
RUN apt-get install php5 php5-mysql libapache2-mod-php5  php5-cli php5-cgi php5-gd -y
RUN apt-get install mysql-server -y
RUN apt-get install sudo
RUN service apache2 start
RUN update-rc.d apache2 enable
RUN apt-get install openssh-server passwd -y


RUN a2enmod php5
RUN a2enmod rewrite

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

ADD wp /usr/local/bin/wp

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
RUN /usr/local/bin/wp core download --allow-root --path=/var/www/wordpress
RUN /usr/local/bin/wp config create --dbhost=ubuntu_mysql_1 --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --allow-root --path=/var/www/wordpress --skip-check




ADD ./start.sh /start.sh

RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' -y
RUN sed -i 's/PermitRootLogin without-password/\#PermitRootLogin without-password/' /etc/ssh/sshd_config
RUN chmod 755 /start.sh
EXPOSE 22
EXPOSE 80
RUN ./start.sh
ENTRYPOINT ["/usr/sbin/apache2ctl","-D" , "FOREGROUND"]
#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
RUN usermod -aG sudo sergey
