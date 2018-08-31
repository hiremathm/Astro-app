ActiveAdmin.register User do
	# menu priority: 1
	# menu parent: "All Users"
	
	# sidebar "Heroscope details", only: [:show , :edit] do 
	# 	ul do 
	# 		li "basic_heroscopes", admin_user_basic_heroscopes_path(resource)
	# 	end
	# end

	permit_params :email, :password, :password_confirmation

	#filters
	filter :email
	index do 
		selectable_column 
		id_column
		column :email
		actions
	end

	# #Partial forms
	# form partial: 'form'

	# insert_tag_active_askmonk_form_for users do |f|
	# 	inputs :email, :passowrd, :password_confirmation
	# end

	# #form 

	form do |f|
		f.semantic_errors *f.object.errors.keys
		tabs do 
			tab 'Basic' do 
				f.inputs 'Basic Details' do 
					f.input :email
					f.input :password
					f.input :password_confirmation
				end
			end
		end
		f.actions
	end

	#config.create_another = true

	show do 
		# columns do
		#   column do
		#     b "Column #1"
		#   end
		# end
		panel "User details" do 
			attributes_table_for user do 
				row :id
				row :email
				row 'Your Heroscopes' do 
					user.basic_heroscopes.each do |heroscope|
					br
						a heroscope.name, href: askmonk_basic_heroscope_path(heroscope)
            			text_node "&nbsp;".html_safe
					end
				end
			end
			# table_for user do 
			# 	column "Email", :email
			# 	column "Heroscopes" do 
			# 		user.basic_heroscopes.each do |heroscope|
			# 			b 
			# 				heroscope.name
			# 		end
			# 	end
			# end
		end	
	end
end
