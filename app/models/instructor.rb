class Instructor < ActiveRecord::Base
  belongs_to :materia
  attr_accessible :cedula, :direccion, :email, :nombre, :materia_id

   
	validates :cedula, :presence => true, :length => { :minimum => 10, :maximum => 15 },
	:numericality => true
   validates :direccion, :presence => true
    validates :email, :presence => true,
	:uniqueness => true, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :nombre, :presence => true, :length => { :maximum => 40 }
    validates :materia_id, :presence => true

  
  def self.search(search)
		where('nombre like ?', "%#{search}%")
	end
end
