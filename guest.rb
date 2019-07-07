class Guest

attr_accessor :name, :money, :fav_song

def initialize(name, money, fav_song)
  @name = name
  @money = money
  @fav_song = fav_song
end

def charge(amount)
  return @money -= amount
end

def customer_can_afford_drink(drinks_hash, drink)
   return @money <= drinks_hash[drink][:info].price
end

end
