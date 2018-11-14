# Driftrock tech test

This is the thech test for the company Driftrocks, made on November 2018.

## Getting started

To run the app download the files in your machine, go to the 'driftrock_tech_test' repo on your terminal and type the following depending on the method you want to call:

ruby app.rb most_sold_item

ruby app.rb most_loyal_user

ruby app.rb total_spend 'email'

-replace 'email' for any of the user emails from the driftrock api.

## Design

I created the App class as an interface for the user. Through this class the user can interact with the program in order to ask information from the driftrock api.
The DataProcessor class, the logic part of the program, process the passed json in order to get the #most_founded_item (get the item that is more many times in the hash), the #most_loyal_user (get the user with the biggest number of purchases), and #get_total_spent (which returns the amount the user's email given has spent).
The DriftrockAPI class gets the data from the driftrock api.

## What can be improved

- Parsed the json data properly so the tests run as expected. At the moment three
of them are red. In DataProcessor class, if you change the keys (for accessing the hash) from current strings to symbols, all the tests are green.
- Dry the App class in order to have non repetition.
- Manage age cases, like when there are two or more items that have been sold the most. The same with most loyal user.
- Write at least one more test for each method.

## Technologies used

- Ruby
- Rspec
- WebMock
- HTTParty
- Json
- Simplecov
- Rubocop
