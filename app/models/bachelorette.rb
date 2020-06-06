class Bachelorette <ApplicationRecord
  has_many :contestants

  def average_age
    require "pry"; binding.pry
  end
end
