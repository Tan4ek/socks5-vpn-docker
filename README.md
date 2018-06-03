# socks5-vpn
This is just a combination of [dante](https://github.com/vimagick/dockerfiles/tree/master/dante) and [dockvpn](https://github.com/umputun/dockvpn)
Docker compose socks5 and vpn server

# Configuration
In a file 'dante-entrypoint.sh' you can find username and password for SOCKS5 (in an example username is 'suck-rkn', password is 'telegram')
'sockd.conf' have all configuration for dante-server (SOCKS5)
There are default ports in a file 'docker-compose' - 1088/tcp, 1194/udp, 443/tcp, 8088/tcp which must be opened

# How to run
* First of all, you need to open ports which defined in a file 'docker-compose'
* Install docker, docker-compose
* git clone this repository
* ```docker-compose up -d```
* get openvpn configuration file ```wget  https://localhost:8088/ --no-check-certificate --output-document key.ovpn```

For checking socks5 ```curl -x socks5h://suck-rkn:telegram@127.0.0.1:1088 https://www.youtube.com```

# Hiding multiply port for one
Full information: [sslh habr guide](https://habr.com/post/412779/)

```
sudo apt-get install --no-install-recommends sslh
```
choose the second variant

```
sudo sslh-select -f -p 127.0.0.1:443 --openvpn 127.0.0.1:8443 --anyprot 127.0.0.1:9443 --pidfile /var/run/sslh/sslh.pid
```

Change ```/etc/default/sslh```:
RUN=yes
DAEMON_OPTS= copy all arguments from previous command 'sudo sslh-select'
