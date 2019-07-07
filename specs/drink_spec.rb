require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class TestDrink < MiniTest::Test

  def setup

    @drink1 = Drink.new("Cola", 1.0)
    @drink2 = Drink.new("Vodka", 3.0)
    @drink3 = Drink.new("Fanta", 1.50)
    @drink4 = Drink.new("IrnBru",2.0)
    @drink5 = Drink.new("Whiskey", 5.0)
    @drink6 = Drink.new("Orange", 2.50)
    @drink7 = Drink.new("Apple", 2.10)

    @drinks=
    [@drink1 = Drink.new("Cola", 1.0),
      @drink2 = Drink.new("Vodka", 3.0),
      @drink3 = Drink.new("Fanta", 1.50),
      @drink4 = Drink.new("IrnBru",2.0),
      @drink5 = Drink.new("Whiskey", 5.0),
      @drink6 = Drink.new("Orange", 2.50),
      @drink7 = Drink.new("Apple", 2.10)]


    end

    def test_Drink_name
      assert_equal("Cola", @drink1.name)
    end

    def test_Drink_price
      assert_equal(1.0, @drink1.price)
    end




  end
