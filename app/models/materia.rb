class Materia < ActiveRecord::Base
  has_many :instructores
  attr_accessible :nombre, :sigla
 

   validates :nombre, :presence => true, :length => { :maximum => 40 }
   validates :sigla, :presence => true, :length => { :maximum =>  5 }
  

   def self.search(search)
		where('nombre  like ?', "%#{search}%")
	end

	
end
