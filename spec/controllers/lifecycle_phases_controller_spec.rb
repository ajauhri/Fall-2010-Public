require 'spec_helper'

describe LifecyclePhasesController do
setup :activate_authlogic
  
  #integrate_views

  def mock_lifecycle_phase(stubs={})
    @mock_lifecycle_phase ||= mock_model(LifecyclePhase, stubs)
  end
  
  before :each do
    logout_user
    login_user
  end

  it "display all phases based on the lifecycle" do
#    lifecyclephase = Factory.create(:lifecycle_phase)
#    lifecyclephase.lifecycle.name.should_not be_nil
     get :index, :id => Lifecycle.first
     response.should render_template(:index)
     #LifecyclePhase.find(:all,:conditions => ["lifecycle_id = ?", Lifecycle.first]).size.should > 0
     #LifecyclePhase.where(["lifecycle_id = ?", Lifecycle.first]).size.should == 9
  end



  describe "GET index" do
    it "assigns all lifecycle_phases as @lifecycle_phases" do
      LifecyclePhase.stub!(:find).with(any_args()).and_return(mock_lifecycle_phase)
      get :index
      assigns[:lifecycle_phases].should == mock_lifecycle_phase
    end
  end

  describe "GET show" do
    it "assigns the requested lifecycle_phase as @lifecycle_phase" do
      LifecyclePhase.stub!(:find).with("37").and_return(mock_lifecycle_phase)
      get :show, :id => "37"
      assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
    end
  end

  describe "GET new" do
    it "assigns a new lifecycle_phase as @lifecycle_phase" do
      LifecyclePhase.stub!(:new).and_return(mock_lifecycle_phase)
      get :new
      assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
    end
  end

=begin
  describe "GET edit" do
    # it "assigns the requested lifecycle_phase as @lifecycle_phase" do
    #              LifecyclePhase.stub!(:find).with(any_args()).and_return(mock_lifecycle_phase)
    #              get :edit, :id => "37"
    #              assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
    #              #LifecyclePhase.unstub!(:find)
    #            end
    end
=end

  describe "POST create" do
   
     describe "with valid params" do
       it "assigns a newly created lifecycle_phase as @lifecycle_phase" do
         LifecyclePhase.stub!(:new).with({'these' => 'params'}).and_return(mock_lifecycle_phase(:save => true))
         post :create, :lifecycle_phase => {:these => 'params'}
         assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
       end
     
       it "redirects to the created lifecycle_phase" do
         LifecyclePhase.stub!(:new).and_return(mock_lifecycle_phase(:save => true))
         post :create, :lifecycle_phase => {}
         response.should redirect_to(lifecycle_phase_url(mock_lifecycle_phase))
       end
     end
     
     describe "with invalid params" do
       it "assigns a newly created but unsaved lifecycle_phase as @lifecycle_phase" do
              LifecyclePhase.stub!(:new).with({'these' => 'params'}).and_return(mock_lifecycle_phase(:save => false))
              post :create, :lifecycle_phase => {:these => 'params'}
              assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
            end
     
       it "re-renders the 'new' template" do
         LifecyclePhase.stub!(:new).and_return(mock_lifecycle_phase(:save => false))
         post :create, :lifecycle_phase => {}
         response.should render_template('new')
       end
     end

   end

   describe "PUT update" do

     describe "with valid params" do
       it "updates the requested lifecycle_phase" do
         LifecyclePhase.should_receive(:find).with("37").and_return(mock_lifecycle_phase)
         mock_lifecycle_phase.should_receive(:update_attributes).with({'these' => 'params'})
         put :update, :id => "37", :lifecycle_phase => {:these => 'params'}
       end

       it "assigns the requested lifecycle_phase as @lifecycle_phase" do
         LifecyclePhase.stub!(:find).with(any_args()).and_return(mock_lifecycle_phase)
         @mock_lifecycle_phase.should_receive(:update_attributes).once.with({'these' => 'params'}).and_return(true)
         put :update, :id => "1", :lifecycle_phase => {:these => 'params'}
         assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
         flash[:notice] == "LfecyclePhase was successfully updated."
         response.should redirect_to(lifecycle_phase_url(@mock_lifecycle_phase))
       end

       it "redirects to the lifecycle_phase" do
         LifecyclePhase.stub!(:find).with(any_args()).and_return(mock_lifecycle_phase)
         @mock_lifecycle_phase.should_receive(:update_attributes).once.with({'these' => 'params'}).and_return(true)
         put :update, :id => "1", :lifecycle_phase => {:these => 'params'}
         response.should redirect_to(lifecycle_phase_url(@mock_lifecycle_phase))
       end
     end

     describe "with invalid params" do
       it "updates the requested lifecycle_phase" do
         LifecyclePhase.should_receive(:find).with("37").and_return(mock_lifecycle_phase)
         mock_lifecycle_phase.should_receive(:update_attributes).with({'these' => 'params'})
         put :update, :id => "37", :lifecycle_phase => {:these => 'params'}
       end

       it "assigns the lifecycle_phase as @lifecycle_phase" do
         LifecyclePhase.stub!(:find).and_return(mock_lifecycle_phase(:update_attributes => false))
         put :update, :id => "1"
         assigns[:lifecycle_phase].should equal(mock_lifecycle_phase)
       end

       it "re-renders the 'edit' template" do
         LifecyclePhase.stub!(:find).and_return(mock_lifecycle_phase(:update_attributes => false))
         put :update, :id => "1"
         response.should render_template('edit')
       end
     end

   end

   describe "DELETE destroy" do
     it "destroys the requested lifecycle_phase" do
       LifecyclePhase.should_receive(:find).with("37").and_return(mock_lifecycle_phase)
       mock_lifecycle_phase.should_receive(:destroy)
       delete :destroy, :id => "37"
     end

     it "redirects to the lifecycle_phases list" do
       LifecyclePhase.stubs(:find).returns(mock_lifecycle_phase(:destroy => true))
       delete :destroy, :id => "1"
       response.should redirect_to(lifecycle_phases_url)
     end
   end
 
end
