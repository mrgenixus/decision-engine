require 'spec_helper'

describe Query do
  
  it "should return a Query object, given a slash-delimited call" do
    {
      '/api/json/asset/create' => {:access_type => 'api', :format => 'json', :controller => 'asset', :action => 'create'},
      '/web/html/person/delete' => {:access_type => 'web', :format => 'html', :controller => 'person', :action => 'delete'},
    }.each do |route, query_properties|
      query = Query.new(route)
      query.should be_a(Query)
      query.access_type.should == query_properties[:access_type]
      query.format.should == query_properties[:format]
      query.controller.should == query_properties[:controller]
      query.action.should == query_properties[:action]
    end
    
  end
  
  it "should return the same object, regardless or the case of the specified route" do
    query1 = Query.new('/api/json/asset/create')
    query2 = Query.new('/API/JSON/ASSET/CREATE')
    query1.access_type.should == query2.access_type
    query1.format.should == query2.format
    query1.controller.should == query2.controller
    query1.action.should == query2.action
  end
  
end