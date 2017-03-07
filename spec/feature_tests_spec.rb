require 'account'

describe "Feature tests for User Stories" do
  context "User Story One:" do
    # As a client of a bank,
    # So that I can put money on my bank account
    # I would like to be able to deposit my account.

    it "As a client of a bank, so that I can put money on my bank account I would like to be able to deposit my account." do
      account = Account.new
      account.deposit(1000)
      expect(account.get_balance).to eq(1000)
    end
  end

  context "User Story Two:" do
    # As a client of a bank,
    # So that I can get some money from my bank account
    # I would like to be able to make a withdrawal from my account.

    it "As a client of a bank, so that I can get some money from my bank account I would like to be able to make a withdrawal from my account." do
      account = Account.new(1000)
      account.withdraw(500)
      expect(account.get_balance).to eq(500)
    end
  end

  context "User Story Three:" do
    # As a client of a bank,
    # So that I know what was going on with my account
    # I would like to be able to print my bank statement, that will show all my transactions, dates of these transactions, and track my balance.

    it "As a client of a bank, so that I know what was going on with my account I would like to be able to print my bank statement, that will show all my transactions, dates of these transactions, and track my balance." do
      account = Account.new
      account.deposit(1000)
      account.withdraw(500)
      printer = Printer.new(account.transactions_for_printing)
      expected_output = "date       || credit  || debit   || balance\n#{Time.now.day}/#{Time.now.month}/#{Time.now.year}   ||         || 500     || 500\n#{Time.now.day}/#{Time.now.month}/#{Time.now.year}   || 1000    ||         || 1000\n"
      expect { printer.print_statement }.to output(expected_output).to_stdout
    end
  end
end
