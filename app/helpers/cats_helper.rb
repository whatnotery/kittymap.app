module CatsHelper
  def map_data
    lat_lon_arr = []
    Cat.all.each do |cat|
      cat_hash = {}
      cat_hash["latitude"] = cat.latitude.to_f
      cat_hash["longitude"] = cat.longitude.to_f
      cat_hash["tooltip"] = link_to "😻 #{cat.name.titleize} 😻", cat, class: "hover:underline my-1 pl-3", data: {turbo_frame: "cat"}
      lat_lon_arr << cat_hash
    end
    if Cat.all.empty?
      [{latitude: 38.0406, longitude: -84.5037}]
    else
      lat_lon_arr
    end
  end
end
