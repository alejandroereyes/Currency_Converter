require 'minitest/autorun'
require_relative '../lib/Currency_trader.rb'

class Currency_Trader_Test < Minitest::Test

  def setup_Trader_Test
    converter_one = CurrencyConverter.new
    converter_two = CurrencyConverter.new({'USD'=> 1.00, 'GBP'=> 0.31920, 'JPY'=> 121.026})
    converter_three = CurrencyConverter.new({'USD'=> 1.00, 'GBP'=> 0.31920, 'JPY'=> 121.026})
    @trader = Currency_Trader.new('USD', 100_000_000, converter_one, converter_two, converter_three)
  end

  def test_Currency_Trader_exists
    setup_Trader_Test
    assert(@trader)
  end

  # def test_trader_can_double_money
  #   setup_Trader_Test
  #   uk_money = @trader.converter_one.convert(@trader.currency, 'GBP')
  #   us_money = @trader.converter_two.convert(uk_money, 'USD')
  #   assert_equal(200_000_000, us_money.amount)
  # end

  def test_converters_array
    setup_Trader_Test
    uk_money = @trader.converters[0].convert(@trader.currency, 'GBP')
    yen_money = @trader.converters[1].convert(uk_money, 'JPY')
    us_money = @trader.converters[2].convert(yen_money, 'USD')
    assert_equal('GBP', uk_money.code)
    assert_equal('JPY', yen_money.code)
    assert_equal(200_000_000, us_money.amount)
  end
end # class
