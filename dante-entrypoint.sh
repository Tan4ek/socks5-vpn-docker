if [ $(grep -c 'suck-rkn' /etc/passwd) -eq 0 ]; then
	echo "Creating user: suck-rkn"

	useradd suck-rkn
	echo 'suck-rkn:telegram' | chpasswd
fi

sockd -f $CFGFILE -p $PIDFILE -N $WORKERS
