#!/usr/bin/env bash

set -e

TAKESHIXX_DIR="/home/vagrant/takeshixx"
HEARTBLEEDER_DIR="/home/vagrant/heartbleeder"
export DEBIAN_FRONTEND=noninteractive


apt-get update
apt-get install -q -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" git
rm -f /home/vagrant/postinstall.sh


# Set up takeshixx script from https://gist.github.com/takeshixx/10107280
mkdir -p $TAKESHIXX_DIR
cp /vagrant/takeshixx.py /usr/local/bin/hb-test.py
chmod a+xr /usr/local/bin/hb-test.py

set +e

mkdir -p /usr/local/bin

# Install go
export GOPATH=$HEARTBLEEDER_DIR
grep -q GOLANG /home/vagrant/.profile
if [ $? -ne 0 ]; then
	echo 'export GOPATH=/home/vagrant/golang' >> /home/vagrant/.profile
	echo 'export PATH=$GOPATH/bin:$PATH' >> /home/vagrant/.profile
	echo 'export PATH=/usr/local/bin:$PATH' >> /home/vagrant/.profile
fi

which go > /dev/null
if [ $? -ne 0 ]; then
	mkdir -p /home/vagrant/golang
	cd /home/vagrant/golang
	wget https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz 2>&1
	tar xvzf godeb-amd64.tar.gz
	/home/vagrant/golang/godeb install
	rm /home/vagrant/golang/godeb-amd64.tar.gz
fi

chown -R vagrant:vagrant /home/vagrant/golang
su - vagrant -c "GOPATH=/home/vagrant/golang go get github.com/titanous/heartbleeder"

