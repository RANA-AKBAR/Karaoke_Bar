require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")
require_relative("../song")
require_relative("../guest")

class GuestTest < MiniTest::Test

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



end
