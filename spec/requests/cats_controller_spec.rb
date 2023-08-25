require "rails_helper"

RSpec.describe "CatsControllers", type: :request do
  describe "GET /index" do
    it "should return the index view" do
      get "/"
      expect(response).to render_template(:index)
    end
  end
end
