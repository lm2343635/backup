while read line;do
	eval "$line"
done < config

path=$1;

for file in `ls $wwwroot`
do
    site="${file%.*}";
    if [ "$site" == "default" ]; then
        continue
    fi
    echo "Backup the website $site"
    sh dump.sh $site $path
done
