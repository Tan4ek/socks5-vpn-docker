# socks5-vpn
This is just a combination of [dante](https://github.com/vimagick/dockerfiles/tree/master/dante) and [dockvpn](https://github.com/umputun/dockvpn)
Docker compose socks5 and vpn server

# Configuration
In a file 'dante-entrypoint.sh' you can find username and password for SOCKS5 (in an example username is 'suck-rkn', password is 'telegram')
'sockd.conf' have all configuration for dante-server (SOCKS5)
There are default ports in a file 'docker-compose' - 1088/tcp, 1194/udp, 443/tcp for OpenVPN, 8088/tcp, 9443/tcp/udp (actualy I don't know udp or tcp and I opened them all) for MTProto proxy - which must be opened

# How to run
* First of all, you need to open ports which defined in a file 'docker-compose'
* Install docker, docker-compose
* git clone this repository
* ```docker-compose up -d```
* get openvpn configuration file ```wget  https://localhost:8088/ --no-check-certificate --output-document key.ovpn```

For checking socks5 ```curl -x socks5h://suck-rkn:telegram@127.0.0.1:1088 https://www.youtube.com```


# mtproxy (MTProto Proxy)
For geting a mtproxy secret keys read logs from ```docker-compose logs mtproxy```
and find a line like ```Secret X: YYY.....``` YYY is your key for a mtproxy 
