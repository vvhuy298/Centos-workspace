FROM centos:7

MAINTAINER "VanHuy" <huy@worksmedia.co.jp>

# Update package
RUN yum -y update
# Install Apache
RUN yum -y install httpd httpd-tools
# Install systemd
RUN yum -y install initscripts yum-utils && yum clean all


# Install EPEL Repo
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
 && rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# Install PHP 7.2
RUN yum -y install php72w php72w-bcmath php72w-cli php72w-common php72w-gd php72w-intl php72w-ldap php72w-mbstring \
    php72w-mysql php72w-pear php72w-soap php72w-xml php72w-xmlrpc php72w-devel

# Install XML plugin
RUN pear install channel://pear.php.net/XML_Serializer-0.21.0

# Update Apache Configuration
RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf

# Install Xdebugs Plugin
RUN yum -y install gcc gcc-c++ autoconf automake make
RUN pecl install xdebug

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Open web ports
EXPOSE 80 443

# Copy config files from hosts to containter
COPY ./php.ini /etc/php.ini
COPY ./httpd-vhosts.conf /etc/httpd/conf.d/httpd-vhosts.conf
COPY ./xdebug.ini /etc/php.d/xdebug.ini

# Start Apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]