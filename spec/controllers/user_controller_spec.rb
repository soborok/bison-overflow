require 'spec_helper'
require 'rails_helper'

describe UsersController do

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "renders the :new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      xit "creates a new user" do
        expect{ post :create, user: FactoryGirl.attributes_for(:user) }.to change(User, :count).by(1)
      end
    end
  end


  describe "GET #login" do
    it "renders the :login view" do
      get :login
      expect(response).to render_template :login
    end
  end

end
