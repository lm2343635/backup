# backup
The script to backup and recover PHP website running on Linux server.

## Setup

The format of config file:

```shell
wwwroot=/data/wwwroot/
nginx=/usr/local/nginx/conf/vhost/
username=
password=
```
Create a config file named `config` in the backup script folder and add the config above.

## Documentation

**All folder should endup with "/".**

- backup.sh: Backup a site to a folder. All files of the site, sql backup of database and nginx configuration file will be copied to the folder.
```shell
./backup.sh [site] [path]
```

- backup_zip.sh: Backup a site to a zip file.
```shell
./backup_zip.sh [site] [path]
```

- recover.sh: Recover a site from the folder created by the shell script backup.sh. Nginx server should be restarted manually after recovering the website.
```shell
./recover.sh [site] [path]
service nginx restart
```

- recover_all.sh: Recover all sites from the folder created by the shell script backup.sh in a parent folder. Here, the name of subfolder will be used as the name of the site. Nginx server should be restarted manually after recovering the website.
```shell
./recover_all.sh [path]
service nginx restart
```

- dump.sh: Dump a database to a sql file.
```shell
./dump.sh [site] [path]
```

- execute.sh: Execute a sql file and restore it into a new database, the name of the new database is the parameter site.
```shell
./execute.sh [site] [path]
```

- execute_all.sh: Execute all sql files in a folder and store them to databases. The name of a database is same with the name of a sql file.
```shell
./execute.sh [folder]
```

- privilege.sh: Change privilege of a DedeCMS website.
```shell
./privilege.sh [path]
```
