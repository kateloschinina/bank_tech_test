class Transaction
  def initialize(amount, balance, date = "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}") # separate to date class
    @amount = amount
    @date = date
    @balance = balance
  end

  def get_amount
    @amount
  end

  def get_date
    @date
  end:

  def get_balance
    @balance
  end

  def get_debit
    -get_amount if is_debit?
  end

  def get_credit
    get_amount if is_credit?
  end

  private
  def is_debit?
    @amount < 0
  end

  def is_credit?
    @amount > 0
  end
end
