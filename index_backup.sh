while read line;do
    eval "$line"
done < config

files=$(echo $indexFiles|tr "/" "\n")

if [ ! -d $indexes ];then
	mkdir $indexes
fi

for file in `ls $wwwroot`
do
    site="${file%.*}";
    if [ "$site" == "default" ]; then
        continue
    fi
    echo "Backup the index files of the website $site"
    indexBackPath="$indexes$site"
    rm -rf $indexBackPath
   	mkdir $indexBackPath
   	for file in ${files[@]}; do
   		filePath="$wwwroot$site/$file"
   		if [ -f $filePath ];then
   			echo "    $filePath has been saved."
			cp $filePath "$indexes$site/$file"
		fi
	done
done