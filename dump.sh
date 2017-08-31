username='';
password='';
site=$1;

echo "Dumping database $site to file $site.sql."
mysqldump -u $username -p$password $site > "$site.sql"
