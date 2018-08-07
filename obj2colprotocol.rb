module Obj2ColProtocol
  state do #collection used for seting source and target object specifications
    table :families, [:last_name, :role, :first_name]
		table :male, [:full_name]
		table :female, [:full_name]
	end	
end	

