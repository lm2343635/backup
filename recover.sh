WWWROOT=/data/wwwroot;
NGINX_CONF=/usr/local/nginx/conf/vhost;

path=$1;
username=$2;
password=$3;

fullPath=`pwd $path`
site=${fullPath##*/}

recoverPath="$WWWROOT/$site"
# Try to delete if recover path is existing.
rm -rf $recoverPath
echo "Copying source file from $path/$site to $recoverPath."
cp -rf "$path/$site" $recoverPath
echo "Copying nginx config file from $path/$site.conf to $NGINX_CONF/$site.conf"
cp "$path/$site.conf" "$NGINX_CONF/$site.conf"