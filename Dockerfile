FROM centos:7

RUN yum -y install php && \
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
yum -y install yum-utils && \
subscription-manager repos --enable=rhel-7-server-optional-rpms && \
yum-config-manager --enable remi-php72 && \
yum -y update && \
yum -y install php72 php72-php-fpm php72-php-gd php72-php-json php72-php-mbstring php72-php-mysqlnd php72-php-xml php72-php-xmlrpc php72-php-opcache
