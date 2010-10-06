require 'spec_helper'

describe EffortsController do

  def mock_effort(stubs={})
    @mock_effort ||= mock_model(Effort, stubs)
  end

  describe "GET index" do
    it "assigns all efforts as @efforts" do
      Effort.stub(:find).with(:all).and_return([mock_effort])
      get :index
      assigns[:efforts].should == [mock_effort]
    end
  end

  describe "GET show" do
    it "assigns the requested effort as @effort" do
      Effort.stub(:find).with("37").and_return(mock_effort)
      get :show, :id => "37"
      assigns[:effort].should equal(mock_effort)
    end
  end

  describe "GET new" do
    it "assigns a new effort as @effort" do
      Effort.stub(:new).and_return(mock_effort)
      get :new
      assigns[:effort].should equal(mock_effort)
    end
  end

  describe "GET edit" do
    it "assigns the requested effort as @effort" do
      Effort.stub(:find).with("37").and_return(mock_effort)
      get :edit, :id => "37"
      assigns[:effort].should equal(mock_effort)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created effort as @effort" do
        Effort.stub(:new).with({'these' => 'params'}).and_return(mock_effort(:save => true))
        post :create, :effort => {:these => 'params'}
        assigns[:effort].should equal(mock_effort)
      end

      it "redirects to the created effort" do
        Effort.stub(:new).and_return(mock_effort(:save => true))
        post :create, :effort => {}
        response.should redirect_to(effort_url(mock_effort))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved effort as @effort" do
        Effort.stub(:new).with({'these' => 'params'}).and_return(mock_effort(:save => false))
        post :create, :effort => {:these => 'params'}
        assigns[:effort].should equal(mock_effort)
      end

      it "re-renders the 'new' template" do
        Effort.stub(:new).and_return(mock_effort(:save => false))
        post :create, :effort => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested effort" do
        Effort.should_receive(:find).with("37").and_return(mock_effort)
        mock_effort.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :effort => {:these => 'params'}
      end

      it "assigns the requested effort as @effort" do
        Effort.stub(:find).and_return(mock_effort(:update_attributes => true))
        put :update, :id => "1"
        assigns[:effort].should equal(mock_effort)
      end

      it "redirects to the effort" do
        Effort.stub(:find).and_return(mock_effort(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(effort_url(mock_effort))
      end
    end

    describe "with invalid params" do
      it "updates the requested effort" do
        Effort.should_receive(:find).with("37").and_return(mock_effort)
        mock_effort.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :effort => {:these => 'params'}
      end

      it "assigns the effort as @effort" do
        Effort.stub(:find).and_return(mock_effort(:update_attributes => false))
        put :update, :id => "1"
        assigns[:effort].should equal(mock_effort)
      end

      it "re-renders the 'edit' template" do
        Effort.stub(:find).and_return(mock_effort(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested effort" do
      Effort.should_receive(:find).with("37").and_return(mock_effort)
      mock_effort.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the efforts list" do
      Effort.stub(:find).and_return(mock_effort(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(efforts_url)
    end
  end

end
