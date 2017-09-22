site=$1;
path=$2;

unzip $path
sh recover.sh $site "`pwd`/$site/"
rm -rf "`pwd`/$site/"
