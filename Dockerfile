FROM stackbrew/ubuntu:12.04
MAINTAINER Gordon Chiam <gordon.chiam@gmail.com>

# install python-software-properties to get add-apt-repository 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes python-software-properties

# install mariadb
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
RUN add-apt-repository 'deb http://download.nus.edu.sg/mirror/mariadb/repo/5.5/ubuntu precise main'
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes mariadb-server

ADD my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 664 /etc/mysql/conf.d/my.cnf
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

VOLUME ["/var/lib/mysql"]
EXPOSE 3306
CMD ["/usr/local/bin/run"]
