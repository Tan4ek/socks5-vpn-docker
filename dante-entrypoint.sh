if [ $(grep -c "$SOCKS_USERNAME" /etc/passwd) -eq 0 ]; then
	echo "Creating user: $SOCKS_USERNAME"

	useradd "$SOCKS_USERNAME"
	echo "$SOCKS_USERNAME:$SOCKS_PASSWORD" | chpasswd
fi

sockd -f $CFGFILE -p $PIDFILE -N $WORKERS
