class Bar
  attr_reader :sales, :name, :rooms, :drinks

  def initialize(name, rooms, drinks, till)
    @name = name
    @rooms = rooms
    @drinks = drinks
    @till = till
    @entryfee = 5
    @sales = 0
  end

  def till
    return @till
  end




  def admission(customer, room)
    if customer.money <=4.99
      return "Sorry you haven't enough funds"
    end

    if  @rooms[room].full
      return "Room Full please pick another"
    end
    @till += 5
    customer.charge(5)
    @rooms[room].check_in(customer)
    @sales += 5

    if @rooms[room].song.include?(customer.fav_song)
      return "Whoo!"
    end






    def drink_sale(customer, drink)

      if @drinks[drink][:quantity] <= 0
        return "sorry sold out"

      elsif customer.money <= @drinks[drink][:info].price
        return "Sorry you haven't enough funds"

      else
        customer.charge(@drinks[drink][:info].price)
        return @sales +=1
      end
    end
  end






end
