while read line;do 
    eval "$line"
done < config

site=$1;
path=$2;

echo "Dumping database $site to file $site.sql."
mysqldump -u $username -p$password $site > "$path/$site.sql"
