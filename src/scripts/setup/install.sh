#!/bin/bash

: <<welcome-message
~ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ~

                                            __                
      ___  _______             ______ _____/  |_ __ ________  
      \  \/ /     \   ______  /  ___// __ \   __\  |  \____ \ 
       \   /  Y Y  \ /_____/  \___ \\  ___/|  | |  |  /  |_> >
        \_/|__|_|  /         /____  >\___  >__| |____/|   __/ 
                 \/               \/     \/           |__|    
               

~ .................................................................. ~

                ::    what    ::    vagrant setup   ::
                ::    which   ::    0.1             ::
                ::    when    ::    2013/07/24      ::
                ::    who     ::    me              ::                                             
~ .................................................................. ~                

Notes:
Target OS is Ubuntu 10.0.4 http://files.vagrantup.com/lucid32.box.

Downloads:
http://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/debian-live-6.0.3-amd64-standard.iso
https://www.virtualbox.org/wiki/Downloads/ 

~ /////////////////////////////////////////////////////////////////////////////////////// ~
welcome-message

# ----------------------------------------------------------------------------------- #
# - initialize
# ----------------------------------------------------------------------------------- #

# clear console
clear 

# disable cmd echo
set +v 

# config
VAGRANT_USER="vagrant"
VAGRANT_PASS="vagrant"
SHELLRC=~/.shellrc

# initialize shell configuration
echo "" > $SHELLRC

# update repos
sudo apt-get update

# upgrade installed
sudo apt-get upgrade

# upgrade whole release
do-release-upgrade

# update repos
sudo apt-get update

# install basics - p.I
sudo apt-get -y install wget dkms git-core ant python-software-properties g++ curl unzip apache2 --force-yes

# install zsh (exit and reconnect or run /bin/zsh)
sudo apt-get install -y zsh
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
chsh -s `which zsh`

# GITHUB user/pass alternative
# machine github.com
# login <your_github_login>
# password <your_github_password>

# install sshpass
wget http://netcologne.dl.sourceforge.net/project/sshpass/sshpass/1.05/sshpass-1.05.tar.gz
./configure
make
sudo make install

# install php5 / extensions
sudo ppa-purge ppa:ondrej/php5
sudo apt-get install -y python-software-properties
sudo add-apt-repository ppa:ondrej/php5
sudo apt-get update
sudo apt-get install -y php5 libapache2-mod-php5

# update repos
sudo apt-get update

# install node / npm 
git clone https://github.com/joyent/node.git
cd node
git checkout v0.8.6
./configure
make
sudo make install

# set node path  
echo "" >> $SHELLRC
echo "# set node path" >> $SHELLRC
echo "export NODE_PATH=\"/usr/local/lib/node\"" >> $SHELLRC
export NODE_PATH="/usr/local/lib/node"

# reload configuration
. $SHELLRC

# boohoo-bootstrap extract
sudo apt-get -y install openssh-server xvfb libqt4-dev libqt4-webkit bison flex build-essential g++ x11-session-utils x11-xkb-utils x11-xfs-utils x11-xserver-utils x11proto-fonts-dev xfonts-100dpi-transcoded xfonts-75dpi-transcoded xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-mathml x-ttcidfont-conf

# solved by installing deps...
sudo apt-get install libxml2-dev ttf-mscorefonts-installer 

# install npm global modules
npm install -g n grunt volo handlebars underscore phantomjs contextify o3-xml libxml

# customize w/phantomjs
git clone git://github.com/ariya/phantomjs.git && cd phantomjs
git checkout 1.4.1

# build
qmake-qt4 && make

# expose
ln -s bin/phantomjs /usr/bin/phantomjs

# go home
cd ~

# customize w/casperjs
git clone git://github.com/n1k0/casperjs.git && cd casperjs
git checkout tags/0.6.4

# expose
$("ln -sf `pwd`/bin/casperjs /usr/bin/casperjs")
echo "ln -sf `pwd`/bin/casperjs /usr/bin/casperjs"
sudo ln -sf /home/vagrant/casperjs/bin/casperjs /usr/bin/casperjs

# go home
cd ~

# java *
sudo apt-get install openjdk-7-jdk maven3

# 
echo "MAVEN3 MAVEN3 MAVEN3 MAVEN3 MAVEN3 MAVEN3 MAVEN3 MAVEN3 MAVEN3"

# workspace for oak *
mkdir -p development/oak && cd $_;

# fetch jackrabbit-oak
git clone https://github.com/apache/jackrabbit-oak && cd jackrabbit-oak
mvn clean install

# go home
cd ~

# to check: is this needed for real?
Xvfb :0 -screen 0 1024x768x24 &

echo "now type smth like:"
echo "cd ~/phantomjs/examples"
echo "DISPLAY=:0 phantomjs arguments.js The quick brown fox"
echo "... or ..."
echo "cd ~/casperjs/samples"
echo "DISPLAY=:0 casperjs logcolor.js"

# install basics - p.II - ruby
sudo aptitude -y install ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb1.8 libreadline-ruby1.8 libruby1.8 libopenssl-ruby && sudo ln -s /usr/bin/ruby1.8 /usr/bin/ruby && sudo ln -s /usr/bin/ri1.8 /usr/bin/ri && sudo ln -s /usr/bin/rdoc1.8 /usr/bin/rdoc && sudo ln -s /usr/bin/irb1.8 /usr/bin/irb

# install basics - p.III - ruby gems
cd ~ && sudo wget http://production.cf.rubygems.org/rubygems/rubygems-1.3.7.tgz && sudo tar xvzf rubygems-1.3.7.tgz && cd rubygems-1.3.7 && sudo ruby setup.rb && sudo ln -s /usr/bin/gem1.8 /usr/bin/gem && cd - && sudo gem update --system

# fetch rvm
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
echo "" >> $SHELLRC
echo "# register RVM" >> $SHELLRC
echo "export PATH=\$PATH:/usr/local/rvm/bin" >> $SHELLRC

# reload configuration
. $SHELLRC

# update configuration
echo '[[ -s "/home/`whoami`/.rvm/scripts/rvm" ]] && source "/home/`whoami`/.rvm/scripts/rvm"' >> $SHELLRC

# install ruby 1.9.2 through rvm
sudo rvm install ruby-1.9.3
sudo rvm use --default ruby-1.9.3

# cloud9 IDE
sudo npm install -g sm
npm install c9
echo `$HOME/.c9/installs/c9local/bin/c9` >> $SHELLRC

# adjust access rights
sudo chown -R vagrant:vagrant /usr/local/lib/node /usr/local/lib/node_modules ~/.sourcemint ~/.npm ~/tmp

# fix libxml@0.0.7 / wafadmin/Scripting build error by symlinking wafadmin to "node system directory"
cd /usr/local/lib/node
ln -s /usr/local/n/versions/0.8.6/wafadmin

# back to square one
cd -  
sm install

# install utilities
# shinst, tunnelx
# configuration / settings for automation helpers 

# append shell to configuration (TODO: think, solve)
cat $SHELLRC >> ~/.zshrc
cat $SHELLRC >> ~/.bashrc
cat $SHELLRC >> ~/.bash_profile