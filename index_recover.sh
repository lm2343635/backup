while read line;do
    eval "$line"
done < config

for file in `ls $indexes`
do
    site="${file%.*}";
    if [ "$site" == "default" ]; then
        continue
    fi
    path="$wwwroot$site"
    if [ -d $path ];then
		echo "Recover the index.html file of the website $site"
		rm -rf "$path/index.html"
		cp "$indexes$site/index.html" $path
	fi
done