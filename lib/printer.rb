class Printer
  OUTPUT_WIDTH = 11

  def initialize(transactions_list)
    @transactions = transactions_list
    @output_width = OUTPUT_WIDTH
  end

  def print_statement
    print_header
    @transactions.each do |transaction|
      print_transaction(transaction)
    end
  end

  private
  def print_header
    puts  "date".ljust(@output_width) + "|| credit".ljust(@output_width) + "|| debit".ljust(@output_width) + "|| balance" + "\n"
  end

  def print_transaction(transaction)
    puts  print_date(transaction) + print_amount(transaction.get_credit) + print_amount(transaction.get_debit) + "|| #{transaction.get_balance}\n"
  end

  def print_date(transaction)
    "#{transaction.get_date}".ljust(@output_width)
  end

  def print_amount(amount)
    "|| #{amount}".ljust(@output_width)
  end
end
