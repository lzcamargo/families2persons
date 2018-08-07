require 'rubygems'
require 'bud'
require 'crack'
require_relative 'family2person'
require_relative 'collection2object'
require_relative 'obj2colprotocol'
require_relative 'loadmmodels'
require_relative 'loadmodels'
require_relative 'extractprotocol'

class Family 
	attr_accessor :members, :lastName
	
	def initialize
		@members = []
		@lastName = lastName
	end
	
	def add_member(role, firstName)
		@members = Member.new(role, firstName) 
	end	
	
end

class Member
	attr_accessor :role, :firstName 
	
	def initialize(role, firstName)
		@role = role 
		@firstName = firstName
	end	

end	

class Person
	attr_accessor :fullName
	
	def initialize
		@fullName = fullName
	end	

end	

class Male < Person

end

class Female < Person

end

class BloomInstances
	include Bud
	include Obj2ColProtocol
	include Family2Person	

	def instances(a,b,c)
		families <+ [[a,b,c]]
	end	

end 

class MonitorF2P
	include Bud
	include ExtractProtocol
	include LoadMModels
	include LoadModels
	include Collection2Object

end
# Object instnaces in Bloom collections
m = MonitorF2P.new
m.mmodelstobloom
m.modelstobloom
m.tick

m.family_name do |i| 
	m.family_members.each do |m|
		if i.fn_elm_ref == m.fm_elm_ref	
			f = Family.new()  
		  f.lastName = i.fn_elm_name
			f.members = [m.fm_elm_name, m.fm_elm_type]
			b = BloomInstances.new()
			b.instances(f.lastName, f.members[0], f.members[1]) 
			b.tick
			b.male do |l| 
				pm = Male.new
				pm.fullName = l.full_name
			end
			b.female do |f| 
				pf = Female.new
				pf.fullName = f.full_name
			end
		end	
	end
end

#TODO
#to use one of the components 'gyoku' 'builder'  for generating file im XML

