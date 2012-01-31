class Query
  
  attr_accessor :format
  attr_accessor :controller
  attr_accessor :action
  
  def initialize(route)
    route_pieces = route.downcase.split('/')
    @format      = route_pieces[1]
    @controller  = route_pieces[2]
    @action      = route_pieces[3]
  end
  
end