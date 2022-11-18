require_relative '../lib/statement'
require_relative '../lib/banking'


RSpec.describe Statement do
  context 'checking statement for correct amount in credit and balance' do
    it 'crediting account once, expect 500 in credit column and balance column' do
        fake_date = double :fake_date, get_date: '15/11/2022'
        banking = Banking.new(fake_date)
        statement = Statement.new
        banking.deposit(500)
        statement.load_transactions(banking)
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance\n 15/11/2022 || 500 || || 500")
    end

    it 'crediting account twice, 1000 in balance column' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        banking.deposit(500)
        banking.deposit(500)
        statement = Statement.new
        statement.load_transactions(banking)
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance\n 14/01/2023 || 500 || || 1000\n 14/01/2023 || 500 || || 500")
    end
    it 'crediting account three times, expect 1500 in balance column' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        banking.deposit(500)
        banking.deposit(500)
        banking.deposit(500)
        statement = Statement.new
        statement.load_transactions(banking)
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance\n 14/01/2023 || 500 || || 1500\n 14/01/2023 || 500 || || 1000\n 14/01/2023 || 500 || || 500")
    end
  end

  context 'checking statement for correct amount in debit and balance' do
    it 'crediting and debiting account' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        banking.deposit(1000)
        banking.withdraw(700)
        statement = Statement.new
        statement.load_transactions(banking)
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance\n 14/01/2023 || || 700 || 300\n 14/01/2023 || 1000 || || 1000")
    end
  end

  context 'calling generate_statement method twice, expecting no duplicates' do
    it 'crediting and debiting account' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        banking.deposit(1000)
        banking.withdraw(700)
        statement = Statement.new
        statement.load_transactions(banking)
        statement.duplicate_checker()
        statement.generate_statement()
        statement.load_transactions(banking)
        statement.duplicate_checker()
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance\n 14/01/2023 || || 700 || 300\n 14/01/2023 || 1000 || || 1000")
    end
  end
  context 'deposit, withdraw, print, withdraw' do
    it 'crediting and debiting and printing account' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        statement = Statement.new
        banking.deposit(1000)
        banking.withdraw(100)
        statement.load_transactions(banking)
        statement.duplicate_checker()
        statement.generate_statement()
        statement.read_statement()
        banking.withdraw(200)
        statement.load_transactions(banking)
        statement.duplicate_checker()
        statement.generate_statement()
        expect(statement.read_statement()).to eq ("date || credit || debit || balance\n 14/01/2023 || || 200 || 700\n 14/01/2023 || || 100 || 900\n 14/01/2023 || 1000 || || 1000")
    end
  end
  
  

end