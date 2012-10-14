require 'rubygems'
require 'httparty'

class Unistats
  include HTTParty
  format :json
  
  base_uri 'data.unistats.ac.uk/api/KIS'
  
  def initialize(access_token)
    self.class.basic_auth access_token, nil
  end
  
  def institutions(pageIndex=0, options={})
    options.merge!({:query => {:pageIndex => pageIndex}})
    self.class.get("/Institutions.json", options)
  end
    
end
    
    