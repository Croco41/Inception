#!/bin/bash

if [ ! -d /var/lib/mysql/wordpress ]; then

	#ouverture du shell mysql
	mysqld&

	#on attend la reponse du  module mysqld
	until mysqladmin ping; do
		sleep 1
	done

	echo "create database if not exists wordpress;" | mysql -u root
	echo "create user if not exists '$LOGIN' identified by '$PASSWORD';" | mysql -u root
	echo "grant usage on wordpress.* TO '$LOGIN'@'%' identified by '$PASSWORD';" | mysql -u root
	echo "grant all privileges on wordpress.* TO '$LOGIN'@'%' identified by '$PASSWORD';" | mysql -u root
	echo "flush privileges;" | mysql -u root
	echo "alter user 'root'@'localhost' identified by '$PASSWORD';" | mysql -u root
	
	#arret de mysqld = arret de mariadb
	killall mysqld
fi

# Exécution du script
#	HELP - https://stackoverflow.com/a/48096779
#	-> Exécute les commandes ci-dessus comme dans un shell, 
# en évitant les pid dédoublé (zombie)
#chaque requete de nginx ouvre un processus de recherche. il faut les fermer
#le dernier est ferme de base mais pas les intermediaires- >risque de zombie
exec "$@"