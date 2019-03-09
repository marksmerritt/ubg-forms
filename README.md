


# United Masonry

A website redesign and safety management system for United Masonry Inc.

[View It Live](https://unitedmasonry.herokuapp.com/)

## Contributing

This project is not seeking external contributors.

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

If you run into errors after running bundler, make sure to update your dependencies...

```
$ bundle update && bundle install
```


### Rails Server
To view the app locally you'll need to startup the Rails server and visit localhost:3000 in your browser

```
$ rails s
```


## MIT License

Copyright (c) 2019 Mark Merritt

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


