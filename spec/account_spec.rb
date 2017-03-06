require 'account'

describe Account do

  let(:amount) { 1000 }
  let(:initial_balance) { 1500 }

  subject(:account) { described_class.new }
  subject(:account_with_balance) { described_class.new(initial_balance) }

  default_balance = Account::DEFAULT_BALANCE

  context "class creation" do
    it "creates an instance of a class" do
      expect(account).to be_a(Account)
    end
    context "unless otherwise stated initial account balance" do
      it "equals to #{default_balance}" do
        expect(account.get_balance).to eq(default_balance)
      end
    end
    context "when initial account balance is provided" do
      it "account balance equals to this initial balance" do
        expect(account_with_balance.get_balance).to eq(initial_balance)
      end
    end
  end

  context "#deposit" do
    it "the account can be deposited" do
      account.deposit(amount)
      expect(account.get_balance).to eq(amount)
    end
  end

  context "#withdraw" do
    it "the account can be credited" do
      account_with_balance.withdraw(amount)
      expect(account_with_balance.get_balance).to eq(initial_balance - amount)
    end
  end
end
