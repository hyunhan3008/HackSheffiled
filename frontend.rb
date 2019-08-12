require 'erb'
require 'sinatra'
require 'sqlite3'
require 'geocoder'
require 'net/http'
require 'json'
require_relative 'twitter.rb'


set :bind, '0.0.0.0' # Only needed if you're running from Codio

include ERB::Util

#$geo = https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyD0WHTeO_dZRNUEJFlpprCBlDKon-65Ocs

#home page
get '/' do
    erb :index1
end

post '/submit' do
    @description = params[:description].strip
    @iserror = false
    @number = 0
    
    
    @json_response = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@description}&key=AIzaSyD0WHTeO_dZRNUEJFlpprCBlDKon-65Ocs"
    url =  @json_response
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed_json = JSON.parse(response)
    @status = parsed_json['status']
    
    if @status == "OK" then
    lat = parsed_json['results'][0]['geometry']['location']['lat']
    longitude = parsed_json['results'][0]['geometry']['location']['lng']
    place_id = parsed_json['results'][0]['place_id']
    @number = twitter_loop($client, lat, longitude, 50)  
        
    @json_place_response = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&key=AIzaSyD0WHTeO_dZRNUEJFlpprCBlDKon-65Ocs"
    urlImage =  @json_place_response
    uriImage = URI(urlImage)
    responseImage = Net::HTTP.get(uriImage)
    parsed_json_image = JSON.parse(responseImage)
    
    num_photos = parsed_json_image['result']['photos'].length
    puts "Photos length: #{num_photos}"
    number = rand(num_photos)
    image_reference = parsed_json_image['result']['photos'][number]['photo_reference']
    image_width = parsed_json_image['result']['photos'][number]['width']
    @photo_reference = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{image_reference}&key=AIzaSyD0WHTeO_dZRNUEJFlpprCBlDKon-65Ocs"
    
    urlPhoto =  @photo_reference
    uriPhoto = URI(urlPhoto)
    response = Net::HTTP.get(uriPhoto)
    shortened_response = response[response.index("HREF=") + 6, response.length]
    @imageUrl = shortened_response[0, shortened_response.index("=")]
    puts "back end #{@imageUrl}"
        
    end
    
    if @status != "OK" then
        @iserror = true
        #@error = "That is not a correct location"
        #redirect '/'
    end
        
   
   
   puts @number
        
    puts lat
    puts longitude
    puts status
    puts @description 
    
     erb :index1  
end




