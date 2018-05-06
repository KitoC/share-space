class Booking < ApplicationRecord
  resourcify
  belongs_to :user
  belongs_to :sharespace

  after_create :tasks_on_create

  def tasks_on_create
    cost_days_math
    set_paid_status
  end

  private

  def set_paid_status
    self.update(paid: false)
  end

  def cost_days_math
    total_days = (self.date_to - self.date_from).to_i + 1
    total_cost = self.sharespace.cost * total_days
    self.update(total_days: total_days, total_cost: total_cost)
  end
end
