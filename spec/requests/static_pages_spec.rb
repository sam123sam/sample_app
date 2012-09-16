require 'spec_helper'

describe "StaticPages" do

  describe "home page" do
  
      it "should have the content 'sample app'" do 
    		visit '/staticpages/home'
    		page.should have_content('sample app')
    		    	   	
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get static_pages_index_path
      #response.status.should be(200)
    end
    
    it "should have the title 'home'" do
		visit '/staticpages/home'
		page.should have_selector('title',
                    :text => "ruby on rails tutorial sample app | home")
	end

  end
  
  
	describe "help page" do
	
		it "should have the content 'help'" do
			visit '/staticpages/help'
			page.should have_content('help')
		end
		
		it "should have the title 'help'" do
			visit '/staticpages/help'
			page.should have_selector('title',
										:text => "ruby on rails tutorial sample app | help")
		end
			
	 end 
  
  describe "about page" do
  	it "should have the content 'about us'" do  
  		visit '/staticpages/about'
  		page.should have_content('about us')
  	end

	it "should have the title 'about us'" do
		visit '/staticpages/about'
		pages.should have_selector('title',
									:text => "ruby on rails tutorial sample app | about us")	

  	end 
  
  end
    	
 end


