# ActiveAdmin.register User 
ActiveAdmin.register BasicHeroscope do 
	# belongs_to :user
	# menu priority: 1
	# scope_to :current_user
	#includes :users
	# scope "BasicHeroscope", :basic_heroscopes 
	#decorate_with BasicHeroscopeDecorator

	permit_params :name, :date,:time , :lat, :lon, :tzone, :ascendant, :varna, :vashya, :yoni, :gana, :nadi, :rashi_adipathi, :rashi, :nakshtra, :nakshtra_adipathi, :charan, :yog, :karan, :tithi, :yunja, :tatva, :name_alphabet, :paya, :birth_place, :user_id
	filter :name
	index do |heroscope|
		selectable_column
		index_column 
		id_column
		column "User Name", :name, sortable: :name do |heroscope|
			link_to heroscope.name, askmonk_basic_heroscope_path(heroscope)
		end
		column "Birth Date", :date
		column "Birth Time", :time, sortable: false
		column "Birth Place", :birth_place
		column "Record Belongs To", :user_id
		actions defaults: false do |heroscope|
	 	item "View", askmonk_basic_heroscope_path(heroscope), class: "member_link"
		end

		# actions defaults:false, dropdown: true do |heroscope|
		# 	item "View", askmonk_basic_heroscope_path(heroscope), class: "member_link"
		# 	item "Edit", edit_askmonk_basic_heroscope_path(heroscope), class: "member_link"
		# end
	end

	action_item :view_site do
  		link_to "View Site", "https://askmonk.herokuapp.com/"
  		#link_to "Get heroscope", askmonk_basic_heroscopes_path, method: :post
	end
	#To customize the filters
	config.filters = false
	#filter :name#, label: "Name of user" #_contains#, filters: [:starts_with, :ends_with]
	#filter :birth_place
	#filter :user_id, as: :check_boxes, collection: proc {User.all}

	#Default sorting order 
	config.sort_order = 'name_asc'

	#To add multipale index pages
	# index as: :grid do |heroscope|
	# link_to heroscope.name, askmonk_basic_heroscope_path(heroscope)
	# end

	#To display index as block , If you want to fully customize the display of your resources on the index screen, Index as a Block allows you to render a block of content for each resource.

	# index as: :block do |heroscope|
	# 	div for: heroscope do 
	# 		resource_selection_cell heroscope
	# 		h2 auto_link heroscope.name
	# 		div simple_format heroscope.birth_place
	# 	end
	# end

	# index as: :blog do 
	# 	title do |heroscope|
	# 		span heroscope.name, class: "name"
	# 		span heroscope.birth_place, class: "birth_place"
	# 	end 
	# end

	#To define scopes
	#scope :all, default: true

	#Pagination
	# controller do
 	#	before_action only: :index do
 	#	@per_page = 100
 	#	end
	# end

	#form
	form do |f|
		f.semantic_errors *f.object.errors.keys
		tabs do 
			tab 'Basic' do 
				f.inputs 'Basic Details' do 
					f.input :name
					f.input :time
					f.input :birth_place
					f.input :date, as: :datepicker, datepicker_options: {
						min_date: "1900-01-01",
						max_date: "2035-01-01"
					}
				end
			end
		end
		f.actions
	end

	#show 
	# show do 
	# 	attributes_table do 
	# 		row :name
	# 		row :birth_place
	# 		row :date
	# 		row :time
	# 	end
	# end
	# show do
 #    panel "Table of Contents" do
 #      table_for basic_heroscope do
 #        column :name
 #        column :time
 #        column :date
 #      end
 #    end
 #  end

  # sidebar "Details", only: :show do
  #   attributes_table_for basic_heroscope do
  #     row :name
  #     row :time
  #     row :date
  #   end
  # end

  sidebar "help", riority: 0 do
  	"Nedd help? Email us at mail4hiremath@gmail.com"
  end

  #config.batch_actions = true
  #batch_action :destroy, false

  batch_action :Update_Name do |ids|
  	batch_action_collection.find(ids).each do |heroscope|
  		heroscope.change
  	end
  	redirect_to collection_path, alert: "The heroscope have been updated Successfully"
  end

  #Overriding default destroy batch action
  # batch_action :destroy, confirm: "Are you sure?" do |ids|
  # 	redirect_to collection_path, alert: "Didn't really like to delete these!"
  # end


end
