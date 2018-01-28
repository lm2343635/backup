while read line;do
    eval "$line"
done < config

if [ ! -d $indexes ];then
	mkdir $indexes
fi

for file in `ls $wwwroot`
do
    site="${file%.*}";
    if [ "$site" == "default" ]; then
        continue
    fi
    echo "Backup the index.html file of the website $site"
    indexBackPath="$indexes$site"
    rm -rf $indexBackPath
   	mkdir $indexBackPath
   	cp "$wwwroot$site/index.html" "$indexes$site/index.html"
done