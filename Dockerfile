FROM michaelmichalski/graphitestatsd:3.11.6
COPY nginx.conf /etc/nginx/nginx.conf
COPY ssl-bundle.crt /etc/ssl/certs/nginx-selfsigned-bundle.crt
COPY server_key.pem /etc/ssl/private/nginx-selfsigned.key
COPY client.pem /etc/ssl/certs/client.crt