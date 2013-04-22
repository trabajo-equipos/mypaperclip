class Curso < ActiveRecord::Base
  belongs_to :instructor
  has_many :estudiante
  attr_accessible :ficha, :nombre, :instructor_id

   validates :nombre, :presence => true, :length => { :maximum => 50 }
    validates :ficha, :presence => true, :length => { :maximum => 6 }


  def self.search(search)
		where('nombre like ?', "%#{search}%")
	end

 
end

