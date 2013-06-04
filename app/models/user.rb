class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :email, :name, :presence => true
  validates :email, :uniqueness => true

  has_many :favorites
  has_many :contacts, :through => :favorites
end
