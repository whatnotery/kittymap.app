class AddSocialMediaUrlToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :social_media_url, :string
  end
end
