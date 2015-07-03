require "rails_helper"

RSpec.describe Admin::DashboardController, type: :controller do
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  describe "GET index" do
    login_admin
    it "renders the index template" do
      get :index
      response.should render_template("index")
    end

    it "responds with success" do
      expect(response).to be_success
    end
  end
end
