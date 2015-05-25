require 'minitest/autorun'
require_relative '../lib/Currency_trader.rb'

class Currency_Trader_Test < Minitest::Test

  def setup_Trader_Test
    @trader = Currency_Trader.new
  end

  def test_Currency_Trader_exists
    setup_Trader_Test
    assert(@trader)
  end

  def test_trader_can_double_money
    setup_Trader_Test
    uk_money = @trader.converter_one.convert(@trader.currency, 'GBP')
    us_money = @trader.converter_two.convert(uk_money, 'USD')
    assert_equal(200_000_000, us_money.amount)
  end
end # class
