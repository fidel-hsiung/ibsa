# Goods Storage Management - Coding Challenge

Hours used: 13-14 hours

This is a Rails application that management the goods storage for a facility.

It has applied docker and docker-compose to enable easy development envrionment setup, make sure u have docker installed on your machince, then run `docker-compose up` at the application root. Keep this terminal window open, then run `docker-compose exec app rails db:create db:migrate db:seed` at a new terminal window within application root. After db setup, you can visit http://localhost:3000 to visit the application, login details as below:

* email:     fidelhsiung@gmail.com
* password:  12345678

For tests, you have to modify the environment in docker-compose.yml, change the services/app/environment/RAILS_ENV to `test` (as following), and re-run `docker-compose up`. Then run `docker-compose exec app rspec` at a new terminal window within application root.
```
  app:
    build:
      context: .
      dockerfile: Dockerfile
    depends_on:
      - database
    ports:
      - "3000:3000"
    volumes:
      - .:/ibsa
      - gem_cache:/usr/local/bundle/gems
    environment:
      RAILS_ENV: test
```

System configurations:

* Ruby version 2.5.0

* Rails version 5.2.4.2

* Database PG

Features:

* User can login to management the goods storage. (achieved by gem bcrypt and rails session)

* User CRUD

* Good CRUD

* Goods Filter in Goods index page

* Good Bulk Upload via csv file


Possible Improvements:

* Style

* Specific validations on Good type, name, source, destination, consignment_id, so that the application can be more intelligent.

* Index Table Sorting feature based on table columns

* Different permissions/roles for Different users.

* Use ElasticSearch to boost search time.

* Log system to record users log history.
