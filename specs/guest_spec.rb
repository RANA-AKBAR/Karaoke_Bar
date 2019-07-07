require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../song")
require_relative("../guest")

class GuestTest < MiniTest::Test

  def setup
    ################### DRINKS ##############################################
    @drink1 = Drink.new("Cola", 1.0)
    @drink2 = Drink.new("Vodka", 3.0)
    @drink3 = Drink.new("Fanta", 1.50)
    @drink4 = Drink.new("IrnBru",2.0)
    @drink5 = Drink.new("Whiskey", 5.0)
    @drink6 = Drink.new("Orange", 2.50)
    @drink7 = Drink.new("Apple", 2.10)

    @drinks=
    { :drink1 =>{:quantity => 5, :info => @drink1}, :drink3 =>{:quantity => 2, :info => @drink3}, :drink4 =>{:quantity => 1, :info => @drink4} }
    @song1 = Song.new ("i'm still standing")
    @song2 = Song.new ("changes")
    @song3 = Song.new ("blue")
    @song4 = Song.new ("happy")
    @song5 = Song.new ("past")


    @guest1 = Guest.new("Bob", 10, @song1)
    @guest2 = Guest.new("Tony", 12, @song2)
    @guest3 = Guest.new("Alex", 20, @song3)
    @guest4 = Guest.new("Paul", 30, @song4)
    @guest5 = Guest.new("Mary", 13, @song5)
    @guest6 = Guest.new("Joe", 0, @song5)


  end

def test_name
assert_equal("Paul", @guest4.name)
end

def test_money
assert_equal(20, @guest3.money)
end

def test_fav_Song
assert_equal("past", @guest5.fav_song.name)
end

def test_change
  assert_equal(5, @guest1.charge(5))
end

def test_Can_afford_Drink
  assert_equal(false, @guest1.customer_can_afford_drink(@drinks, :drink1))
end

def test_Can_afford_Drink
  assert_equal(true, @guest6.customer_can_afford_drink(@drinks, :drink1))
end


end
