require 'spec_helper'

describe UsersController do
  login_admin

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  # NOTE: To create or modify a user, one must also supply a user_type
  let(:valid_attributes) { {email: 'foo@bar.com', password: 'thepassword', name: "Mr. User" } }

  describe "GET index" do
    it "assigns all users as @users" do
      user = User.first
      get :index, {}
      assigns(:users).should eq([user])
    end

    it "doesn't allow unauthorized users" do
      @request.env["devise.mapping"] = Devise.mappings[:intern]
      sign_in FactoryGirl.create(:intern, email: "intern@lujeri.com")

      get :index
      response.status.should eq(302)
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = User.first
      get :show, {:id => user.to_param}
      assigns(:user).should eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}
      assigns(:user).should eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes, :user_type => :Admin}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes, :user_type => :Admin}
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the created user" do
        post :create, {:user => valid_attributes, :user_type => :Admin}
        response.should redirect_to(user_path(User.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => {  }, user_type: :Admin}
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, {:user => {  }, user_type: :Admin}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        user = User.create! valid_attributes
        # Assuming there are no other users in the database, this
        # specifies that the User created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => user.to_param, :user => { "these" => "params" }}
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}
        assigns(:user).should eq(user)
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes, user_type: :Admin}
        response.should redirect_to(user_path(user))
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => {  }}
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => {  }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, {:id => user.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = User.create! valid_attributes
      delete :destroy, {:id => user.to_param}
      response.should redirect_to(users_url)
    end
  end

end
