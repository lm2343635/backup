path=$1;

for file in `ls $path`
do
    site="${file%.*}";
    sql="$path$file";
    echo "Recovering sql file $sql to database $site..."
    sh "`pwd`/execute.sh" "$site" "$sql"
done
