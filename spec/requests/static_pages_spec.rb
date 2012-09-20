require 'spec_helper'

describe "StaticPages" do

  describe "home page" do
  	before { visit root_path }
	  
      it { should have_selector('h2', :text=> 'where people meet')} 
    	it { should have_selector('h1', :text=> 'Welcome to tripple dating')}	
    	it { should have_selector('title', :text=> "tripple")}
		it { should_not have_selector('title', :text=> "home")}
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

  end


