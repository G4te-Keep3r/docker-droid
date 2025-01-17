#!/usr/bin/env bash

# Should look for bootstrap.dat.old, but for some reason that method wasn't working
# Or looking for downloaded/extracted files, but again was not having luck
if [ ! -f "/src/droid/bootstrap_downloaded.txt" ]; then
	wget https://static.coindroids.com/defcoin-bootstrap.dat.tgz
	tar -zxf defcoin-bootstrap.dat.tgz
	mv bootstrap.dat /src/droid/client/data/bootstrap.dat
	chown droid /src/droid/client/data/bootstrap.dat
	rm -rf defcoin-bootstrap.dat.tgz
	echo "bootstrap downloaded" > /src/droid/bootstrap_downloaded.txt
fi

su droid -c '/src/droid/client/bin/defcoind -conf=/src/droid/client/data/defcoin.conf'
echo 'Defcoin Node initiating'


echo 'Monitoring Log' > /src/droid/logs.txt

/bin/bash /src/droid/droid.sh &

tail -f /src/droid/logs.txt


