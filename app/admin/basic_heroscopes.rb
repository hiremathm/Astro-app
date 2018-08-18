ActiveAdmin.register BasicHeroscope do
permit_params :name, :date,:time , :lat, :lon, :tzone, :ascendant, :varna, :vashya, :yoni, :gana, :nadi, :rashi_adipathi, :rashi, :nakshtra, :nakshtra_adipathi, :charan, :yog, :karan, :tithi, :yunja, :tatva, :name_alphabet, :paya, :birth_place, :user_id
	
	index do 
		id_column
		column :name
		column :date
		column :time
		column :birth_place
		column :user_id
	end
end
