#!/usr/bin/env bash
set -e

# Because we can't tell if the MySQL container has started, we should wait for it here.
./wait-for-it.sh -t 30 -h db -p 3306 -- echo "Finished waiting for MySQL"

# For the first run, the database has not yet been created, and the application has not yet been installed, so we should
# do so.
if [ ! -f /home/jboss/globalsight/init/database-created ]; then
  # Oh boy, the installer can't be automated; it needs to sit around and wait for user input.  I'd like to simply accept
  # all default settings except... the installer also creates a properties file based on your user input, and this file
  # is used to direct the rest of the installation (like create MySQL tables, set the MySQL user/password, set the admin
  # user/password, directories, etc).
  #
  # The defaults for this properties file can be obtained from the source, and provided as an arg for the Java intaller,
  # but not the installer script.  We still have to go through the UI installer with user input, so... let's pipe input
  # into the thing...
  #
  # 1. Next (n)
  # 1. Server Settings (1)
  # 1. JDK (1), ($JAVA_HOME)
  # 1. Port (3), (8080)
  # 1. Menu (m)
  # 1. Application Settings (2)
  # 1. GlobalSight Admin Password (2), (password)
  # 1. Menu (m)
  # 1. MySQL Database (3)
  # 1. Username (4), (root)
  # 1. Pasword (5), (password)
  # 1. Install Options (6)
  # 1. Create Database? (4)
  # 1. Create Database? (t)
  # 1. Install (i)
  # 1. You will lose all data! (y)
  #
  # Not only that, the installer creates the database, so the first time we run the container, we should do the install.
  # After we do, just start the standalone app without wiping the entire database.
  cd /home/jboss/globalsight/install
  (echo n; sleep 3;
   echo 1; sleep 3;
   echo 1; sleep 3; echo $JAVA_HOME; sleep 3;
   echo 3; sleep 3; echo "8080"; sleep 3;
   echo m; sleep 3;
   echo 2; sleep 3;
   echo 2; sleep 3; echo "password"; sleep 3;
   echo m; sleep 3;
   echo 3; sleep 3;
   echo 1; sleep 3; echo "db"; sleep 3;
   echo 4; sleep 3; echo "root"; sleep 3;
   echo 5; sleep 3; echo "password"; sleep 3;
   echo m; sleep 3;
   echo 6; sleep 3;
   echo 4; sleep 3;
   echo t; sleep 3;
   echo i; sleep 3;
   echo y) | java -cp $CLASSPATH Install
  touch /home/jboss/globalsight/init/database-created
fi

# The installer script has to be run as root, but run jboss as the jboss user.
sudo -H -u jboss /bin/bash -c "/home/jboss/globalsight/jboss/server/bin/standalone.sh -Djboss.bind.address=0.0.0.0"
