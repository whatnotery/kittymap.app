require "rails_helper"

RSpec.describe "CatsControllers", type: :request do
  describe "GET /index" do
    it "should render the index view" do
      get "/"
      expect(response).to render_template(:index)
    end
  end

  describe "GET /cats/:id" do
    it "should render the show view for the given cat" do
      cat = FactoryBot.create(:cat)
      get "/cats/#{cat.id}"
      expect(response).to render_template(:show)
    end
  end

  describe "GET /cats/:id/edit" do
    it "should render the edit view for the given cat" do
      cat = FactoryBot.create(:cat)
      get "/cats/#{cat.id}/edit"
      expect(response).to render_template(:edit)
    end
  end

  describe "POST /cats/" do
    it "should render the show view for the given cat" do
      user = FactoryBot.create(:user)
      cat = FactoryBot.build(:cat)
      passwordless_sign_in(user)
      post "/cats", params: {cat: {name: cat.name, description: cat.description, latitude: cat.latitude, longitude: cat.longitude}}
      expect(response).to redirect_to("/cats/#{cat.name.parameterize}")
      passwordless_sign_out
    end
  end
end
