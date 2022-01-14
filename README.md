# Credly Take-home

### System Requirements
- git
- OS X Environment
    - [homebrew](https://brew.sh/)
    - [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io)
- Docker Environment
    - [docker](https://docker.com)

### Development Environment Setup

- **OS X**
    - install `yarn`
        - `brew install yarn`
    - install `postgres`
        - `brew install postgres`
    - start `postgres` via homebrew
        - `brew services start postgres`
    - install `rbenv`
        - `brew install rbenv`
    - install Ruby `v2.7.1`
        - `rbenv install 2.7.1`
    - clone project
        - `git clone git@github.com:youracclaim/credly-take-home.git`
    - `cd` into project directory
        - `cd /path/to/credly-take-home`
    - install `foreman`
        - `gem install -N foreman`
    - install bundled gems
        - `bundle install`
    - install yarn packages
        - `yarn install`
    - set up development database
        - `bundle exec rake db:setup`
- **Docker**
    - build and run containers
        - `docker-compose up --build`
    - set up database
        - `docker-compose run web rails db:setup`
    
    
### Running the server
- run `foreman start -f Procfile.dev`
- open `localhost:5000` in your browser

### Deploying to Heroku
- create a [Heroku](https://heroku.com) account if you don't already have one
- install Heroku CLI tools
    - `brew tap heroku/brew && brew install heroku`
- log into Heroku
    - `heroku login`
- create a new app
    - `heroku apps:create`
    - take note of app name, e.g. `pacific-fortress-65242`
- add Heroku remote repo for the app that was just created
    - `heroku git:remote -a pacific-fortress-65242`
- deploy your app
    - `git push heroku main`
    - ignore warnings
    - link to app will include app name, e.g. https://pacific-fortress-65242.herokuapp.com/
