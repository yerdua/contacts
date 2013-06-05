class User < ActiveRecord::Base
  attr_accessible :email, :name, :password

  validates :email, :name, :password, :presence => true
  validates :email, :uniqueness => true

  has_many :contacts, :foreign_key => :owner_id
  has_many :favorites, :foreign_key => :owner_id
  has_many :favorite_contacts, :through => :favorites, :source => :contacts
  has_many :tokens
end
