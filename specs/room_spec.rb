require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../song")
require_relative("../guest")
require_relative("../room")
require_relative("../bar")

class RoomTest < MiniTest::Test

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
    [@drink1, @drink2, @drink3, @drink4, @drink5, @drink6, @drink7]

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
    @guest5 = Guest.new("Mary", 13, @song5)

    @guests = [@guest1, @guest2, @guest3]

    ################# ROOMS ###################################
    @jazz = Room.new(@guests, @songs, 4 )
    @pop = Room.new(@guests, @songs2, 7)
    @rock = Room.new(@guests, @songs, 3)

    @rooms1= {:@jazz => @jazz, :room2 => @pop, :room3 => @rock}



    @bar1= Bar.new("2042" ,@rooms1, @drinks, 5000)

  end

  def test_guests
    assert_equal([@guest1, @guest2, @guest3], @pop.guests)
  end

  def test_songs
    assert_equal([@song1, @song2, @song3], @jazz.song)
  end


  def test_room_numbers
    assert_equal(3, @jazz.number)
  end

  def test_room_checkin
    @jazz.check_in(@guest4)
    assert_equal(4, @jazz.number)
  end

  def test_room_check_out
    @jazz.check_out(@guest1)
    assert_equal(2, @jazz.number)
  end


  def test_full__true()
    assert_equal(true, @rock.full)
  end

  def test_full__false()
    assert_equal(false, @jazz.full)
  end

end
