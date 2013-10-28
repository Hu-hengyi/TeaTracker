require 'spec_helper'

describe FarmsController do

   describe "Adding new farms" do
     it "should render the create new farm form" do
        get :new
        response.should render_template("new")
     end
     #it "should try to create farm in database when user tries to create a new farm" do 
     #   fake_farm = double('farm', :name => "Fake Name")
     #   Farm.should_receive(:create!).and_return(fake_farm)
     #   post :create, {:farm=>fake_farm}   
     #end  
   end

   describe "Deleting Farms" do
     it "should try to destroy farm in database when user tries to delete a farm" do 
        fake_farm = double('farm', :name => "Fake Name")
        Farm.stub(:find).and_return(fake_farm)
        fake_farm.should_receive(:destroy)
        post :destroy, {:id=>25}      
     end  
     it "should redirect to farms page after deleting a movie" do 
        fake_farm = double('farm', :name => "Fake Name")
        Farm.stub(:find).and_return(fake_farm)
        fake_farm.stub(:destroy)
        post :destroy, {:id=>25}
        response.should redirect_to(farms_path)      
     end
   end

   describe "Editing Existing Famrs" do  
     it "should render the edit page when try to edit a movie" do 
        Farm.stub(:find)
        get :edit, {:id => 25}
        response.should render_template('edit')
     end
     it "should try to find the movie to be edited" do 
        fake_farm = double('farm', :name => "Fake Name")
        new_farm = double('farm', :name => "New Name")
        Farm.should_receive(:find).and_return(fake_farm)
        fake_farm.stub(:update_attributes!)
        put :update, {:id=>25, :farm=>new_farm}  
     end
     it "should try to update movie in database when user tries to edit a movie" do 
        fake_farm = double('farm', :name => "Fake Name")
        new_farm = double('farm', :name => "New Name")
        Farm.stub(:find).and_return(fake_farm)
        fake_farm.should_receive(:update_attributes!)
        put :update, {:id=>25, :farm=>new_farm}     
     end
     it "should redirect to the movie page after movie has been edited" do
        fake_farm = double('farm', :name => "Fake Name")
        new_farm = double('farm', :name => "New Name")
        Farm.stub(:find).and_return(fake_farm)
        fake_farm.stub(:update_attributes!)
        put :update, {:id=>25, :farm=>new_farm}    
        response.should redirect_to(farm_path(fake_farm))
     end
   end

end
