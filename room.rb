class Room

  attr_accessor :guests, :song, :capacity

  def initialize(guests=[], song =[], capacity)
    @guests = guests
    @song = song
    @capacity = capacity
  end


  def check_in(guest)
    @guests.push(guest)
  end


  def check_out(guest)
    @guests.delete(guest)
  end

  def number()
    return @guests.count
  end

  def full()
    return @guests.count() >= @capacity
  end

end
