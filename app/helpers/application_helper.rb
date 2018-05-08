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
      return "Rating: #{(array.inject{ |sum, el| sum + el }.to_f / array.size).to_i}"
    else
      if object.class.name == "SharespaceVenue"
        "No reviews yet."
      else
        "No reviews yet."
      end
    end
  end



  def featured_item
    count = 5
    until count == 0
      count -+ 1
    end
  end


end
