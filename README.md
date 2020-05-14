# Adding encryption to Graphite
To configure nginx for https add these to the server decleration.

```
listen 9443 ssl http2;
listen [::]:9443 ssl http2;
ssl_certificate /etc/ssl/certs/nginx-selfsigned-bundle.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
```

To avoid MITM and authentication between graphite and consumers add the following.
```
ssl_client_certificate /etc/ssl/certs/client.crt;
ssl_verify_client on;
```

## Step 1
Create ssl certificates from a root authority. And put 'graphitestatsd' as the CN, or what you decide to have as hostname. 

## Step 2
Bundle the server certificate and the root ca certificate into a certificate bundle.

cat server.pem rootCA.pem >> bundle.pem

## Step 3
Copy over the new nginx config and copy/mount the certificates into the image.

## Step 4
Add the client certificates into grafana.
![grafana configuration](https://github.com/michael-michalski/graphitestatsd-encrypted/raw/master/grafana-configuration.png "Logo Title Text 1")
