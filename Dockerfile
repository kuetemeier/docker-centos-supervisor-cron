############################################################
# Dockerfile to build a CentOS base container with
# autoupdate and cron features
# Based on jkuetemeier/centos-base
############################################################

FROM jkuetemeier/centos-base:latest

MAINTAINER Jörg Kütemeier <jkuetemeier@kuetemeier.net>

# Install EPEL
RUN yum install -y epel-release && yum clean all

# Update RPM Packages
RUN yum -y update && yum clean all

RUN yum -y install supervisor cronie yum-cron && yum clean all

ADD supervisord.conf /etc/supervisord.conf
ADD crond.ini /etc/supervisord.d/crond.ini

RUN chmod 600 /etc/supervisord.conf /etc/supervisord.d/*.ini

# set yum-cron flag file to run updates
RUN mkdir -p /var/lock/subsys
RUN touch /var/lock/subsys/yum-cron
RUN sed -i 's/apply_updates = no/apply_updates = yes/' /etc/yum/yum-cron.conf
RUN sed -i 's/apply_updates = no/apply_updates = yes/' /etc/yum/yum-cron-hourly.conf

CMD ["/usr/bin/supervisord"]
