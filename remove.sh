while read line;do
    eval "$line"
done < config

site=$1;

path="$wwwroot$site/"

rm -rf $path
echo "Deleting source file from $path."

echo "Deleting nginx config file from $nginx$site.conf"
rm -rf "$nginx/$site.conf"

echo "Deleting database $site."
echo "drop database if exists ${site};" | mysql -u $username -p$password
