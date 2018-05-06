module ApplicationHelper
  # Sets a default profile image if the image location doesnt have one already.
  def profile_photo_display(object, photo_class)
    if object.photos.count == 0
      image_tag("default-image.jpg", class: "#{photo_class}")
    elsif  object.profile_photo != nil
      image_tag Photo.find(object.profile_photo).image_url(:profile)
    else
      image_tag object.photos.first.image_url(:profile)
    end
  end

end
