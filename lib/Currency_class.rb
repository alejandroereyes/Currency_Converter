class Currency
  attr_reader :code, :amount

  def initialize(code, amount)
    @code = code
    @amount = amount
  end

  def add_currency(giver_code, amount)
    if giver_code == @code
      @amount += amount
    else
      dif_currency_msg
    end
  end

  def sub_currency(taker_code, amount)
    if taker_code == @code
      @amount -= amount
    else
      dif_currency_msg
    end
  end

  def dif_currency_msg
    "Currencies do not match!"
  end

  def multiply_currency(num)
    new_amount = num * @amount
    new_money = Currency.new(@code, new_amount)
    new_money
  end
end # class
