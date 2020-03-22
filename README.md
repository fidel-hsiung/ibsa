# Goods Storage Management - Coding Challenge

Hours used: 13-14 hours

This is a Rails application that management the goods storage for a facility. It has applied docker and docker-compose to enable easy development envrionment setup, make sure u have docker installed on your machince, then run `docker-compose up` at the application root. Keep this terminal window open, then run `docker-compose exec app rails db:create db:migrate db:seed` at a new terminal window within application root. However, for tests, you have to configure the envrionment on your local machine.

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