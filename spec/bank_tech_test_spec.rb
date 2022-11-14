require_relative '../lib/bank_tech_test'

RSpec.describe Banking do
  context 'depositing into bank' do
    it 'depositing 500, expect balance to be 500' do
        banking = Banking.new
        banking.deposit(500)
        expect(banking.balance).to eq (500)
    end
  end

  context 'withdrawing from bank' do
    it 'depositing 500, withdrawing 100, expect balance to equal 400' do
      banking = Banking.new
      banking.deposit(500)
      banking.withdraw(100)
      expect(banking.balance).to eq(400)
    end
  end
  

end