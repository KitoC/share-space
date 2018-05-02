module FormHelper
  def set_listing_address(collab_space)
    collab_space.address ||= Address.new
    collab_space
  end
end
