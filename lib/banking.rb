class Banking
    def initialize
      @balance = 0
      @transactions = []
    end

    def deposit(amount)
      @balance += amount
      @transactions.push({credit: amount})
    end

    def withdraw(amount)
      @balance -= amount
      @transactions.push({debit: amount})
    end

    def balance
      @balance
    end

    def transactions
      @transactions
    end

    
end