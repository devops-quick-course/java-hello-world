FROM Centos
MAINTAINER Naval K Joshi

# Install prepare infrastructure
RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar
 
 CMD ["bin/bash/","run"]
