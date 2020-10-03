class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url ='https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20782&distance=25&API_KEY=4539CF71-8421-4009-9AE7-507F7A0D0A44'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    #check for error
    if @output.empty?
      @final_ouput = "Error"

    elsif !@output
      @final_ouput = 'Error'
    else
      @final_ouput = @output[0]['AQI']
    end
  end
end
