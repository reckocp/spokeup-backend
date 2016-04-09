class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :votes, dependent: :destroy

  def avg_ease
    votes.average(:ease).round(1).to_f
  end

  def avg_amenities
    votes.average(:amenities).round(1).to_f
  end

  def avg_safety
    votes.average(:safety).round(1).to_f
  end
end
