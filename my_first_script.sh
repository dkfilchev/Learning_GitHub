#!/bin/bash

#sudo -i


#How electrum does pgp verification of the files:

#Install dependencies:	sudo apt-get install python3-pyqt5
#Download package:	wget https://download.electrum.org/3.3.8/Electrum-3.3.8.tar.gz
#Verify signature:	wget https://download.electrum.org/3.3.8/Electrum-3.3.8.tar.gz.asc
#gpg --verify Electrum-3.3.8.tar.gz.asc
#Run without installing:	tar -xvf Electrum-3.3.8.tar.gz
#python3 Electrum-3.3.8/run_electrum
#Install with PIP:	sudo apt-get install python3-setuptools python3-pip
#python3 -m pip install --user Electrum-3.3.8.tar.gz[fast]

#I need to learn how to compare the hash of the file.
#Another thing that I saw in a medium article and seems usefull:

#echo '12edc0df75bf9abd7f82f821795bcee50f42cb2e5f76a6a281b85732798364ef  db-4.8.30.NC.tar.gz' | sha256sum -c




#Downloading Bitcoin Core

curl -sSL https://bitcoin.org/bin/bitcoin-core-0.19.1/bitcoin-0.19.1-x86_64-linux-gnu.tar.gz

#curl -sSL https://bitcoin.org/bin/bitcoin-core-0.19.1/SHA256SUMS.asc
#curl -sSL https://bitcoin.org/laanwj-releases.asc
#gpg --import laanwj-releases.asc
#gpg --verify SHA256SUMS.asc

#Something something ... Need to figure this out later as well.
#&& cat SHA256SUMS.asc | grep bitcoin-0.19.1-x86_64-linux-gnu.tar.gz | echo | sha256sum -c


&& tar -xzf bitcoin-0.19.1-x86_64-linux-gnu.tar.gz \

&& cd ~/bitcoin-0.19.1/bin/
&& chmod +x bitcoind bitcoin-cli \
&& mv bitcoind bitcoin-cli /bin \

&& mkdir ~/.bitcoin \
&& touch bitcoin.conf \

#Quick sync version
&& echo \

'
#upnp=1
daemon=1
#txindex=1
dbcache=2048
disablewallet=1
#uacomment=

#proxy=127.0.0.1:9050
#bind=127.0.0.1

#onlynet=onion
#dnsseed=0
#dns=0

#addnode=nkf5e6b7pl4jfd4a.onion
#addnode=yu7sezmixhmyljn4.onion
'

>> bitcoin.conf \

&& bitcoind \
&& watch tail ~/.bitcoin/debug.log \

#Install Tor

&& apt update \
&& apt install tor -y \
&& service tor restart \

#Ensure that the following lines are (anywhere) in the Tor configuration file — /usr/share/tor/tor-service-defaults-torrc:

&& tee -a \

'
ControlPort 9051
CookieAuthentication 1
CookieAuthFileGroupReadable 1
'

#To view the default settings, use the command:
#less /usr/share/tor/tor-service-defaults-torrc'