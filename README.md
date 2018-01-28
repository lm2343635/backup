# Backup Script for Oneinstack
The script to backup and recover PHP website for oneinstack(https://oneinstack.com) running on Linux server.

Oneinstack(https://github.com/lj2007331/oneinstack) is a script written using the shell, in order to quickly deploy LEMP/LAMP/LNMP/LNMPA/LTMP(Linux, Nginx/Tengine/OpenResty, MySQL in a production environment/MariaDB/Percona, PHP, JAVA), applicable to CentOS 57(including redhat), Debian 68, Ubuntu 12~16 of 32 and 64.

## Setup

The format of config file:

```shell
wwwroot=/data/wwwroot/
indexes=/data/indexes/
indexFiles=index.html/index.php
nginx=/usr/local/nginx/conf/vhost/
username=
password=
```
Create a config file named `config` in the backup script folder and add the config above.

## Documentation

**All folder should endup with "/".**

- backup.sh: 
    - Backup a site to a folder. 
    - All files of the site, sql backup of database and nginx configuration file will be copied to the folder.

```shell
./backup.sh [site] [path]
```

- backup_zip.sh: 
    - Backup a site to a zip file.

```shell
./backup_zip.sh [site] [path]
```

- recover.sh: 
    - Recover a site from the folder created by the shell script backup.sh. 
    - Nginx server should be restarted manually after recovering the website.

```shell
./recover.sh [site] [path]
service nginx restart
```

- recover_all.sh:
    - Recover all sites from the folder that contains zip files created by backup_zip.sh. 
    - Here, the name of zip file will be used as the name of the site. 
    - Nginx server should be restarted manually after recovering the website.

```shell
./recover_all.sh [path]
service nginx restart
```

- dump.sh: 
    - Dump a database to a sql file.

```shell
./dump.sh [site] [path]
```

- execute.sh: 
    - Execute a sql file and restore it into a new database. 
    - The name of the new database is the parameter site.

```shell
./execute.sh [site] [path]
```

- execute_all.sh: 
    - Execute all sql files in a folder and store them to databases. 
    - The name of a database is same with the name of a sql file.

```shell
./execute.sh [folder]
```

- privilege.sh: 
    - Change privilege of a DedeCMS website.

```shell
./privilege.sh [path]
```

- remove.sh: 
    - Remove a website.

```shell
./remove.sh [site]
```

- index_backup.sh:
    - Backup all index files defined in indexFiles of the config file.

```shell
./index_backup.sh
```    

- index_recover.sh:
    - Recover all index files defined in indexFiles of the config file.
    - This script can be added to crontab in order to recover index files automatically.

```shell
./index_recover.sh
```