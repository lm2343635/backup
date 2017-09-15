while read line;do 
    eval "$line"
done < config

site=$1;
path=$2;

backupPath="$path$site/"

mkdir $backupPath
echo "Copying source file from $wwwroot$site to $backupPath."
cp -rf "$wwwroot/$site" $backupPath
echo "Copying nginx config file from $nginx$site.conf to $backupPath"
cp "$nginx/$site.conf" $backupPath
echo "Dumping database $site to file ${backupPath}$site.sql."
mysqldump -u $username -p$password $site > "${backupPath}$site.sql"
