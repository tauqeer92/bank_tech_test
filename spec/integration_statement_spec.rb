require_relative '../lib/statement'
require_relative '../lib/banking'


RSpec.describe Statement do
  context 'checking statement for correct amount in credit and balance' do
    it 'crediting account once, expect 500 in credit column and balance column' do
        banking = Banking.new
        banking.deposit(500)
        statement = Statement.new(banking)
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance \n 14/01/2023 || 500 || || 500")
    end

    it 'crediting account twice, 1000 in balance column' do
        banking = Banking.new
        banking.deposit(500)
        banking.deposit(500)
        statement = Statement.new(banking)
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance \n 14/01/2023 || 500 || || 1000 \n 14/01/2023 || 500 || || 500")
    end
    it 'crediting account three times, expect 1500 in balance column' do
        banking = Banking.new
        banking.deposit(500)
        banking.deposit(500)
        banking.deposit(500)
        statement = Statement.new(banking)
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance \n 14/01/2023 || 500 || || 1500 \n 14/01/2023 || 500 || || 1000 \n 14/01/2023 || 500 || || 500")
    end
  end

  context 'checking statement for correct amount in debit and balance' do
    it 'crediting and debiting account' do
        banking = Banking.new
        banking.deposit(1000)
        banking.withdraw(700)
        statement = Statement.new(banking)
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance \n 14/01/2023 || || 700 || 300 \n 14/01/2023 || 1000 || || 1000")
    end
  end
  
  

end