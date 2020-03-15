# Shortener api

Demo api for resolve short urls to long urls 

## Instalation

Install ruby 2.7.0 using rvm

```rvm use ruby-2.7.0```


Then install all gems

```
bundle install
```

Craate db and run migrations

```
rake db:create
rake db:migrate
```

Seed data

```
rake db:seed
```

## Run

Start rails server


```
rails s
```
