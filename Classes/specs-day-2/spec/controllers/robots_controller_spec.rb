require 'rails_helper'

RSpec.describe RobotsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns the robots instance variable" do
      robot = FactoryGirl.create(:friendly_robot)
      get :index
      expect(assigns(:robots)).to eq([robot])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      robot = FactoryGirl.create(:friendly_robot)
      get :show, id: robot.id
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      robot = FactoryGirl.create(:friendly_robot)
      get :show, id: robot.id
      expect(response).to render_template(:show)
    end

    it "sets the robot instance variable" do
      robot = FactoryGirl.create(:friendly_robot)
      get :show, id: robot.id
      expect(assigns(:robot)).to eq(robot)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "creates a new robot successfully" do
      expect(Robot.count).to eq(0)
      post :create, {robot: {name: 'New', friendly: true}}
      expect(Robot.count).to eq(1)
      expect(Robot.last.name).to eq('New')
      expect(Robot.last.friendly).to eq(true)
    end

    it "fales to create a new robot with a blank name" do 
      expect(Robot.count).to eq(0)
      post :create, {robot: {name: '', friendly: true}}
      expect(Robot.count).to eq(0)
    end

    it "redirects after a create" do
      expect(Robot.count).to eq(0)
      post :create, {robot: {name: 'New', friendly: true}}
      expect(response).to have_http_status(:redirect)
    end

    it "renders the new template if it fails" do
      expect(Robot.count).to eq(0)
      post :create, {robot: {name: '', friendly: true}}
      expect(Robot.count).to eq(0)
      expect(response).to render_template(:new) 
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      robot = FactoryGirl.create(:friendly_robot)
      put :edit, id: robot.id
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      robot = FactoryGirl.create(:friendly_robot)
      get :edit, id: robot.id
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT #update" do
    it "updates a robot successfully" do
      robot = FactoryGirl.create(:friendly_robot)
      expect(robot.name).to eq('Bob')
      put :update, {id: robot.id, robot: {name: 'Jake'}}
      expect(robot.reload.name).to eq('Jake')
      expect(response).to have_http_status(:redirect)
    end

    it "does not update with a blank name" do
      robot = FactoryGirl.create(:friendly_robot)
      expect(robot.name).to eq('Bob')
      put :update, {id: robot.id, robot: {name: ''}}
      expect(robot.reload.name).to eq('Bob')
    end
  end

  describe "DELETE #destroy" do
    it "deletes a robot successfully" do
      robot = FactoryGirl.create(:friendly_robot)
      expect(Robot.count).to eq(1)
      delete :destroy, id: robot.id
      expect(Robot.count).to eq(0)
    end
  end

end
