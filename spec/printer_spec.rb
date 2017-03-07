require 'printer'

describe Printer do

  subject(:printer) { described_class.new(transactions_list) }
  let(:transactions_list) { spy(:transactions_list) }

  context "class creation" do
    it "creates an instance of a class" do
      expect(printer).to be_a(Printer)
    end
  end

  context "#print_statement" do
    it "prints credit transaction" do
      credit_transaction = [Transaction.new(1000,1000)]
      # spy
      printer = Printer.new(credit_transaction)
      expected_output = "date       || credit  || debit   || balance\n#{Time.now.day}/#{Time.now.month}/#{Time.now.year}   || 1000    ||         || 1000\n"
      expect { printer.print_statement }.to output(expected_output).to_stdout
    end
    it "prints debit transaction" do
      credit_transaction = [Transaction.new(-500,500)]
      # spy
      printer = Printer.new(credit_transaction)
      expected_output = "date       || credit  || debit   || balance\n#{Time.now.day}/#{Time.now.month}/#{Time.now.year}   ||         || 500     || 500\n"
      expect { printer.print_statement }.to output(expected_output).to_stdout
    end
  end
end
