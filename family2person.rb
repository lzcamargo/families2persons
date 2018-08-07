module Family2Person	
	bloom :family2person do  
		male <= families {|f| [[f.last_name, f.first_name].join(" ")] if (f.role == "father" or f.role == "sons")}  
		female <= families {|f| [[f.last_name, f.first_name].join(" ")] if (f.role == "mother" or f.role == "daughters")}
	end
end	



