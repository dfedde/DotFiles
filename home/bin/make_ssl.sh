$name=$1
cd /etc/nginx/ssl
sudo openssl genrsa -des3 -out ${name}.key 1024
sudo openssl req -new -key ${name}.key -out server.csr
sudo cp ${name}.key ${name}.key.org
sudo openssl rsa -in ${name}.key.org -out ${name}.key
sudo openssl x509 -req -days 365 -in ${name}.csr -signkey ${name}.key -out ${name}.crt

