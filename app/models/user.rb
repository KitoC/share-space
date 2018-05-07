class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :address, as: :addressable

  has_many :photos, as: :photoable
  has_many :reviews, as: :reviewable
  has_many :sharespace_venues
  has_many :bookings
  has_many :collab_space_listings

  after_create :tasks


# These next methods set what the user can and cannot do.
  def admin_only
    self.has_role?(:admin)
  end

  def can_create?
    self.has_role?(:admin) || self.has_role?(:basic)
  end

  def owner?(owner)
    self.has_role?(:admin) || owner == self
  end

  def can_update?(object)
    self.has_role?(:admin) || (self.has_role?(:basic) && object.user == self)
  end

  def can_destroy?(object)
    self.has_role?(:admin) or (self.has_role?(:basic) && object.user == self) or self.has_role?(:moderator)
  end

  private
# This method runs multiple methods for the "after_create" method that runs the methods once a new user has signed up.
  def tasks
    set_address
    set_role
    UserNotifierMailer.send_signup_email(self).deliver
  end

# Sets an empty address for each new user which they can update and fill out at a later date.
  def set_address
    self.build_address.save
  end

# Adds a basic role with limited functions to a new user. Currently basic can do anything but in the futureI plan to incorporate "premium" membership roles (add_role :premium_member) if they pay a subscription.
  def set_role
    self.add_role :basic
  end



end
