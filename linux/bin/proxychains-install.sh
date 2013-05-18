git clone https://github.com/haad/proxychains.git | tar xz --strip-components=1

cd proxychains

./configure -PREFIX=/usr/local

make 
make test
sudo make install
make clean

sudo cp src/proxychains.conf /usr/local/etc/proxychains.conf
sudo vim /usr/local/etc/proxychains.conf

cd ..
rm -rf proxychains
