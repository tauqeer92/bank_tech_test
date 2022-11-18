require 'date'
class Banking
    def initialize(date)
      @balance = 0
      @transactions = []
      @num = 1
      @date = date
      
    end

    def deposit(amount)
      @balance += amount
      @transactions.push({:id => @num, credit: amount, date: @date.get_date()})
      @num += 1
    end

    def withdraw(amount)
      @balance -= amount
      @transactions.push({:id => @num, debit: amount, date: @date.get_date()})
      @num += 1
    end

    def balance
      @balance
    end

    def transactions
      @transactions
    end

    
end