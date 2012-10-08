require 'spec_helper'

describe "StaticPages" do

  describe "home page" do
  	before { visit root_path }
	  
      it { should have_selector('h2', :text=> 'where people meet')} 
    	it { should have_selector('h1', :text=> 'Welcome to tripple')}	
    	it { should have_selector('title', :text=> "tripple")}
		it { should_not have_selector('title', :text=> "home")}
		
		
		describe "for signed-in users" do
      	let(:user) { FactoryGirl.create(:user) }
      	before do
       	 	FactoryGirl.create(:micropost, :user=> user, :content=> "Lorem")
       	 	FactoryGirl.create(:micropost,:user=> user, :content=> "Ipsum")
       	 	sign_in user
        		visit root_path
      	end

      	it "should render the user's feed" do
        		user.feed.each do |item|
          		page.should have_selector("li##{item.id}", :text=> item.content)
        		end
      	end

      	describe "follower/following counts" do
        		let(:other_user) { FactoryGirl.create(:user) }
        		before do
          		other_user.follow!(user)
          		visit root_path
        		end

        		it { should have_link("0 following", :href=> following_user_path(user)) }
        		it { should have_link("1 followers", :href=> followers_user_path(user)) }
      	end
      end
    end

     	
    
     
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get static_pages_index_path
      #response.status.should be(200)
  		
	  
	describe "help page" do
		before { visit help_path}
		it { should have_content('help')}
		it { should have_selector('title', :text=> 'Help')}
	end			
		
	
	describe "about page" do
		it { should have_selector('title', :text=> 'About Us')}
		it { should have_selector('h1', :text=> 'About Us')}
	end

	
	describe "contact page" do
		it { should have_selector('h1', :text=> 'Contact')}
		it { should have_selector('title', :text=> 'Contact')}
	end
	
	describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, :user=> user, :content=> "Lorem ipsum")
        FactoryGirl.create(:micropost, :user=> user, :content=> "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", :text=> item.content)
        end
      end
    end
  end

 


