require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../song")
require_relative("../guest")
require_relative("../room")

class RoomTest < MiniTest::Test

  def setup
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


    @room1 = Room.new(@guests, @songs)
    @room2 = Room.new(@guests, @songs2)
    @room3 = Room.new(@guests, @songs)
    @room4 = Room.new(@guests, @songs2)
    @room6 = Room.new(@guests, @songs)
    @room5 = Room.new(@guests, @songs2)
    @room6 = Room.new()

  end

  def test_guests
    assert_equal([@guest1, @guest2, @guest3], @room2.guests)
  end

  def test_songs
    assert_equal([@song1, @song2, @song3], @room1.song)
  end


  def test_room_numbers
    assert_equal(3, @room1.number)
  end

end
