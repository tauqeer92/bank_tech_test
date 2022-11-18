# require_relative '../application.rb'

# RSpec.describe Application do
#   context 'testing application' do
#     it 'testing run method' do
#         io = double :io
#         expect(io).to receive(:puts).with('What would you like to do today? ').ordered
#         expect(io).to receive(:puts).with("1 - Withdraw").ordered
#         expect(io).to receive(:puts).with("2 - Deposit").ordered
#         expect(io).to receive(:puts).with("3 - Print Statement").ordered
#         expect(io).to receive(:puts).with("4 - Exit").ordered
#         expect(io).to receive(:gets).and_return('1').ordered
#         expect(io).to receive(:puts).with("How much would you like to withdraw?").ordered
#         expect(io).to receive(:gets).and_return('10').ordered
#         expect(io).to receive(:puts).with('What would you like to do today? ').ordered
#         expect(io).to receive(:puts).with("1 - Withdraw").ordered
#         expect(io).to receive(:puts).with("2 - Deposit").ordered
#         expect(io).to receive(:puts).with("3 - Print Statement").ordered
#         expect(io).to receive(:puts).with("4 - Exit").ordered
#         expect(io).to receive(:gets).and_return('3').ordered
#         expect(io).to receive(:puts).with("date || credit || debit || balance \n 14/01/2023 || || 10 || -10").ordered
#         fake_date = double :fake_date, get_date: '14/01/2023'
#         banking = Banking.new(fake_date)
#         statement = Statement.new
#         application = Application.new(Kernel, banking, statement)
#         application.run
#     end
#   end
# end