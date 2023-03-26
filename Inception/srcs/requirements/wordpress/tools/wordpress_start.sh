#!/bin/bash 

# Crreation des dossiers et fichiers pour etre sur que qu'au lancement ils trouvent le dossier var/run/..
mkdir	-p /var/run/php/;
touch	/var/run/php/php7.3-fpm.pid;

#Telechargement de Wordpress
#--allow-root : Accès root autorisé
wp core download --allow-root

#Creation de la config wordpress:
#

wp config create --dbname=wordpress --dbuser=$LOGIN --dbpass=$PASSWORD --dbhost=mariadb --dbcharset="utf8mb4" --dbcollate="utf8mb4_unicode_ci" --force --allow-root

#Installation de la configuration Wordpress
#	--url : Initialisation l'url utilisée
#	--title : Initialisation le titre de WordPress
#	--admin_user : Initialisation de l'utilisateur admin
#	--admin_password : Initialisation du mot de passe de l'utilisateur admin
#	--admin_email : Initialisation du mail de l'utilisateur admin
#	--skip-email : N'enverra pas d'email au compte admin créé
#	--allow-root : Accès root autorisé

wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$LOGIN --admin_password=$PASSWORD --admin_email=$EMAIL --skip-email --allow-root

#Creation d'un nouveau utilisateur guest
#--user_pass: initialisation mot de passe de GUEST (via des macros definies dans le .env(a la racine de notre dossier sur notre machine pas accessible))
#--allow-root: acces root autorise???  on lance la commande en root (c'est le changement de la config qui est en root (pas l'utilisateur en root)

wp user create $GUEST_LOGIN $GUEST_EMAIL --user_pass=$GUEST_PWD --allow-root

#Modification du cgi.pathinfo
# pour desactiver: 1 -> 0. Dans ce cas Nginx ne demarre pas ??? 

#a revoir pas compris

# a 0 il peut recevoir une requete de nginx
# il cherche dans le fichier php.ini une ligne commentee ;cgi... et le remplace par cgi.fix...

sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/7.3/fpm/php.ini;

#execution du script
#->Execute les commandes ci de-dessus comme dans un shell pour eviter les zombies (2 exec en cours)
#HELP - https://stackoverflow.com/a/48096779
# A revoir

exec "$@"