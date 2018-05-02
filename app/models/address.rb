class Address < ApplicationRecord
  geocoded_by :full_street_address
  belongs_to :addressable, polymorphic: true, optional: true

  def full_street_address
    "#{street_num}, #{street_name}, #{street_type}, #{city_suburb}, #{state}"
  end
  def vague_address
    "#{city_suburb}, #{state}"
  end
end
