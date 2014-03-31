class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :visits
  has_many :businesses, through: :visits
  has_many :rewards
  accepts_nested_attributes_for :visits, :allow_destroy => true
end
