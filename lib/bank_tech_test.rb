class Banking
    def initialize
      @balance = 0
    end

    def deposit(amount)
      @balance += amount
    end

    def withdraw(amount)
      @balance -= amount
    end

    def balance
      @balance
    end

    
end