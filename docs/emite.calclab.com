
<VirtualHost *:80>
    ServerName emite.calclab.com


    DocumentRoot /home/deploy/emite-demo/current/public

    RewriteEngine on

    RewriteRule ^/$ /cache/index.html [QSA]
    RewriteRule ^([^.]+)$ /cache/$1.html [QSA]
    RewriteRule http-bind/ http://emite.calclab.com:5280/http-bind/ [P]


    <Directory /home/deploy/emite-demo/current/public/>
        Options FollowSymLinks
        Allow from all
        AllowOverride None
        Order allow,deny
    </Directory>
</VirtualHost>

