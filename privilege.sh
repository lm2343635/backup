path=$1;

chmod -R 755 $path
chown -R www:www $path

chmod -R 555 "${path}install"
chmod -R 755 "${path}dede"
chmod -R 755 "${path}include"
chmod -R 555 "${path}member"
chmod -R 755 "${path}plus"
chmod -R 755 "${path}a"
chmod -R 666 "${path}data"
chmod -R 666 "${path}html"
chmod -R 666 "${path}templets"
chmod -R 666 "${path}uploads"
chmod -R 555 "${path}company"
chmod -R 755 "${path}special"
chmod -R 755 "${path}book"
chmod -R 555 "${path}ask"
chmod -R 555 "${path}group"
