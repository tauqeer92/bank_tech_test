# Bank Tech Test

 # Product Description

I have created a Banking program in Ruby which you can interact with in IRB. It allows you to make transactions so you can deposit and withdraw money. You can also print a statement which allows you to see a list of transactions.

One of the challenges I faced while developing this program was making the transactions unique and removing dupicate transactions so they don't repeat when printing the statement. 

However, writing good quality test enabled me to overcome this challenge to see where exactly the issue was.

# How To Install 

In order to use this program, the first step is to clone the directory in the terminal by doing the following

```
git clone https://github.com/tauqeer92/bank_tech_test.git
```

# How To Run

Next we need to move in the correct directory and run irb which will allow us to run and interact with the program in the terminal.

We then need to require the 'application.rb' in irb.
 
 ```
 cd bank_tech_test
 irb
 require './application.rb'
 ```

# How To Run Tests

I have used RSpec throughout the TDD process which has allowed me to write good, clean code throughout. If you would like to run tests yourself, please type the following in the terminal.

```
rspec
```