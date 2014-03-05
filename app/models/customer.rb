class Customer < ActiveRecord::Base
  has_many :visits
  has_many :businesses, through: :visits
end
