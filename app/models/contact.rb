class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone_number

  validates :address, :email, :name, :phone_number, :presence => :true

  has_many :favorites
  has_many :users, :through => :favorites
end
