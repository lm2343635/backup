username='';
password='';

site=$1;
sql=$2;

echo "drop database if exists ${site}; create database ${site} character set utf8 collate utf8_general_ci; use ${site}; source ${sql};" | mysql -u $username -p$password
