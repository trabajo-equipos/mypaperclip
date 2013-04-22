class Estudiante < ActiveRecord::Base
  belongs_to :curso
  
    attr_accessible :cedula, :direccion, :email, :fcha_nacimineto, :nombre, :curso_id

    validates :nombre, :presence => true, :length => { :maximum => 40 }

	validates :email, :presence => true,
	:uniqueness => true, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

	validates :cedula, :presence => true, :length => { :minimum => 10, :maximum => 15 },
	:numericality => true
        
	
    

    def self.search(search)
		where('nombre like ?', "%#{search}%")
	end
end
