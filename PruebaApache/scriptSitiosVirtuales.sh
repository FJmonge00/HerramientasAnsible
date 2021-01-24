#!/bin/bash
# Carpeta Web
sudo mkdir /var/www/pagina1
sudo echo "<h1>Bienvenido a su espacio Web</h1>" > /var/www/pagina1/index.html
sudo chown -R  www-data:www-data /var/www/pagina1/
#Sitio Virtual
sudo echo '<VirtualHost *:8081>' > /etc/apache2/sites-available/pagina1.conf
sudo echo 'ServerAdmin webmaster@localhost' >> /etc/apache2/sites-available/pagina1.conf
sudo echo 'DocumentRoot /var/www/pagina1' >> /etc/apache2/sites-available/pagina1.conf
sudo echo 'ErrorLog ${APACHE_LOG_DIR}/error_pagina1.log' >> /etc/apache2/sites-available/pagina1.conf
sudo echo 'CustomLog ${APACHE_LOG_DIR}/access_pagina1.log combined' >> /etc/apache2/sites-available/pagina1.conf
sudo echo '</VirtualHost>' >> /etc/apache2/sites-available/pagina1.conf
# Añadimos el puerto
sudo echo "Listen 8081" >> /etc/apache2/ports.conf
# Activamos sitio virtual
cd /etc/apache2/sites-available/
sudo a2ensite pagina1.conf
# Reiniciamos Servicios
sudo systemctl restart apache2 >> /dev/null
sudo systemctl status apache2 > EstadoServicio$(date +%d-%m-%Y).txt