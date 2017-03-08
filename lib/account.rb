class Account

  DEFAULT_BALANCE = 0

  def initialize(initial_balance = DEFAULT_BALANCE)
    @balance = initial_balance
    @transactions = Array.new
  end

  def get_balance
    @balance
  end

  def get_transactions
    @transactions
  end

  def deposit(amount)
    @balance += amount
    store_transaction(amount, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    store_transaction(-amount, @balance)
  end

  def transactions_for_printing
    @transactions.reverse
  end

  private

  def store_transaction(amount, balance)
    @transactions << Transaction.new(amount, balance)
  end

  def withdraw(amount)
    @balance -= amount
  end
end
