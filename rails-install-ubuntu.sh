#!/bin/bash

set -e

echo "Adding PPA for up-to-date Node.js runtime. Give your password when asked."
sudo add-apt-repository ppa:chris-lea/node.js

echo "Updates packages. Asks for your password."
sudo apt-get update -y

echo "Installs packages. Give your password when asked."
sudo apt-get install build-essential git-core curl openssl libssl-dev libcurl4-openssl-dev zlib1g zlib1g-dev libreadline libreadline-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev libsqlite3-0 sqlite3 libxml2-dev libxslt1-dev python-software-properties libffi-dev libgdm-dev libncurses5-dev automake autoconf libtool bison postgresql postgresql-contrib libpq-dev pgadmin3 libc6-dev nodejs -y

echo "Installs ImageMagick for image processing"
sudo apt-get install imagemagick --fix-missing -y

echo "Installs RVM (Ruby Version Manager) for handling Ruby installation"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

echo "Installs Ruby"
rvm install 2.2.2
rvm use 2.2.2 --default

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
gem install rails

echo "Installs Heroku Toolbelt. Asks for your password several times."
echo "Downloading Heroku tarball."
cd /usr/local/ && sudo wget https://github.com/heroku/heroku/archive/v3.37.3.tar.gz
echo "Unzipping and removing tarball."
sudo tar -xf v3.37.3.tar.gz && sudo rm -rf v3.37.3.tar.gz
echo "Renaming 'heroku-3.37.3' folder to 'heroku'"
sudo mv /usr/local/heroku-3.37.3 /usr/local/heroku
echo "Installing the gems that Heroku depends on"
cd /usr/local/heroku/ && bundle install
echo "Symlinking heroku binary into /usr/bin to be accessable."
sudo ln -s /usr/local/heroku/bin/heroku /usr/bin/heroku

echo "Adding heroku command to .bashrc file."
echo "alias heroku=\"/usr/bin/heroku\"" >> ~/.bashrc

echo "Adds git lol: the other git log"
git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"

echo "Installs PostgreSQL gem"
gem install pg

echo -e "\n- - - - - -\n"
echo -e "Now we are going to print some information to check that everything is done:\n"

echo -n "Should be sqlite 3.8.2 or higher: sqlite "
sqlite3 --version
echo -n "Should be rvm 1.26.11 or higher:         "
rvm --version | sed '/^.*$/N;s/\n//g' | cut -c 1-10
echo -n "Should be ruby 2.2.2:                "
ruby -v | cut -d " " -f 2
echo -n "Should be Rails 4.2.1 or higher:         "
rails -v
echo -e "\n- - - - - -\n"

echo "If the versions match, everything is installed correctly. If the versions 
don't match or errors are shown, something went wrong with the automated process 
and we will help you do the installation the manual way at the event.

Congrats!
                                                                                 
Make sure that all works well by running the application generator command:         
    $ rails new blog -d postgres                                                      
                                                                                 
If you encounter the message:                                                    
    The program 'rails' is currently not installed.                              
                                                                                 
It is just a hiccup with the shell, solutions:                                   
    $ source ~/.rvm/scripts/rvm                                                  
    Allow login shell, example http://rvm.io/integration/gnome-terminal/

This installer set up an alternative git log. Try it out in a repo by typing:
    $ git lol"
