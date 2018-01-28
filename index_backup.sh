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
  		cp "$wwwroot$site/$file" "$indexes$site/$file"
	done
done