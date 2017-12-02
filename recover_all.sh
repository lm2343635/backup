path=$1;

for file in `ls $path`
do
    site="${file%.*}";
    folder="$path$file";
    echo "Recovering site $site from $folder."
    sh recover_zip.sh $site $folder 
done
