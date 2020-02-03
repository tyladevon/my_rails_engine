# README
### Rails Engine API

#### Setup
Clone @ https://github.com/tyladevon/my_rails_engine
Navigate into the my_rails_engine directory 
Run 'bundle' 
Run 'rake db:create', 'rake db:migrate' to create the databases
Run 'rake import' to import csv data into the databases
Run rspec to run the testing suite
In your terminal, run 'rails s' to initiate a local server
Open your browser and navigate to http://localhost:3000/api/v1/'*desired-endpoint' 


#### Data Resources
There are 6 resources of data

*Merchants
*Customers
*Items
*Invoices
*Invoice Items
*Transactions

Each resource has three types of endpoints: Record, Relationships and Business Intel.

The Record Endpoints include search queries such as 'single finders', 'multi-finders' and find 'random' resources. 

For example with our Merchants resource:
'/merchants' Returns a list of all merchants including their attributes and relationships.
'/merchants/:merchant_id' Returns a single Merchant by their id and lists the attributes and relationships for them.
'/merchants/random' Returns a list of the attributes and relationships for a random merchant. 
'/merchants/find?id=' this find query will return a single merchant, its attributes and relationships.
'/merchants/find_all?created_at=' this find_all query will return all merchants that match this query, their attributes and relationships.

The Relationship Endpoints include search queries such as returning Merchant's Items or a Merchant's Invoices. 

For example: 
'/merchant/:merchant_id/items' Returns a collection of items associated with that merchant
'/merchant/:merchant_id/invoices' Returns a collection of invoices associated with that merchant from their known orders.


Business Logic Endpoints include 6 query endpoints specific to this API to include:
For Merchants, there are 3 BI endpoints: 
Merchant's Most Revenue by a given quantity, '/merchants/most_revenue?quantity=x'
which returns the top number of merchants ranked by total revenue across successful transactions.
Merchants revenue by given date, '/merchants/revenue?date=x' which returns the total revenue for that date across all merchants
Merchant's Favorite Customer, '/merchants/:merchant_id/favorite_customer' which returns the customer who has conducted the most successful transactions.
