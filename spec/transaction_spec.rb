require 'transaction'

describe Transaction do

  let(:amount) { double :amount }
  let(:date) { double :date }
  let(:balance) { double :balance }
  let(:amount_debit) { -500 }
  let(:amount_credit) { 500 }

  subject(:transaction) { described_class.new(amount, balance, date) }
  subject(:transaction_debit) { described_class.new(amount_debit, balance, date) }
  subject(:transaction_credit) { described_class.new(amount_credit, balance, date) }

  context "class creation" do
    it "creates an instance of a class" do
      expect(transaction).to be_a(Transaction)
    end
  end

  context "#get_amount" do
    it "provides transaction amount" do
      expect(transaction.get_amount).to eq(amount)
    end
  end

  context "#get_date" do
    it "provides transaction date" do
      expect(transaction.get_date).to eq(date)
    end
  end

  context "#get_balance" do
    it "provides transaction balance" do
      expect(transaction.get_balance).to eq(balance)
    end
  end

  context "#get_debit" do
    it "returns debit if transaction is debit and nil otherwise" do
      expect(transaction_debit.get_debit).to eq(-amount_debit)
      expect(transaction_credit.get_debit).to eq(nil)
    end
  end

  context "#get_credit" do
    it "returns credit if transaction is credit and nil otherwise" do
      expect(transaction_credit.get_credit).to eq(amount_credit)
      expect(transaction_debit.get_credit).to eq(nil)
    end
  end
end
