set -e

echo "Checking for Homebrew, the missing package manager for OS X <http://brew.sh/>"
command -v brew >/dev/null 2>&1 || {
  echo "Homebrew not found. Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

echo "Installing Git"
brew install git

echo "Installing ImageMagick for image processing"
brew install imagemagick

echo "Updating Homebrew"
brew update

echo "Adding git lol: the other git log"
git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"

echo "Installing RVM (Ruby Version Manager) for handling Ruby installation"
command -v rvm >/dev/null 2>&1 || {
  brew install gpg
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -kL get.rvm.io | bash -s -- --version 1.26.11
  source ~/.rvm/scripts/rvm
}
rvm get stable

echo "Installing Ruby"
rvm install 2.2.2
rvm use 2.2.2 --default

echo "Installing Redis: in-memory data store for ActionCable"
brew install redis

gem install bundler --no-rdoc --no-ri
gem install rails --no-rdoc --no-ri
gem install pg  --no-rdoc --no-ri -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.4/bin/pg_config

echo -e "\n- - - - - -\n"
echo -e "Now we are going to print some information to check that everything is done:\n"

echo -n "Should be brew 0.9.5 or higher:       "
echo -n "brew "
brew -v | head -n1 | cut -d " " -f 2
echo -n "Should be git 2.9.0 or higher:        "
git --version | cut -d " " -f 1,3
echo -n "Should be sqlite 3.8.5 or higher:     "
echo -n "sqlite3 "
sqlite3 --version | cut -d " " -f 1
echo -n "Should be rvm 1.27.0 or higher:       "
rvm --version | cut -d " " -f 1-2
echo -n "Should be ruby 2.2.2:                 "
ruby -v | cut -d " " -f 1-2
echo -n "Should be rails 5.0.0 or higher:      "
echo -n "rails "
rails -v | cut -d " " -f 2
echo -n "Should be redis 3.2.1 or higher:      "
echo -n 'redis-server '
redis-server --version | tr "=" " " | tr -s " " | cut -d " " -f 4
echo -e "\n- - - - - -\n"

echo "If the versions match, everything is installed correctly. If the versions
don't match or errors are shown, something went wrong with the automated process
and we will help you do the installation the manual way at the event.

Congrats!"
