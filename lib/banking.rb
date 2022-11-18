class Banking
    def initialize
      @balance = 0
      @transactions = []
      @num = 1
    end

    def deposit(amount)
      @balance += amount
      @transactions.push({:id => @num, credit: amount})
      @num += 1
    end

    def withdraw(amount)
      @balance -= amount
      @transactions.push({:id => @num, debit: amount})
      @num += 1
    end

    def balance
      @balance
    end

    def transactions
      @transactions
    end

    
end