server {
    listen 80;
    server_name joseph.pro;

    location ^~ /.well-known/acme-challenge {
        add_header Content-Type application/jose+json;
        root /tmp/letsencrypt/public_html/;
    }

    location / {
        return 301 https://$server_name$request_uri;
    }
}

server {
    listen 443 ssl http2;
    server_name joseph.pro;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/joseph.pro/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/joseph.pro/privkey.pem;

    location ^~ /.well-known/openpgpkey/hu {
        alias /etc/app/id/src/config/files/wkd;
    }

    location / {
        return 204;
    }
}

server {
    listen 443 ssl http2;
    server_name www.joseph.pro;

    ssl on;
    ssl_certificate /etc/letsencrypt/live/joseph.pro/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/joseph.pro/privkey.pem;

    rewrite ^(.*)$ https://joseph.pro$1 permanent;
}
