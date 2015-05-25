class Currency
  attr_reader :code, :amount

  def initialize(code, *amount)
    @code = code.length > 3 ? code_from_sym_method : code
    @amount = code.length > 3 ? amount_from_sym_method : amount[0]
    @money_symbols = {'$'=> 'USD', '€'=> 'EUR', '£'=> 'GBP', '₹'=> 'INR', 'R'=> 'ZAR', '¥'=> 'JPY'}

    def code_from_sym_method(code)
      if code.length > 3
        @money_symbols[code[0]]
      end
    end

    def amount_from_sym_method(code)
      if code.length > 3
        code.slice(1,code.length - 1).to_f
      end
    end
  end #initialize

  def ==(other)
    if other.is_a?(Currency) && @code == other.code && @amount == other.amount
      true
    else
      false
    end
  end

  def -(other)
    if other.is_a?(Currency) && @code == other.code
      @amount -= other.amount
    else
      raise Different_Currency_Code_Error
    end
  end

  def +(other)
    if other.is_a?(Currency) && @code == other.code
      @amount += other.amount
    else
      raise Different_Currency_Code_Error
    end
  end

  def *(num)
    new_amount = @amount * num
    new_amount = ((new_amount * 100).round(2))/100
    @amount = new_amount
    Currency.new(@code, new_amount)
  end

  def add_currency(giver_code, amount)
    if giver_code == @code
      @amount += amount
    else
      raise Different_Currency_Code_Error
    end
  end

  def sub_currency(taker_code, amount)
    if taker_code == @code
      @amount -= amount
    else
      raise Different_Currency_Code_Error
    end
  end

  def multiply_currency(num)
    new_amount = num * @amount
    new_money = Currency.new(@code, new_amount.round)
    new_money
  end
end

class Different_Currency_Code_Error < StandardError
end
