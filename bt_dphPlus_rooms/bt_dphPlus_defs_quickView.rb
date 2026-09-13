module BT

	module Quickview
		
		#Used to display a diaglog window with quick TFA and volume data
		#Requires the user to select some room objects

		def self.quickView(_sel)
			sel_tfa_total = []
			sel_vn50_total = []
			sel_vv_total = []
			alert1 = false
			alert2 = false

			_sel.each do |e|
				if e.typename == "ComponentInstance" # If its a component
					if e.definition.attribute_dictionaries['dynamic_attributes'] != nil # If the component has the dynamic_attributes dictionary applied
						if e.definition.attribute_dictionaries['dynamic_attributes']['tfa'] != nil # If the DPH+ dictionary is applied
							p '>>> Selection is a valid dPH+ object. Working on it....'
							p '>>> The Component Units are: '+"#{e.definition.attribute_dictionaries['dynamic_attributes']['dphunits']}"
							
							if e.definition.attribute_dictionaries['dynamic_attributes']['dphunits'] == 'SI'
								p '>>> Converting units to IP...'
								sel_tfa_total << e.definition.attribute_dictionaries['dynamic_attributes']['tfa'] * 10.7639 # Square meters to square feet
								sel_vn50_total << e.definition.attribute_dictionaries['dynamic_attributes']['vn50'] * 35.3147 # Cubic meters to cubic feet
								sel_vv_total << e.definition.attribute_dictionaries['dynamic_attributes']['vv'] * 35.3147 # Cubic meters to cubic feet
							else
								sel_tfa_total << e.definition.attribute_dictionaries['dynamic_attributes']['tfa']
								sel_vn50_total << e.definition.attribute_dictionaries['dynamic_attributes']['vn50']
								sel_vv_total << e.definition.attribute_dictionaries['dynamic_attributes']['vv']
							end 
						else
							puts '>>> Selection is a Dynamic Component, but doesnt have the dPH+ dictionary yet'
						end
					else
						#alert2 = TRUE
						puts '>>> Selection is a Component, but doesnt have the Dynamic Attributes dictionary attached'
					end		
				else
					puts '>>> Selection is not a component'
				end
			end

			#Show the quick view message
			msgTxt = <<-EOF
			#{_sel.count} Objects Selected
			#{sel_tfa_total.count} of them are valid dPH+ Room Objects
			
			Totals of Selected Rooms:
			-Total TFA: #{sel_tfa_total.sum.round(1)} ft2 [ #{(sel_tfa_total.sum * 0.092903).round(1)} m2 ]
			-Total Vn50: #{sel_vn50_total.sum.round(1)} ft3 [ #{(sel_vn50_total.sum * 0.0283168).round(1)} m3 ]
			-Total Vv: #{sel_vv_total.sum.round(1)} ft3  [#{(sel_vv_total.sum * 0.0283168).round(1)} m3 ]
			EOF

			UI.messagebox(msgTxt, MB_OK)

		end
	
	end

end