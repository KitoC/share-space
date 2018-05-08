class Address < ApplicationRecord
  resourcify
  geocoded_by :full_street_address
  belongs_to :addressable, polymorphic: true, optional: true
  after_validation :geocode

  def full_street_address
    if city_suburb && state != nil
      "#{street_num} #{street_name} #{street_type}, #{city_suburb}, #{state}"
    end
  end
  def vague_address
    if city_suburb && state != nil
    "#{city_suburb}, #{state}"
    else
      nil
    end
  end
end
