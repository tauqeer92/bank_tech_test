class Statement
  def initialize(transactions_list)
    @statement = "date || credit || debit || balance"
    @list_formatted_transactions = []
    @transactions = transactions_list.transactions()
    @balance = 0
  end

  def generate_statement
    @transactions.each do |transaction|
      if transaction.keys == [:credit]
        @balance += transaction[:credit]
        credit_formatted_transaction = " \n 14/01/2023 || #{transaction[:credit]} || || #{@balance}"
        @list_formatted_transactions.push(credit_formatted_transaction)
      else
        @balance -= transaction[:debit]
        debit_formatted_transaction = " \n 14/01/2023 || || #{transaction[:debit]} || #{@balance}"
        @list_formatted_transactions.push(debit_formatted_transaction)
      end
    end
    reversed_list_formatted_transactions = @list_formatted_transactions.reverse().join
    return @statement += reversed_list_formatted_transactions
    
  end

  def read_statement
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