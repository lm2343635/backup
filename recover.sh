while read line;do
    eval "$line"
done < config

site=$1;
path=$2;

recoverPath="$wwwroot$site"

echo "Copying source file from $path$site to $recoverPath."
cp -rf "$path$site" $recoverPath
chmod -R 755 $recoverPath
chown -R www:www $recoverPath

echo "Reovering database $site"
echo "drop database if exists ${site}; create database ${site} character set utf8 collate utf8_general_ci; use ${site}; source ${path}${site}.sql;" | mysql -u $username -p$password

echo "Copying nginx config file from $path$site.conf to $nginx$site.conf"
cp "$path$site.conf" "$nginx$site.conf"
