module ApplicationHelper
  # Sets a default profile image if the image location doesnt have one already.
  def profile_photo_display(object, photo_class)
    if object.photos.count == 0
      image_tag("default-image.png", class: "#{photo_class}_image")
    elsif photo_class == "url_only"
      if object.profile_photo != nil
        Photo.find(object.profile_photo).image_url
      else
        object.photos.first.image_url
      end
    elsif  object.profile_photo != nil
      image_tag Photo.find(object.profile_photo).image_url(photo_class)
    else
      image_tag object.photos.first.image_url(photo_class)
    end
  end

  # Review calculater. Calculates all of the objects ratings and provides an average.
  def rating_average(object)
    if object.reviews.count >= 1
      array = []
      object.reviews.each do |review|
        array.push(review.rating)
      end
      return (array.inject{ |sum, el| sum + el }.to_f / array.size).to_i
    else
      if object.class.name == "SharespaceVenue"
        "No reviews yet."
      else
        "No reviews yet."
      end
    end
  end

  # This method returns the first 10 characters of an objects description if needed for a brief description.
  def short_description(description)
    if description != nil
      "#{description[0..10]}..."
    else
      "No description yet..."
    end
  end

  # This sets an array of the last 5 newly created & highest ranked blogs, listings or projects.
  def featured_item(items)

  end

  # This method sets an address placeholder if the user hasn't updated their address yet.
  def address(object)
    if object.address.vague_address == nil
      "No address provided."
    else
      object.address.vague_address
    end
  end

  # This method calculated the price range of a share space listing
  def price_range(object)
    if object.sharespaces != nil
      if object.sharespaces.order(cost: :desc).first.cost == 0.0 or nil
        "Free"
      else
        "From $#{object.sharespaces.order(cost: :desc).first.cost}"
      end

    else
      "No sharespaces yet."
    end
  end




end
