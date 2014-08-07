#!/bin/bash
# Author: Leland Sanders
# Date: July 22, 2014
# Shell script that will do a mysqldump of database
# then it will be turned into a tar.bz2 file to compress
# the file is then removed and the .tar.bz2 file is
# sent it to the repository at Github

cd /usr/scripts/dbbackup
mysqldump -u [username] -p[password] [databaseName] > [fileName].sql
tar -cvjf [fileName].tar.bz2 [fileName].sql
rm [fileName].sql
git add [fileName].tar.bz2
git commit -m "Database backup for `date +'%Y-%m-%d %H:%M:%S'`"
git push origin master 

