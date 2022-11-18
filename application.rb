require_relative './lib/banking'
require_relative './lib/statement'
require_relative './lib/date'

class Application
  
  def initialize(io, banking, statement)
    @io = io
    @banking = banking
    @statement = statement
  end

  def run
   
    stopping_variable = ''
    
    while stopping_variable != 'stop'
        @io.puts "What would you like to do today? "
        @io.puts "1 - Withdraw"
        @io.puts "2 - Deposit"
        @io.puts "3 - Print Statement"
        @io.puts "4 - Exit"
        choice = @io.gets.chomp
    
        if choice == '1'
            @io.puts "How much would you like to withdraw?"
            amount = @io.gets.chomp.to_i
            @banking.withdraw(amount)
        elsif choice == '2'
            @io.puts "How much would you like to deposit?"
            amount = @io.gets.chomp.to_i
            @banking.deposit(amount)
        elsif choice == '3'
            @statement.load_transactions(@banking)
            @statement.duplicate_checker()
            @statement.generate_statement()
            @io.puts @statement.read_statement()
        elsif choice == '4'
            var += 'stop'
        else
            @io.puts "Incorrect command, please enter another option"
        end

      end 
    
  end

end


date = Date.new
banking = Banking.new(date)
statement = Statement.new

new = Application.new(Kernel, banking, statement)

new.run