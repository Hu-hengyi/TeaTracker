require 'spec_helper'

describe CpsController do
  login_admin

  before(:each) do
    @farm = create(:farm)
  end

  describe "Displaying collection points list" do
     it "should render the index page" do
       get :index
       expect(response).to render_template("index")
     end
   end

   describe "Show collection point data" do
     it "should display collection point data" do
       Cp.stub(:find).and_return(@farm)
       get :show, :id => 1
       response.should render_template('show')
     end
   end

   describe "Adding new collection points" do
     it "should try to create cp in database when user tries to create a new cp" do 
        fake_cp = double('cp', :name => "Fake Name")
        Cp.should_receive(:create!).and_return(fake_cp)
        post :create, {:cp => fake_cp}   
     end  
     it "should try to create cp in database when user tries to create a new cp" do 
        fake_cp = double('cp', :name => "Fake Name")
        Cp.stub(:create!).and_return(fake_cp)
        post :create, {:cp => fake_cp}  
        response.should redirect_to(cps_path) 
     end 
   end

   describe "Editing Existing Collection Points" do  
     it "should render the edit page when try to edit a colllection point" do 
        Cp.stub(:find)
        get :edit, {:id => 25}
        response.should render_template('edit')
     end
     it "should try to find the cp to be edited" do 
        fake_cp = double('cp', :name => "Fake Name")
        new_cp = double('cp', :name => "New Name")
        Cp.should_receive(:find).and_return(fake_cp)
        fake_cp.stub(:update_attributes!)
        put :update, {:id=>25, :cp=>new_cp}  
     end
     it "should try to update cp in database when user tries to edit a cp" do 
        fake_cp = double('cp', :name => "Fake Name")
        new_cp = double('cp', :name => "New Name")
        Cp.stub(:find).and_return(fake_cp)
        fake_cp.should_receive(:update_attributes!)
        put :update, {:id=>25, :cp=>new_cp}     
     end
     it "should redirect to the cp page after cp has been edited" do
        fake_cp = double('cp', :name => "Fake Name")
        new_cp = double('cp', :name => "New Name")
        Cp.stub(:find).and_return(fake_cp)
        fake_cp.stub(:update_attributes!)
        put :update, {:id=>25, :cp=>new_cp}    
        response.should redirect_to(cp_path(fake_cp))
     end
   end

   describe "Deleting Collection Points" do
     it "should try to destroy cp in database when user tries to delete a cp" do 
        fake_cp = double('cp', :name => "Fake Name")
        Cp.stub(:find).and_return(fake_cp)
        fake_cp.should_receive(:destroy)
        post :destroy, {:id=>25}      
     end  
     it "should redirect to cps page after deleting a movie" do 
        fake_cp = double('cp', :name => "Fake Name")
        Cp.stub(:find).and_return(fake_cp)
        fake_cp.stub(:destroy)
        post :destroy, {:id=>25}
        response.should redirect_to(cps_path)      
     end
   end

end
