#! /bin/bash

#wget https://dist.torproject.org/tor-0.2.8.11.tar.gz
tar -xvf tor-0.2.8.11.tar.gz
cd tor-0.2.8.11
./configure
make
sudo make install
tor			#starts proxy on 127.0.0.1 and port 9050
