require File.join(File.dirname(__FILE__), '../spec_helper')

describe UsersController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end
  
  describe "GET new" do
    it "assigns a new user as @user" do
      controller.stub!(:is_admin).and_return(true)
      User.stub(:new).and_return(mock_user)
      get :new
      assigns[:user].should equal(mock_user)
      end
  end


  describe "GET edit" do
    it "assigns the requested user as @user" do
      controller.stub!(:current_user).and_return(mock_user)
      puts current_user.id.to_s + "----------------"
      get :edit, :id => "36"
      assigns[:user].should equal(mock_user)
    end
  end
  

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created user as @user" do
        controller.stub!(:is_admin).and_return(true)
        
        User.stub(:new).with({'user' => 'params'}).and_return(mock_user(:save => true))
        post :create, :user => {:user => 'params'}
        assigns[:user].should equal(mock_user)
      end

      it "redirects to the created user" do
        controller.stub!(:is_admin).and_return(true)
        
        User.stub(:new).and_return(mock_user(:save => true))
        post :create, :user => {}
        response.should redirect_to(projects_url)
      end
    end
  end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        controller.stub!(:is_admin).and_return(true)
        User.stub(:new).with({'these' => 'params'}).and_return(mock_user(:save => false))
        post :create, :user => {:these => 'params'}
       response.should render_template('new')
      end

      it "re-renders the 'new' template" do
        controller.stub!(:is_admin).and_return(true)
        User.stub(:new).and_return(mock_user(:save => false))
        post :create, :user => {}
        response.should render_template('new')
      end
    end

  

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested user" do
        controller.stub!(:current_user).and_return(mock_user(:update_attributes =>true))
        #User.should_receive(:find).with("37").and_return(mock_user)
        mock_user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user => {:these => 'params'}
      end

      it "assigns the requested user as @user" do
        controller.stub!(:current_user).and_return(mock_user(:update_attributes =>true))
        put :update, :id => "1"
        flash[:notice].should have_text("Profile successfully updated.")
        response.should redirect_to(root_url)
        #assigns[:flash].should equal("Successfully updated profile.")
      end

      it "redirects to the user" do
        controller.stub!(:current_user).and_return(mock_user(:update_attributes =>true))
        put :update, :id => "1"
        response.should redirect_to(root_url)
      end
      
      it "update_attributes returns false" do
        controller.stub!(:current_user).and_return(mock_user(:update_attributes =>false))
      put :update, :id => "1"
      response.should render_template('edit')
    end
    end
  end

    describe "with invalid params" do
      before :each do
        controller.stub!(:current_user).and_return(mock_user(:update_attributes =>true))
      end
      
      it "updates the requested user" do
        #User.should_receive(:find).with("37").and_return(mock_user)
        mock_user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user => {:these => 'params'}
      end

      it "assigns the user as @user" do
       # User.stub(:find).and_return(mock_user(:update_attributes => false))
        put :update, :id => "1"
        assigns[:user].should equal(mock_user)
      end

      it "re-renders the 'edit' template" do
       # User.stub(:find).and_return(mock_user(:update_attributes => false))
        put :update, :id => "1"
        response.should redirect_to(root_url)
      end
    end
end
