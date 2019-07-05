class Room

  attr_accessor :guests, :song

def initialize(guests=[], song =[])
  @guests = guests
  @song = song
  @max capacity = 5
end


def check_in(guest)
  return "full, can't check in" if @max >=5
  @guests  << guest
end


def check_out(guest)
@guests.delete(guest)
end

def number()
  return @guests.length
end

end
