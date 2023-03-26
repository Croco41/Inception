FROM	debian:buster

RUN	apt-get -y update

#creation d'un dossier et on va dedans, toutes les futures commandes se feront dedans
WORKDIR	/var/www/html/wordpress

#Telechargement et installation des modules wget(va chercher une adresse sur internet) & PHP(wordpress a besoin ca pour communique avec NGinx)  & mariadb utilitaires +mariadbclient??
RUN	apt-get -y install wget php7.3-fpm php7.3-common php-mysql mariadb-client

#Download et installation du Wordpress client
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#le wp-cli.phar devient executable
RUN	chmod +x wp-cli.phar
#on le renome pour l'utiliser apres dans le script de demarrage wordpress
RUN	cp wp-cli.phar /usr/local/bin/wp

#Exposition du port 9000 pour communiquer entre Wordpress nginx
#on utilise docker-compose.yml pour exposer le port 443 pour nginx et le reseau exterieur. et le port 9000 seulement dans le docker 
#wordpress pour pas problemes securites.
EXPOSE	9000

#Installation de notre config pour Wordpress
#on copie notre dossier (modifier selon nos besoins) dans le conf
COPY	./conf/wordpress.conf /etc/php/7.3/fpm/pool.d/www.conf
# pour que mon  scipt de lancement soit au meme niveau que le dossier wordpress
COPY	./tools /var/www/html
# on s'assure d'avoir les droits pour executer le script
RUN		chmod +x /var/www/html/wordpress_start.sh
	
#lancement du script
#ENTRYPOINT: Commande executee uniquement au lancement du container isole
#EN utilisant docker-compose on execute entrypoint + CMD
ENTRYPOINT	["bash", "/var/www/html/wordpress_start.sh"]

#Lancement du module PHP pour Wordpress
# --nodaemonize / -F ->force l'executation au 1er plan pour pas qu'il s'arrete
CMD		["/usr/sbin/php-fpm7.3", "--nodaemonize"]

