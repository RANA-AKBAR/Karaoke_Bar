class Bar
  attr_accessor :name, :rooms, :drinks

  def initialize(name, rooms, drinks, till)
    @name = name
    @rooms = rooms
    @drinks_ollection = drinks
    @till = till
    @entryfee = 5
  end

  def till
    return @till
  end

  def fee(customer, room)
    return if customer.money <=4.99
    return if @rooms[room].number >= @rooms[room].capacity
    @till += 5
    @customer.money -= 5
    @rooms[room].check_in
  end




  #
  # def method_name
  #
  # end

end
