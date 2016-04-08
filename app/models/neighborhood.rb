class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :votes

  def avg_ease
    votes.average(:ease).round(2).to_f
  end

  def avg_amenities
    votes.average(:amenities).round(2).to_f
  end

  def avg_safety
    votes.average(:safety).round(2).to_f
  end
end
