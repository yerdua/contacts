class Favorite < ActiveRecord::Base
  attr_accessible :contact_id, :owner_id

  validates :contact_id, :owner_id, :presence => :true

  belongs_to :contact
  belongs_to :owner, :class_name => "User"
end
