WWWROOT=/data/wwwroot;
NGINX_CONF=/usr/local/nginx/conf/vhost;
username='';
password='';

path=$1;
site=$2;

recoverPath="$WWWROOT/$site"
# Try to delete if recover path is existing.
rm -rf $recoverPath
echo "Copying source file from $path/$site to $recoverPath."
cp -rf "$path/$site" $recoverPath
chmod -R 755 $recoverPath
chown -R www:www $recoverPath

echo "Reovering database $site"
echo "drop database if exists ${site}; create database ${site} character set utf8 collate utf8_general_ci; use ${site}; source ${path}/${site}.sql;" | mysql -u $username -p$password

echo "Copying nginx config file from $path/$site.conf to $NGINX_CONF/$site.conf"
cp "$path/$site.conf" "$NGINX_CONF/$site.conf"
