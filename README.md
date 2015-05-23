# Up and Running with Rails 4.2.1

## First Steps

1. Install PostgreSQL ([postgres.app](http://postgresapp.com))
2. Install [pgAdmin3](http://www.postgresql.org/ftp/pgadmin3/release/)

## Script for OS X

To install Ruby on Rails development environment you just need to copy and paste this line the Terminal and press Enter. Enjoy the text flying on the screen, it will take quite some time. Grabbing a refreshing drink before starting is encouraged.

    $ bash < <(curl -s  https://raw.github.com/railsgirls/installation-scripts/osx/rails-install-osx.sh)

## Next Steps

### Set up Heroku

- Create a [Heroku account][heroku]

[heroku]: https://heroku.com/

- Install the [Heroku toolbelt][toolbelt]

[toolbelt]: https://toolbelt.heroku.com

- Sign into Heroku toolbelt

      $ heroku login

### Install Dash documentation

Dash is an API Documentation Browser and Code Snippet Manager for OS X. Install it [here][dash].

[dash]: https://kapeli.com/dash

### Set up a GitHub/BitBucket/GitLab account

Github is the most popular option for open-source projects, but Gitlab and Bitbucket both 
offer unlimited private repositories for personal work. 

Personally, I use a GitHub account for open-source work and a GitLab account to backup my
private repositories.

### Start a new project

    rails new *project_name* -d postgres
    heroku create
    git remote add origin *git@github.com:username/project_name.git*

## Credit

Thank you to @railsgirls for providing the script that is the basis of this project.





