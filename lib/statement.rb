class Statement
  def initialize()
    @statement = "date || credit || debit || balance"
    @all = []
    @loaded_transactions = []
    @added_transactions = []
    @list_formatted_transactions = []
    @balance = 0
  end

  def load_transactions(banking)
    transactions = banking.transactions()
    @loaded_transactions.push(transactions)
    @loaded_transactions.flatten!
  end

  def duplicate_checker
    duplicates_removed = @loaded_transactions.uniq
    duplicates_removed.each do |transaction|
      if @added_transactions.include?(transaction)
        @loaded_transactions.delete(transaction)
      else
        @added_transactions.push(transaction)
      end  
    end
  end

  def generate_statement()
    @loaded_transactions.each do |transaction|
      if transaction.keys[1] == :credit
        @balance += transaction[:credit]
        credit_formatted_transaction = "\n 14/01/2023 || #{transaction[:credit]} || || #{@balance}"
        @list_formatted_transactions.push(credit_formatted_transaction)
      else
        @balance -= transaction[:debit]
        debit_formatted_transaction = "\n 14/01/2023 || || #{transaction[:debit]} || #{@balance}"
        @list_formatted_transactions.push(debit_formatted_transaction)
      end
    end
  end

  def read_statement
    @statement = "date || credit || debit || balance"
    reversed_list_formatted_transactions = @list_formatted_transactions.reverse().join
    @all.unshift(reversed_list_formatted_transactions)
    joined = @all.join
    @statement += joined
    @list_formatted_transactions = []
    @statement
  end

end


# date       || credit  || debit || balance
# 14/01/2023 ||         || 500.00|| 2500.00
# 13/01/2023 || 2000.00 ||       || 3000.00
# 10/01/2023 || 1000.00 ||       || 1000.00

# date || credit || debit || balance
# 14/01/2023 || || 500.00 || 2500.00
# 13/01/2023 || 2000.00 || || 3000.00
# 10/01/2023 || 1000.00 || || 1000.00