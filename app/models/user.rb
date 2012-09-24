# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  University :string(255)
#  Highschool :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :Highschool, :University, :password_confirmation, :password, :email, :name
  has_secure_password
	
	before_save { |user| user.email = email.downcase }
	
	validates :name, :presence=> true, :length=> { :maximum=> 31 }
			
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence=> true, :format=> {:with=> VALID_EMAIL_REGEX}, :uniqueness=> { :case_sensitive=> false } 
	validates :password,:length=> { :minimum=> 6 }
	validates :password_confirmation, :presence=> true
	
	validates :University, :presence=> true, :length=> { :maximum=> 101 }
	validates :Highschool, :presence=> true, :length=> { :maximum=> 101 }

end
