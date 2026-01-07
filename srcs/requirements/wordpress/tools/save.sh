ls -la
docker cp wordpress:var/www/html/. ./srcs/requirements/wordpress/sources
git add --all
git commit -m"save wordpress"
git push