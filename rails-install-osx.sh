set -e

echo "Installs Homebrew for installing other software"
/usr/bin/ruby -e "$(/usr/bin/curl -fsSkL raw.github.com/mxcl/homebrew/go)"

echo "Installs Git"
brew install git

echo "Installs ImageMagick for image processing"
brew install imagemagick

echo "Updates Homebrew"
brew update

echo "Adds git lol: the other git log"
git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"

echo "Installs RVM (Ruby Version Manager) for handling Ruby installation"
brew install gpg
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -kL get.rvm.io | bash -s -- --version 1.26.11
source ~/.rvm/scripts/rvm

echo "Install Ruby"
rvm install 2.2.1
rvm use 2.2.1 --default

gem install bundler --no-rdoc --no-ri
gem install rails --no-rdoc --no-ri
gem install pg  --no-rdoc --no-ri -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.4/bin/pg_config

echo -e "\n- - - - - -\n"
echo -e "Now we are going to print some information to check that everything is done:\n"

echo -n "Should be brew 0.9.5 or higher:       brew "
brew -v
echo -n "Should be git 2.4.0 or higher:           "
git --version
echo -n "Should be sqlite 3.8.5 or higher: sqlite "
sqlite3 --version
echo -n "Should be rvm 1.26.11:          "
rvm --version | sed '/^.*$/N;s/\n//g' | cut -c 1-10
echo -n "Should be ruby 2.2.1:                "
ruby -v | cut -d " " -f 2
echo -n "Should be Rails 4.2.1 or higher:         "
rails -v
echo -e "\n- - - - - -\n"

echo "If the versions match, everything is installed correctly. If the versions
don't match or errors are shown, something went wrong with the automated process
and we will help you do the installation the manual way at the event.

Congrats!"
