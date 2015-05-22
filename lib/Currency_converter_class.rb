require_relative 'Currency_class'

class CurrencyConverter
  attr_reader :rates

  def initialize
    @rates = {"USD" => 1.00, "EUR"=> 0.89958, "GBP"=> 0.63840,
              "INR"=> 63.5795, "AUD"=> 1.26606, "CAD"=> 1.21981,
              "ZAR"=> 11.8514, "NZD"=> 1.36116, "JPY"=> 121.026}
  end

  def convert_math(start_code, start_amount, end_code)
    num = start_amount*(@rates[end_code] / @rates[start_code])
    ((num * 100).floor.round(2))/100
  end

  def convert(start_currency_obj, end_currency_code)
    if @rates.has_key?(start_currency_obj.code) && @rates.has_key?(end_currency_code)
      new_amount = convert_math(start_currency_obj.code, start_currency_obj.amount, end_currency_code)
      new_money = Currency.new(end_currency_code, new_amount)
      new_money
    else
      raise Unknown_Currency_Code_Error
    end
  end
end

class Unknown_Currency_Code_Error < StandardError
end
