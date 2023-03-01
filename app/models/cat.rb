class Cat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :comments


  def self.map_data()
    lat_lon_arr = []
    Cat.all.each do |cat|
      cat_hash =  Hash.new
      cat_hash['latitude'] = cat.latitude
      cat_hash['logitude'] = cat.longitude
      cat_hash['label'] = cat.alias
      cat_hash['tooltip'] = "<a href='/cat/#{cat.id}'>#{cat.alias}</a>"
      lat_lon_arr << cat_hash.to_json
      lat_lon_arr
    end
  end



end


