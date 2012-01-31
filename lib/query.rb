class Query
  
  attr_accessor :access_type
  attr_accessor :format
  attr_accessor :controller
  attr_accessor :action
  
  def initialize(route)
    route_pieces = route.downcase.split('/')
    @access_type = route_pieces[1]
    @format      = route_pieces[2]
    @controller  = route_pieces[3]
    @action      = route_pieces[4]
  end
  
end