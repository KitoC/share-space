class Address < ApplicationRecord
  geocoded_by :full_street_address

  def full_street_address
    "#{street_num}, #{street_name}, #{street_type}, #{city_suburb}, #{state}"
  end
  def vague_address
    "#{city_suburb}, #{state}"
  end
end
