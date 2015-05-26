class Currency
  attr_reader :code, :amount

  def initialize(code, *amount)
    @money_symbols = {'$'=> 'USD', '€'=> 'EUR', '£'=> 'GBP', '₹'=> 'INR', 'R'=> 'ZAR', '¥'=> 'JPY'}
    @code = code.match(/[^a-zA-Z]/) != nil ? code_from_sym_method(code, @money_symbols) : code
    @amount = code.match(/[^a-zA-Z]/) != nil ? amount_from_sym_method(code) : amount[0]

    def code_from_sym_method(code, hsh)
        @money_symbols[code[0]]
    end

    def amount_from_sym_method(code)
        code.slice(1,code.length - 1).to_f
    end
  end

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
end

class Different_Currency_Code_Error < StandardError
end
