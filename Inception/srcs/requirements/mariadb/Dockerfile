FROM	debian:buster

RUN		apt-get -y update

RUN		apt-get -y install mariadb-server

#exposition du port 3306 pour la communication avec wordpress (9000)
EXPOSE	3306

#installation de ma config pour MariaDB
# remplacement du fichier de base de config de mariaDB : 50-server.cnf
COPY	./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./tools/mariadb_start.sh /var/www/start_db.sh

RUN		mkdir -p /run/mysqld
#pour changer le propriétaire et le groupe d’un répertoire en récursif
#chown [OPTIONS] UTILISATEUR[:GROUPE] REPERTOIRE
RUN		chown -R mysql:root /run/mysqld
RUN		chown -R mysql:mysql /var/lib/mysql

#entrypoint ne fonctionne qu'avec mariadb tout seul ,en dehors du reseau
# == démarrage isolé du container
ENTRYPOINT ["bash", "var/www/start_db.sh"]

#sinon dans le docker compose :
CMD		["mysqld"]