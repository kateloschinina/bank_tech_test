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

  context "#get_balance" do
    it "provides account balance" do
      expect(account_with_balance.get_balance).to eq(initial_balance)
    end
  end

  context "#get_transactions" do
    it "provides account transactions" do
      expect(account_with_balance.get_transactions).to eq([])
    end
    it "returns an array of transactions" do
      account.deposit(amount)
      transactions = account.get_transactions
      expect(transactions).to be_a(Array)
      expect(transactions.length).to eq(1)
      expect(transactions.last).to be_a(Transaction)
    end
  end

  context "#deposit" do
    it "the account can be deposited" do
      account.deposit(amount)
      expect(account.get_balance).to eq(amount)
    end
    it "new transaction is added to the account" do
      account.deposit(amount)
      transactions = account.get_transactions
      expect(transactions).to be_a(Array)
      expect(transactions.length).to eq(1)
      expect(transactions.last).to be_a(Transaction)
    end
  end

  context "#withdraw" do
    it "the account can be credited" do
      account_with_balance.withdraw(amount)
      expect(account_with_balance.get_balance).to eq(initial_balance - amount)
    end
    it "new transaction is added to the account" do
      account_with_balance.withdraw(amount)
      transactions = account_with_balance.get_transactions
      expect(transactions).to be_a(Array)
      expect(transactions.length).to eq(1)
      expect(transactions.last).to be_a(Transaction)
    end
  end

  context "#transactions_for_printing" do
    it "returns list of transactions ready to be printed" do
      2.times { account.deposit(amount) }
      allow(Transaction).to recieve(:get_date).and_return(1)
    end
  end

  context "#withdraw" do
    it "the account can be credited" do
      account_with_balance.withdraw(amount)
      expect(account_with_balance.get_balance).to eq(initial_balance - amount)
    end
  end
end
