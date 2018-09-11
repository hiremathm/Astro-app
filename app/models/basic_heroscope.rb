require 'net/http'
require 'uri'

class BasicHeroscope < ActiveRecord::Base
	validates_presence_of :name, :time, :birth_place, :date
	belongs_to :user
	@@baseURL = "http://api.vedicrishiastro.com/v1/"

	before_save :determine_lat_and_long, :get_basic_heroscope_details


	def change
		self.update_attributes(name: "Aishu weds Shivu")
	end

	private

	def determine_lat_and_long
		results = Geocoder.search(self.birth_place)
		results.first.coordinates[0]
		self.lat = results.first.coordinates[0]
		self.lon = results.first.coordinates[1]
	end

	def get_basic_heroscope_details
		
		userID = "602816"
		apiKey = "e10e6338e687949cc20f8a2ab4938860"

		data = {
			'day' => self.date.day,
			'month' => self.date.month,
			'year' => self.date.year,
			'hour' => self.time.hour,
			'min' => self.time.min,
			'lat' => self.lat,
			'lon' => self.lon,
			'tzone' => self.tzone
		}
		resource = "astro_details"
		url = URI.parse(@@baseURL+ resource)
	    req = Net::HTTP::Post.new(url)
	    req.basic_auth userID, apiKey
	    req.set_form_data(data)
	    resp = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
		result = JSON.parse(resp.body)
		
		self.ascendant = result["ascendant"]
    	self.varna = result["Varna"] 
    	self.vashya = result["Vashya"]
    	self.yoni = result["Yoni"]
    	self.gana = result["Gan"]
    	self.nadi = result["Nadi"]
    	self.rashi_adipathi = result["SignLord"]
    	self.rashi = result["sign"]
    	self.nakshtra = result["Naksahtra"]
    	self.nakshtra_adipathi = result["NaksahtraLord"]
    	self.charan = result["Charan"]
    	self.yog = result["Yog"]
    	self.karan = result["Karan"]
    	self.tithi = result["Tithi"]
    	self.yunja = result["yunja"]
    	self.tatva = result["tatva"]
    	self.name_alphabet =  result["name_alphabet"]
    	self.paya = result["paya"]
	end
end
