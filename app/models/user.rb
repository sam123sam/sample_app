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
  attr_accessible :name, :is_admin, :as=> :admin
  	
  has_many :microposts, :dependent=> :destroy
  has_many :relationships, :foreign_key=> "follower_id", :dependent=> :destroy
	has_many :followed_users, :through=> :relationships, :source=> :followed
	
	has_many :reverse_relationships, :foreign_key=> "followed_id",
                                   :class_name=>  "Relationship",
                                   :dependent=>   :destroy
  has_many :followers, :through=> :reverse_relationships, :source=> :follower
	
	
	
	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
	
	validates :name, :presence=> true, :length=> { :maximum=> 31 }
			
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence=> true, :format=> {:with=> VALID_EMAIL_REGEX}, :uniqueness=> { :case_sensitive=> false } 
	validates :password,:length=> { :minimum=> 6 }
	validates :password_confirmation, :presence=> true
	
	validates :University, :presence=> true, :length=> { :maximum=> 101 }
	validates :Highschool, :presence=> true, :length=> { :maximum=> 101 }

	
	
	
	def feed
   	# This is preliminary. See "Following users" for the full implementation.
    	Micropost.where("user_id = ?", id)
  	end
		
	def feed
    	Micropost.from_users_followed_by(self)
  	end
  
	def following?(other_user)
   	relationships.find_by_followed_id(other_user.id)
  	end

  	def follow!(other_user)
   	relationships.create!(:followed_id=> other_user.id)
  	end
  		
  	def unfollow!(other_user)
   	relationships.find_by_followed_id(other_user.id).destroy
  	end
  
	def new
  		@user = User.new
    
  		@user = User.new({ :name => 'simon8899', :is_admin => true }, :as => :admin)
  		
		@user.name # => simon8899
		@user.is_admin # => true
	end
	
	private
	
		def create_remember_token
			self.remember_token = SecureRandom.hex
		end
			
				
end
	
	
	
	
	
	
	
