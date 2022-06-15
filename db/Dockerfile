# See this document for MySQL configuration instructions:
# http://www.globalsight.com/wiki/index.php/Installing_Third-party_Components_for_GlobalSight_on_Ubuntu
#
# Bind mounting the ./mysql directory will simply use the file permissions on the host, and MySQL will ignore the
# my.cnf file if it is world-writable.  We'll have to copy this file to the image.
FROM mysql:5.7
COPY my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 644 /etc/mysql/conf.d/my.cnf
