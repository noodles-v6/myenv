#!/bin/bash 
#
# <env> linux & mac os
##

mkdir tmp

cd tmp

cp ../../src/libevent-2.0.19-stable.tar.gz .
cp ../../src/tmux-1.6.tar.gz .

tar zxvf libevent-2.0.19-stable.tar.gz

cd libevent-2.0.19-stable

./configure
make && sudo make install 

cd ..

tar zxvf tmux-1.6.tar.gz 

cd tmux-1.6

./configure
make && sudo make install

cd ../.. 
rm -rf tmp

echo 
echo "set the tmux path on the current usr manully"
