while read line;do
    eval "$line"
done < config

files=$(echo $indexFiles|tr "/" "\n")

for file in `ls $indexes`
do
    site="${file%.*}";
    if [ "$site" == "default" ]; then
        continue
    fi
    path="$wwwroot$site"
    if [ -d $path ];then
		echo "Recover the index.html file of the website $site"
		for file in ${files[@]}; do
  			rm -rf "$path/$file"
			cp "$indexes$site/$file" $path
		done
	fi
done