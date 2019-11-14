# README

* Prerequisites
The setups steps expect following tools installed on the system.

ruby '2.6.1'
gem 'rails', '~> 6.0.1'

* Database initialization
Run the following commands to create and setup the database. Some seed data is already provided.

rails db:migrate 
rails db:seed

* Start the Rails server
You can start the rails server using the command given below.

rails s

And now you can visit the site with the URL http://localhost:3000
