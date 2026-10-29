# socks5-vpn
This is just a combination of [dante](https://github.com/vimagick/dockerfiles/tree/master/dante) and [dockvpn](https://github.com/umputun/dockvpn)
Docker compose socks5 and vpn server

# Configuration
There are default ports in a file 'docker-compose' - 1088/tcp, 1194/udp, 443/tcp for OpenVPN, 8088/tcp, 9443/tcp/udp (actualy I don't know udp or tcp and I opened them all) for MTProto proxy - which must be opened

# How to run
* First of all, you need to open ports which defined in a file 'docker-compose'
* Install docker, docker-compose
* git clone this repository
* for configuration openvpn follow [this](https://github.com/kylemanna/docker-openvpn/blob/master/docs/docker-compose.md) instraction
* Export your own `SOCKS_USERNAME` and `SOCKS_PASSWORD` in the deployment shell.
  Compose refuses to start if either value is empty. Keep the password outside Git.
* ```docker-compose up -d```

Check SOCKS5 with `curl --proxy socks5h://127.0.0.1:1088 --proxy-user "$SOCKS_USERNAME" https://www.youtube.com`;
curl prompts for the password.

# socks proxy
Set `SOCKS_USERNAME` and `SOCKS_PASSWORD` before starting the SOCKS5 proxy.
If you previously deployed the public example credentials, choose new credentials
and recreate only the `dante` container with `docker compose up -d --force-recreate dante`.
Changing the environment of an existing container does not update its Unix password.
`sockd.conf` have all configuration for dante-server (SOCKS5)


# mtproxy (MTProto Proxy)
You should generate some random 32 hex strings ([for example here](https://www.browserling.com/tools/random-hex)) and define them in [config_mtproxy_server.py](config_mtproxy_server.py#L4).
After docker container up you could read secret keys from ```docker-compose logs mtproxy```
and find a line like ```tg: YYY.....``` YYY is your key for a mtproxy
