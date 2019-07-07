class Bar
  attr_reader :sales, :name, :rooms, :drinks, :till

  def initialize(name, rooms, drinks, till)
    @name = name
    @rooms = rooms
    @drinks = drinks
    @till = till
    @entryfee = 5
    @sales = 0
  end


  def admission(customer, room)

    return "Sorry you haven't enough funds" if customer.money <=4.99
    return "Room Full please pick another" if(@rooms[room].full)

    customer.charge(@entryfee)
    increase_sale(@entryfee)
    @rooms[room].check_in(customer)
    @rooms[room].song.include?(customer.fav_song)
      return "Whoo!"

  end



def drink_available(drink)
  return @drinks[drink][:quantity] <= 0
end


def drink_sale(customer, drink)
 return customer.charge(@drinks[drink][:info].price)
end


def increase_sale(amount)
  @till += amount
  @sales +=amount
end

def drink_sold(drink, customer)
  return "No Drinks Avialable" if drink_available(drink)

  drink_sale(customer, drink)
  increase_sale(@drinks[drink][:info].price)
end



def add_drinks_to_bar(drink, number_ordered, menuname)

  return @drinks[menuname.to_sym ] = {"quantity".to_sym =>number_ordered, "info".to_sym => drink}

end


def add_drinks_to_bar_____whilst_making_drink__class_object(name, price, number_ordered, menuname)

  drink = Drink.new(name, price)

  return @drinks[menuname.to_sym ] = {"quantity".to_sym =>number_ordered, "info".to_sym => drink}

end



end
