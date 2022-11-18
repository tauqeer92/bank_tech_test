# Bank Tech Test

 # Product Description

I have created a Banking program in Ruby which you can interact with in IRB. It allows you to make transactions so you can deposit and withdraw money. You can also print a statement which allows you to see a list of transactions.

When printing the statement, it will show a list of transactions with the most recent first and oldest last.

Each individual transaction will have the date of the transaction, whether the transaction was a debit or credit transaction and the final balance after the transaction.

One of the challenges I faced while developing this program was making the transactions unique and removing duplicate transactions so they don't repeat when printing the statement. 

However, writing good quality tests enabled me to overcome this challenge to see where exactly the issue was.

# How To Install 

In order to use this program, the first step is to clone the directory in the terminal by doing the following

```
git clone https://github.com/tauqeer92/bank_tech_test.git
```

# How To Run

Next, we need to move into the correct directory and run irb which will allow us to run and interact with the program in the terminal.

We then need to require 'application.rb' in irb.
 
 ```
 cd bank_tech_test
 irb
 require './application.rb'
 ```

 # Instructions

 You will then be presented with a list of options which have been numbered. In order to choose an option, you need to type the number associated with the option in the terminal.

 After you have chosen an option, once you have completed the request, it will take you back to the main menu to choose another option. However, if you choose the option '4' it will exit out of the program.

 If you input a number which has not been assigned to an option, an error message will display and you will be returned to the main menu.

# How To Run Tests

I have used RSpec throughout the TDD process which has enabled me to write good, clean code throughout. If you would like to run tests yourself, please type the following in the terminal.

```
rspec
```