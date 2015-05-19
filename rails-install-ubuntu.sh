#!/bin/bash

set -e

echo "Updates packages. Asks for your password."
sudo apt-get update -y

echo "Installs packages. Give your password when asked."
sudo apt-get install build-essential bison openssl libreadline6 libreadline6-dev curl gpg2 git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 postgresql postgresql-contrib libpq-dev pgadmin3 libxml2-dev libxslt-dev autoconf libc6-dev nodejs -y

echo "Installs ImageMagick for image processing"
sudo apt-get install imagemagick --fix-missing -y

echo "Installs RVM (Ruby Version Manager) for handling Ruby installation"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s -- --version 1.26.11
source ~/.rvm/scripts/rvm

echo "Installs Ruby"
rvm install 2.2.1
rvm use 2.2.1 --default

gem install bundler --no-rdoc --no-ri
gem install rails --no-rdoc --no-ri

echo "Installs Heroku Toolbelt. Asks for your password."
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo "Adds git lol: the other git log"
git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"

echo "Installs PostgreSQL gem"
gem install pg --no-rdoc --no-ri

echo -e "\n- - - - - -\n"
echo -e "Now we are going to print some information to check that everything is done:\n"

# brew in ubuntu?
# echo -n "Should be brew 0.8 or higher:       brew "
# brew -v

echo -n "Should be sqlite 3.8.2 or higher: sqlite "
sqlite3 --version
echo -n "Should be rvm 1.26.11:          "
rvm --version | sed '/^.*$/N;s/\n//g' | cut -c 1-10
echo -n "Should be ruby 2.2.1:                "
ruby -v | cut -d " " -f 2
echo -n "Should be Rails 4.2.0 or higher:         "
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

This installer set up an alternative git log. Try it out by typing:
    $ git lol

To set up Heroku, make an account at https://heroku.com/ and then run the following
command (enter credentials when prompted):
    $ heroku login"
