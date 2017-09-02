WWWROOT=/data/wwwroot;
NGINX_CONF=/usr/local/nginx/conf/vhost;
username='';
password='';

site=$1;
path=$2;


backupPath="$path/$site"

mkdir $backupPath
echo "Copying source file from $WWWROOT/$site to $backupPath."
cp -rf "$WWWROOT/$site" $backupPath
echo "Copying nginx config file from $NGINX_CONF/$site.conf to $backupPath"
cp "$NGINX_CONF/$site.conf" $backupPath
echo "Dumping database $site to file ${backupPath}/$site.sql."
mysqldump -u $username -p$password $site > "${backupPath}/$site.sql"
