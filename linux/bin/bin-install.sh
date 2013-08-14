sudo chown $(whoami) /usr/local/bin
sudo chown $(whoami) /usr/local/lib

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew install -g dos2unix
brew link dos2unix

brew install -g mysql
brew link mysql

brew install ctags
brew link ctags

sudo port install watch
sudo port install tree
