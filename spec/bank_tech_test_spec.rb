require_relative '../lib/banking'

RSpec.describe Banking do
  context 'depositing into bank' do
    it 'depositing 500, expect balance to be 500' do
        banking = Banking.new
        banking.deposit(500)
        expect(banking.balance).to eq (500)
    end

    it 'depositing twice, expect balance to be 1000' do
        banking = Banking.new
        banking.deposit(500)
        banking.deposit(500)
        expect(banking.balance).to eq (1000)
    end

    it 'depositing 400, expect transactions to include credit:400' do
        banking = Banking.new
        banking.deposit(400)
        expect(banking.transactions).to eq ([{credit: 400}])
    end

    it 'depositing twice, expect 2 hashes in transactions with credit' do
        banking = Banking.new
        banking.deposit(400)
        banking.deposit(700)
        expect(banking.transactions).to eq ([{credit: 400}, {credit: 700}])
    end

  end

  context 'withdrawing from bank' do
    it 'depositing 500, withdrawing 100, expect balance to equal 400' do
      banking = Banking.new
      banking.deposit(500)
      banking.withdraw(100)
      expect(banking.balance).to eq(400)
    end

    it 'depositing 400, withdrawing 200 expect transactions to include debit and credit' do
        banking = Banking.new
        banking.deposit(400)
        banking.withdraw(200)
        expect(banking.transactions).to eq ([{credit: 400}, {debit: 200}])
    end
  end
  

end