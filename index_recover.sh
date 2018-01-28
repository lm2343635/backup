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
		echo "Recover the index files of the website $site"
		for file in ${files[@]}; do
			filePath="$path/$file"
			if [ -f $filePath ];then
				rm -rf $filePath
				cp "$indexes$site/$file" $filePath
				chmod 755 $filePath
				chown www:www $filePath
   				echo "    $filePath has been recoverd."
			fi
		done
	fi
done