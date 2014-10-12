# Base operating system image
FROM centos

VOLUME ["/var/lib/cassandra"]

# Plus some packages
RUN yum install -y java-1.7.0-openjdk-devel.x86_64 which

# Install datastax Cassandra
ADD src/datastax.repo /etc/yum.repos.d/datastax.repo
RUN yum install -y dsc20

# Install Doradus
RUN mkdir -p /home/doradus
ADD src/doradus-server /home/doradus/doradus-server
RUN cd /home/doradus

ADD src/start.sh /usr/local/bin/start.sh

EXPOSE 9160 7000 7001 9042 7199 1123
CMD start.sh