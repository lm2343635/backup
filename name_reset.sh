path=$1;

for file in `ls $path`
do
    site="${file%.*}";
    echo $site
    mv "$path/$site/index.html1" "$path/$site/index.html"
    mv "$path/$site/index.php1" "$path/$site/index.php"
done
