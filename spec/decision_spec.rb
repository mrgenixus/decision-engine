# 1. I want to instantiate the Controller
#   - Where Controller is a named controller specified by Query
# 2. I want to call a method of the controller, where the method is the named action specified by the Query object
#   - should return a Hash
# 3. I want pass the hash returned by the named action to a Presenter object
# 4. I want to dyanically call a presenter object

require "spec_helper"
require 'decision'
require 'user_controller'
require 'asset_controller'

describe Decision do
  
  
  it "returns a named controller" do
    puts Decision.find_controller('user')
    Decision.find_controller('user').should be_a(UserController)
    Decision.find_controller('asset').should be_a(AssetController)
  end
  
  it "instantiates a controller, given a query" do
    query = Query.new "/json/user/create"
    #UserController.should_receive(:new)  #this line is bad!! it changes :new so that the (nonexistent) return value is (by extrapolation) nil
    Decision.find_controller('user').should be_a(UserController)
    decision = Decision.new(query.controller, query.action)
    decision.controller.should be_a(UserController)
    decision.action.should == :create
  end
  
  # it "runs the action and recieves a hash" do
  #   query = Query.new "/json/user/create"
  #   decision = Decision.new(query.controller, query.action)
  #   decision.run.should be_a(Hash)
  # end
  # 
  # it "runs the action with parameters" do
  #   query = Query.new "/json/user/create"
  #   decision = Decision.new(query.controller, query.action)
  #   decision.run.should be_a(Hash)
  # end
  
end