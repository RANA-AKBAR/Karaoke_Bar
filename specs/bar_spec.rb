require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../song")
require_relative("../bar")
require_relative("../guest")
require_relative("../room")

class Testbar < MiniTest::Test

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
      @guest6 = Guest.new("Joe", 18, "Lost")

      @guests = [@guest1, @guest2, @guest3]

      @songs = [@song1, @song2, @song3]
      @songs2 = [@song3, @song4, @song5]


      @room1 = Room.new(@guests, @songs, 4 )
      @room2 = Room.new(@guests, @songs2, 3)
      @room3 = Room.new(@guests, @songs, 3)
      @room4 = Room.new(@guests, @songs2,2)
      @room6 = Room.new(@guests, @songs, 6)
      @room5 = Room.new(@guests, @songs2, 1)

      @rooms1= {@room1, @room2, @room3}



      @bar1= Bar.new("2042",@rooms1, @drinks, 5000)

    end

    def test_bar_has_name
      assert_equal("2042", @bar1.name)
    end

    def test_bar_has_money
      assert_equal(5000, @bar1.till)
    end

    def test_bar_has_drinks
      assert_equal(@drinks, @bar1.drinks)
      assert_equal("Cola", @bar1.drinks[0].name)
    end

    def test_bar_has_customers
      assert_equal("Bob",@bar1.rooms[0].guests[0].name)
    end

    def test_bar_has_entry_fee
      (@bar1.fee(@guest1, @room2))
      assert_equal(5, @guest1.money)
      assert_equal(1, @bar1.rooms[@room2].number)
      assert_equal(5005, @bar1.till)
    end
    #
    # def test_bar_money_increase_fee
    #
    # end
    #
    # def test_bar_sells_drink
    #
    # end

    # def test_bar_sells_drinks_stock
    #
    # end




  end
