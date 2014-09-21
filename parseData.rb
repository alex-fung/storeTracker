require "httparty"
require "json"

response = HTTParty.get("http://storetracker.herokuapp.com/api/location_points")

array = JSON.parse(response.body)

array1 = array.select{|obj| obj["beac1"] == "54317"}
array2 = array.select{|obj| obj["beac2"] == "54317"}
array3 = array.select{|obj| obj["beac3"] == "54317"}
                                                         
array1 = array1.map{|obj| [obj["dist1"], obj["timeSent"]]}
array2 = array2.map{|obj| [obj["dist2"], obj["timeSent"]]}
array3 = array3.map{|obj| [obj["dist3"], obj["timeSent"]]}
array = array1 + array2 + array3

CSV.open("54317.csv", "w") do |csv| #open new file for write
  array.each do |hash| #open json to parse
    csv << hash #write value to file
  end
end