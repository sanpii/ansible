server {
    listen 80;
    server_name nicolas.joseph.pro;

    location ^~ /.well-known/acme-challenge {
        add_header Content-Type application/jose+json;
        root /tmp/letsencrypt/public_html/;
    }

    location / {
        return 301 https://$server_name$request_uri;
    }
}

server {
    listen 443 ssl;
    server_name nicolas.joseph.pro;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/nicolas.joseph.pro/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/nicolas.joseph.pro/privkey.pem;

    location / {
        return 302 $scheme://id.homecomputing.fr/nj;
    }
}
