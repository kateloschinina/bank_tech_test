class Account

  DEFAULT_BALANCE = 0

  def initialize(initial_balance = DEFAULT_BALANCE)
    @balance = initial_balance
  end

  def get_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end
end
