#!/bin/bash
yum install -y httpd
systemctl start httpd
yum install -y unzip
curl -L -A "Mozilla/5.0" -O https://templatemo.com/download/templatemo_564_plot_listing
unzip templatemo_564_plot_listing -d /tmp/
mv /tmp/templatemo_564_plot_listing/* /var/www/html/

# try this at home again