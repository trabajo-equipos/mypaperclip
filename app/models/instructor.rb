class Instructor < ActiveRecord::Base
  belongs_to :materia
  attr_accessible :cedula, :direccion, :email, :nombre, :materia_id, :avatar
 # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

   
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

