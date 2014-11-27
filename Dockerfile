FROM ubuntu:14.04
MAINTAINER Renzo Meister <rm@jamotion.ch>

RUN apt-get update && apt-get install -y --force-yes wget postgresql-client vim

# We set the openerp user and group fixed for compatibility with connectors and hosts
RUN addgroup --gid=1000 openerp && adduser --system --uid=1000 --gid=1000 --home /home/openerp --shell /bin/bash openerp

# DBHOST is used to set the host used to connect to psql container
ENV DBHOST 172.17.42.1
# DBUSER is used to set the user used to connect to psql container
ENV DBUSER openerp
# DBPWD is used to set the password used to connect to psql container
ENV DBPWD 0p3n3rp
# DBNAME is used to set the password used to connect to psql container
ENV DBNAME unknown

ADD jamo-backup /usr/bin/jamo-backup
RUN chmod a+x /usr/bin/jamo-backup

VOLUME ["/backup"]
CMD ["/usr/bin/jamo-backup"]
