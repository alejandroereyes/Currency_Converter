require_relative 'Currency_class'
require_relative 'Currency_converter_class'

class Currency_Trader
  attr_reader :currency, :converter_one, :converter_two
  def initialize(code = 'USD', amount = 100_000_000, converter_two_rates = {"USD" => 1.00, "EUR"=> 0.89958, "GBP"=> 0.31920,
                                                                                                "INR"=> 63.5795, "AUD"=> 1.26606, "CAD"=> 1.21981,
                                                                                                "ZAR"=> 11.8514, "NZD"=> 1.36116, "JPY"=> 121.026})
    @currency = Currency.new(code, amount)
    @converter_one = CurrencyConverter.new
    @converter_two = CurrencyConverter.new(converter_two_rates)
  end
end # class
