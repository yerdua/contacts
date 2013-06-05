class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone_number

  validates :address, :email, :name, :phone_number, :presence => :true

  belongs_to :owner, :class_name => 'User'
  has_one :favorite

end
