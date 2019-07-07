require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../song")
require_relative("../bar")
require_relative("../guest")
require_relative("../room")

class Testbar < MiniTest::Test

  def setup



    ################### DRINKS ##############################################
    @drink1 = Drink.new("Cola", 1.0)
    @drink2 = Drink.new("Vodka", 3.0)
    @drink3 = Drink.new("Fanta", 1.50)
    @drink4 = Drink.new("IrnBru",2.0)
    @drink5 = Drink.new("Whiskey", 5.0)
    @drink6 = Drink.new("Orange", 2.50)
    @drink7 = Drink.new("Apple", 2.10)
    @drink18 = Drink.new("jojo", 3.10)

    @drinks=
    { :drink1 =>{:quantity => 5, :info => @drink1}, :drink3 =>{:quantity => 2, :info => @drink3}, :drink4 =>{:quantity => 1, :info => @drink4} }

    #########################SONGS #########################################
    @song1 = Song.new ("i'm still standing")
    @song2 = Song.new ("changes")
    @song3 = Song.new ("blue")
    @song4 = Song.new ("happy")
    @song5 = Song.new ("past")

    @songs = [@song1, @song2, @song3]
    @songs2 = [@song3, @song4, @song5]

    ############# GUESTS #######################################
    @guest1 = Guest.new("Bob", 10, @song1)
    @guest2 = Guest.new("Tony", 12, @song2)
    @guest3 = Guest.new("Alex", 20, @song3)
    @guest4 = Guest.new("Paul", 30, @song4)
    @guest5 = Guest.new("Mary", 1, @song5)

    @guests = [@guest1, @guest2, @guest3]

    ################# ROOMS ###################################
    @jazz = Room.new(@guests, @songs, 4 )
    @pop = Room.new(@guests, @songs2, 7)
    @rock = Room.new(@guests, @songs, 3)

    @rooms1= {:room1 => @jazz, :room2 => @pop, :room3 => @rock}



    @bar1= Bar.new("2042" ,@rooms1 , @drinks, 5000)

  end

  def test_bar_has_name
    assert_equal("2042", @bar1.name)
  end

  def test_bar_has_money
    assert_equal(5000, @bar1.till)
  end

  def test_bar_has_drinks
    assert_equal(@drinks, @bar1.drinks)
    assert_equal("Cola", @bar1.drinks[:drink1][:info].name)
  end

  def test_bar_has_customers
    assert_equal("Bob",@bar1.rooms[:room1].guests[0].name)
  end

  def test_bar_has_entry_admission
    (@bar1.admission(@guest1, :room2))
    assert_equal(5, @guest1.money)
    assert_equal(4, @bar1.rooms[:room2].number)
    assert_equal(5005, @bar1.till)
  end

  def test_bar_has_entry_admission__full
    assert_equal("Room Full please pick another", (@bar1.admission(@guest4, :room3)))
  end

  def test_bar_has_entry_admission__customer__
    assert_equal("Room Full please pick another", (@bar1.admission(@guest4, :room3)))
  end

  def test_bar_has_entry_admission__full
    assert_equal("Sorry you haven't enough funds", (@bar1.admission(@guest5, :room3)))
  end

  def test_sales
    (@bar1.admission(@guest1, :room2))
    assert_equal(5, @bar1.sales)
  end

  def test_wooho()
    assert_equal("Whoo!", @bar1.admission(@guest1, :room1))
  end


  def test_bar_sells_drink
    @bar1.drink_sold(:drink1, @guest1)
    assert_equal(1, @bar1.sales)
  end

  def test_drinks_to_bar
    @bar1.add_drinks_to_bar(@drink18, 10, "drink2")
    assert_equal(4, @drinks.count())
  end


  def test_drinks_to_bar__includes__drink_being_made
    @bar1.add_drinks_to_bar_____whilst_making_drink__class_object("jojo", 2.0, 10, "drink2")
    assert_equal(4, @drinks.count())
  end



end
