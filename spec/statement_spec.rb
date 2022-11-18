require_relative '../lib/statement'

RSpec.describe Statement do
  
 context 'testing generate statement and read statement method' do
   it 'expect to return "date || credit || debit || balance"' do
     statement = Statement.new
     expect(statement.read_statement).to eq "date || credit || debit || balance"
   end
 end
  

end