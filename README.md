# backup
Backup and recover script for PHP website running on Linux server.

## Setup

The format of config file:

```shell
wwwroot=/data/wwwroot
nginx=/usr/local/nginx/conf/vhost
username=
password=
```
Create a config file named `config` in the backup script folder and add the config above.

## Documentation

- backup.sh
- recover.sh
- recover_all.sh
- dump.sh
- execute.sh
- execute_all.sh
