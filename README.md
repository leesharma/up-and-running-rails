# Up and Running with Rails 4.2.1

## Script for Ubuntu

To install Ruby on Rails development environment you just need to copy and paste this line the Terminal and press Enter. Enjoy the text flying on the screen, it will take quite some time. Grabbing a refreshing drink before starting is encouraged.

    $ bash < <(curl -s  https://raw.githubusercontent.com/leesharma/up-and-running-rails/master/rails-install-ubuntu.sh)

## Next Steps

### Set up Heroku

1. Create a [Heroku account][heroku]

[heroku]: https://heroku.com/

2. Sign into Heroku toolbelt

```bash
$ heroku login
```

### Install offline documentation (recommended)

#### OS X
Dash is an API Documentation Browser and Code Snippet Manager. Install it [here][dash] and download the Ruby/Rails documentation and Rails Guides.

[dash]: https://kapeli.com/dash

#### Linux/Windows
Zeal is an offline documentation browser inspired by Dash, available for Linux and Windows. Install it [here][zeal] and download the Ruby/Rails documentation and Rails Guides.

[zeal]: http://zealdocs.org

### Set up a GitHub/BitBucket/GitLab account (recommended)

[GitHub][gh] is the most popular option for open-source projects, but [GitLab][gl] and 
[BitBucket][bb] both offer unlimited private repositories for personal work. 

[gh]: https://github.com
[gl]: https://gitlab.com
[bb]: https://bitbucket.com

Personally, I use a GitHub account for open-source work and a GitLab account to backup my
private repositories.

### Start a new project

    rails new *project_name* -d postgresql
    heroku create
    git remote origin master *git@github.com:username/project_name.git*

## Credit

Thank you to [railsgirls][railsgirls] for providing the script that is the basis of this project.

[railsgirls]: https://github.com/railsgirls





