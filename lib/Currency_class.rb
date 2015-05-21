class Currency
  attr_reader :code, :amount

  def initialize(code, amount)
    @code = code
    @amount = amount
  end

  def add_currency(giver_code, amount)
    if giver_code == @code
      @amount += amount
    end
  end

  def sub_currency(taker_code, amount)
    if taker_code == @code
      @amount -= amount
    end
  end
end # class
