FROM centos

LABEL maintainer "Naval"

RUN yum -y install httpd

EXPOSE 80

VOLUME /var/www/html

ENTRYPOINT [ "/usr/sbin/httpd" ]
CMD ["-D", "FOREGROUND"]
