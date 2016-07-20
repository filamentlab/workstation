IPADDR=$1
cat << EOF
<VirtualHost *:80>
        ServerAdmin notifications@filamentlab.com
        ServerName $IPADDR
        DocumentRoot /var/www
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
<VirtualHost *:80>
        ServerAdmin notifications@filamentlab.com
        ServerName workstation.dev
        ServerAlias www.workstation.dev
        DocumentRoot /var/www
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF