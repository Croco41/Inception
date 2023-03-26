FROM	debian:buster
RUN		apt-get -y update

RUN		apt-get install nginx -y

RUN		apt-get install vim -y

RUN		apt-get install openssl -y

#Installation de ma config pour Nginx
COPY	./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# Création du dossier de travail du Container
# WORKDIR /var/www/html/wordpress
# exactement de le meme chemin dans le container wordpress -
RUN		mkdir -p /var/www/html/wordpress

#utilisation de l'outils SSL afin de creer un certificat TSL/SSL
#openssl : Creation de connection SSL / "Create self-signed certificate and new private key from scratch"
#req: cree et traite principalement des demandes de certificats 
#x509 : on precise le type de certificat
#nodes: pour avoir notre clef privee sans mot de passe (on peut pas saisir de mots de passe pendant le lancement du container)
#out :ou on stocke le certificat
#keyout: ou on stocke la clef de notre SSL
#subj: permet de preremplir des infos pour le certificat
RUN openssl req -x509 -nodes -out /etc/ssl/certs/nginx.crt -keyout /etc/ssl/certs/nginx.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=E242/CN=cgranja.42.fr"

# Exposition du port 443 pour Internet -> docker-compose.yml
EXPOSE	443

#Lancement de Nginx
#	-g : Directive de configuration global
#	daemon off; : pas de virtualisation du nginx 
#		"virtualisation off" = Execution au 1er plan => arret automatique apres lancement si absent !
CMD		["/usr/sbin/nginx", "-g", "daemon off;"]