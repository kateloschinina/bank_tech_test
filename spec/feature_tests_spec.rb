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

  context "User Srory Two:" do
    # As a client of a bank,
    # So that I can get some money from my bank account
    # I would like to be able to make a withdrawal from my account.

    it "As a client of a bank, so that I can get some money from my bank account I would like to be able to make a withdrawal from my account." do
      account = Account.new(1000)
      account.withdraw(500)
      expect(account.get_balance).to eq(500)
    end
  end
end
