require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get 'index'
      expect(response).to render_template("index")
    end

    it "responds with success" do
      expect(response).to be_success
    end
  end
end
