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
end # class
