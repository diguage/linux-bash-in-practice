#!/usr/bin/env bash
#
#

cd ~/
mkdir .localhost-ssl

sudo openssl genrsa -out ~/.localhost-ssl/localhost.key 2048
sudo openssl req -new -x509 -key ~/.localhost-ssl/localhost.key -out ~/.localhost-ssl/localhost.crt -days 3650 -subj /CN=localhost
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ~/.localhost-ssl/localhost.crt

npm install -g http-server
echo " 
function https() {
  http-server --ssl --cert ~/.localhost-ssl/localhost.crt --key ~/.localhost-ssl/localhost.key
}
" >> ~/.zshrc
source ~/.zshrc

echo "You're ready to use https on localhost 💅"
echo "Navigate to a project directory and run:"
echo ""
echo "https"

https://really-simple-ssl.com/knowledge-base/how-to-install-an-ssl-certificate-on-mamp/

https://github.com/lwsjs/local-web-server

openssl genrsa -des3 -out ./rootCA.key 2048
openssl req -x509 -new -nodes -key ./rootCA.key -sha256 -days 1024 -out ./rootCA.pem


$ cat server.csr.cnf
[req]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn

[dn]
C=US
ST=New York
L=Rochester
O=End Point
OU=Testing Domain
emailAddress=leejun@gmail.com-1
CN = localhost


openssl req -new -sha256 -nodes -out server.csr -newkey rsa:2048 -keyout server.key -config <( cat server.csr.cnf )

$ cat v3.ext
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = localhost

openssl x509 -req -in server.csr -CA ./rootCA.pem -CAkey ./rootCA.key -CAcreateserial -out server.crt -days 500 -sha256 -extfile v3.ext

