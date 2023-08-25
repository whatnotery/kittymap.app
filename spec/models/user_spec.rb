require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it "fails with invalid attributes" do
    user = User.create
    expect(user).to be_invalid
  end
end
