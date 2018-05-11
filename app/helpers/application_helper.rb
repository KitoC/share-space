module ApplicationHelper
  # Sets a default profile image if the image location doesnt have one already.
  def profile_photo_display(obj, photo_class)
    if obj.photos.count == 0
      image_tag("default-image.png", class: "#{photo_class}_image")
    elsif photo_class == "url_only"
      if obj.profile_photo != nil
        Photo.find(obj.profile_photo).image_url
      else
        obj.photos.first.image_url
      end
    elsif  obj.profile_photo != nil
      image_tag Photo.find(obj.profile_photo).image_url(:large)
    else
      image_tag obj.photos.first.image_url(:large)
    end
  end

  # Review calculater. Calculates all of the objs ratings and provides an average.
  def rating_average(obj)
    if obj.reviews.count >= 1
      array = []
      obj.reviews.each do |review|
        array.push(review.rating)
      end
      return (array.inject{ |sum, el| sum + el }.to_f / array.size).to_i
    else
      if obj.class.name == "SharespaceVenue"
        "No reviews yet."
      else
        "No reviews yet."
      end
    end



  end

  # This method returns the first 25 characters of an objs description if needed for a brief description.
  def short_description(description)
    if description != nil
      "#{description[0..25]}..."
    else
      "No description yet..."
    end
  end

  # This sets an array of the last 5 newly created & highest ranked blogs, listings or projects.
  def featured_item(items)

  end

  # This method sets an address placeholder if the user hasn't updated their address yet.
  def address_check(obj)
    if obj.address.vague_address == nil
      "No address provided."
    else
      obj.address.vague_address
    end
  end

  # This method calculated the price range of a share space listing
  def price_range(obj)
    if obj != nil && obj.sharespaces.count > 0
      if obj.sharespaces.order(cost: :desc).first.cost == 0.0 or nil
        "Free"
      else
        "From $#{obj.sharespaces.order(cost: :desc).first.cost.round(2)}"
      end

    else
      "No sharespaces yet."
    end
  end




end
