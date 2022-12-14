require_relative '../lib/banking'

RSpec.describe Banking do
  context 'depositing into bank' do
    it 'depositing 500, expect balance to be 500' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        banking.deposit(500.00)
        expect(banking.balance).to eq (500.00)
    end

    it 'depositing twice, expect balance to be 1000' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        banking.deposit(500)
        banking.deposit(500)
        expect(banking.balance).to eq (1000)
    end

    it 'depositing 400, expect transactions to include credit:400' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        banking.deposit(400)
        expect(banking.transactions).to eq ([{credit: 400, :date=>"14/01/2023", :id=>1}])
    end

    it 'depositing twice, expect 2 hashes in transactions with credit' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        banking.deposit(400)
        banking.deposit(700)
        expect(banking.transactions).to eq ([{credit: 400, :date=>"14/01/2023", :id=>1}, {credit: 700, :date=>"14/01/2023", :id=>2}])
    end

  end

  context 'withdrawing from bank' do
    it 'depositing 500, withdrawing 100, expect balance to equal 400' do
      fake_date = double :fake_date, get_date: '14/01/2023'
      banking = Banking.new(fake_date)
      banking.deposit(500)
      banking.withdraw(100)
      expect(banking.balance).to eq(400)
    end

    it 'depositing 400, withdrawing 200 expect transactions to include debit and credit' do
        fake_date = double :fake_date, get_date: '14/01/2023'
        banking = Banking.new(fake_date)
        banking.deposit(400)
        banking.withdraw(200)
        expect(banking.transactions).to eq ([{credit: 400, :date=>"14/01/2023", :id=>1}, {debit: 200, :date=>"14/01/2023", :id=>2}])
    end
  end
  

end