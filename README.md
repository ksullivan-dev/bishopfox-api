# README

## Ruby Version

2.4.4

## Getting started

First, check your ruby version

```
ruby -v
```

If its not 2.4.4, you can change it with RVM

```
\curl -sSL https://get.rvm.io | bash
```

(You might need to load RVM - replacing USER with your system)

```
/Users/USER/.rvm/bin/rvm
```

Then...

```
rvm requirements
rvm install 2.4.4
rvm use 2.4.4 --default
```

Next, check for and/or install bundler

```
bundler -v
gem install bundler
```

From the project directory

```
bundle
bin/rails db:migrate RAILS_ENV=development
```

And then run the rails server

```
rails server
```

And then you should be able to view the project at http://localhost:3000/
