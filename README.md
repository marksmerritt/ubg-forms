

# United Building Group 

A safety form management system for United Building Group.

[View It Live](https://ubgforms.com/)


## Getting Started 

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. If you are on a **Windows machine**, these instructions do not apply and you should checkout [Cloud9](https://c9.io/login) or similar. 

### Prerequisites

Before setting up app specific requirements, please follow [this guide](http://installrails.com/) to install Rails on your system.

If you are not familiar with how to contribute to a project on GitHub, please follow [this guide](https://gist.github.com/MarcDiethelm/7303312)


### Installing

With the prerequisites out of the way, you'll need to install Postgres
```
$ brew update
$ brew install postgres
```

Once you have Postgres installed, start the DB server with...

```
$ mkdir -p ~/Library/LaunchAgents
$ ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
$ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

Next, make sure that you are in the projects root directory and run...

```
$ rails db:create && rails db:migrate
$ bundle install
```
### Rails Server
This app utilizes Redis for background jobs. Install Redis with

```
$ brew install redis
```

To avoid having to start Redis each time you startup the app run...

```
$ ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
```


To view the app locally you'll need to startup the Rails server and sidekiq. Create two terminal sessions in 
the project's root directory

In the first session...

```
$ rails s
```

In the second session...

```
$ sidekiq
```

Visit [localhost:3000](localhost:3000) in your browser.



