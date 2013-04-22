class AddAvatarToInstructores < ActiveRecord::Migration
  def self.up
    add_attachment :instructores, :avatar
  end

  def self.down
    remove_attachment :instructores, :avatar
  end
end