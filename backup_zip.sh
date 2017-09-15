site=$1;
path=$2;

sh backup.sh $site $path

cd $path
zip -r $site.zip $site
rm -rf $site
