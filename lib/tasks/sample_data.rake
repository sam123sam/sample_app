require 'faker'
    
namespace :db do

	desc "Fill database with sample data"
		
	task :populate => :environment do

		admin = User.create!(:name=> "Example User",
						:email=> "examplewe@yahoo.com",
						:password=> "foobar",
                 :password_confirmation=> "foobar",
                 :University=> "KUCT",
                 :Highschool=> "Mosocho")
      admin.toggle!(:admin)
      
        99.times do |n|
        	name = Faker::Name.name
        	email = "examplewe-#{n+1}@yahoo.com"
        	password  = "password"
        	University = "KUCT"
        	Highschool = "Mosocho"
        	User.create!(:name=> name,
                   		:email=> email,
                   		:password=> password,
                   		:password_confirmation=> password,
                   		:University=> University,
                   		:Highschool=> Highschool)
 
   end
   

	def make_microposts       
     	users = User.all(limit=> 6)
    	50.times do
      	content = Faker::Lorem.sentence(5)
      	users.each { |user| user.microposts.create!(:content=> content) }
    	end
    end
    end
 end