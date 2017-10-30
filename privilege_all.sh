path=$1;

for file in `ls $path`
do
    folder="$path$file";
    echo "Set privilege for $folder"
    sh privilege.sh $folder
done
