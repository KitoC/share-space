class Review < ApplicationRecord
  resourcify
  belongs_to :reviewable, polymorphic: true, optional: true
  belongs_to :reference, polymorphic: true, optional: true
  after_create :tasks


  private
  def tasks
    set_reviewed_status
  end

  def set_reviewed_status
    if self.reference_type == 'Booking' && self.reference != nil
      self.reference.update(host_reviewed: true) if self.reviewable_type == 'SharespaceVenue'
      self.reference.update(user_reviewed: true) if self.reviewable_type == 'User'
    end
  end

end
